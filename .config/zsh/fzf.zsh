# export FZF_DEFAULT_OPTS='--bind=ctrl-t:top,change:top --bind ctrl-e:down,ctrl-u:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_COMPLETION_TRIGGER='\'

# Preview file content using bat (https://github.com/sharkdp/bat)
# export FZF_CTRL_T_OPTS="
#   --walker-skip .git,node_modules,target
#   --preview 'bat -n --color=always {}'
#   --bind 'ctrl-/:change-preview-window(down|hidden|)'"
#
# # CTRL-Y to copy the command into clipboard using pbcopy
# export FZF_CTRL_R_OPTS="
#   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#   --color header:italic
#   --header 'Press CTRL-Y to copy command into clipboard'"
#
# # Print tree structure in the preview window
# export FZF_ALT_C_OPTS="
#   --walker-skip .git,node_modules,target
#   --preview 'tree -C {}'"
