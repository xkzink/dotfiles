local wezterm = require("wezterm")

local function get_pwd(pane)
	-- url object
	local pwd_url = pane:get_current_working_dir()
	local pwd = tostring(pwd_url)
	pwd = pwd:gsub("^file://", "")
	return pwd
end

local function extract_filename(uri)
	local start, match_end = uri:find("$EDITOR:")
	if start == 1 then
		-- skip past the colon
		return uri:sub(match_end + 1)
	end

	-- `file://hostname/path/to/file`
	start, match_end = uri:find("file:")
	if start == 1 then
		-- skip "file://", -> `hostname/path/to/file`
		local host_and_path = uri:sub(match_end + 3)
		start, match_end = host_and_path:find("/")
		if start then
			-- -> `/path/to/file`
			return host_and_path:sub(match_end)
		end
	end

	return nil
end

local function extract_line_and_name(uri)
	local name = extract_filename(uri)

	if name then
		local line = 1
		-- check if name has a line number (e.g. `file:.../file.tsx:123` or `file:.../file.txt:123:456`)
		local start, match_end = name:find(":[0-9]+")
		if start then
			-- line number is 123
			line = name:sub(start + 1, match_end)
			-- remove the line number from the filename
			name = name:sub(1, start - 1)
		end

		return line, name
	end

	return nil, nil
end

-- log folder ~/.local/share/wezterm/
wezterm.on("open-uri", function(window, pane, uri)
	-- wezterm.log_info(window)
	-- wezterm.log_info(pane)
	-- wezterm.log_info("uri_raw", uri)

	-- if file name
	local line, name = extract_line_and_name(uri)

	-- wezterm.log_info("uri", uri, line, name)

	if name then
		-- local pwd = get_pwd(pane)
		-- local full_path = name:match("^/") and name or pwd .. "/" .. name

		-- wezterm.log_info("pwd " .. pwd, full_path)

		-- this can open the file in nvim at click but not gonna do that now
		-- check on these github link:
		-- https://gist.github.com/letieu/ac0034c2452ef41f967eca3cca44bc08
		-- https://github.com/MatejBransky/.dotfiles/blob/main/.config/wezterm/open-in-nvim.lua

		-- prevent the default action from opening in a browser
		return false
	end

	-- if email
	if uri:find("mailto:") == 1 then
		return false -- disable opening email
	end
end)

return {
	hyperlink_rule = {
		-- These are the default rules, but you currently need to repeat
		-- them here when you define your own rules, as your rules override
		-- the defaults

		-- URL with a protocol
		{
			regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},

		-- implicit mailto link
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0",
		},

		-- new in nightly builds; automatically highly file:// URIs.
		{
			regex = "\\bfile://\\S*\\b",
			format = "$0",
		},

		-- Now add a new item at the bottom to match things that are
		-- probably filenames
		{
			regex = "[/.A-Za-z0-9_-]+\\.[A-Za-z0-9]+(:\\d+)*(?=\\s*|$)",
			format = "$EDITOR:$0",
		},
	},
	quick_select_patterns = { "[/.A-Za-z0-9_-]+\\.[A-Za-z0-9]+(:\\d+)*(?=\\s*|$)" },
}
