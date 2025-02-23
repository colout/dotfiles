#!/bin/zsh
source ~/.zplug/init.zsh


zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "themes/robbyrussell", as:theme, from:oh-my-zsh
zplug "tom-doerr/zsh_codex"
zplug "plugins/dirhistory", from:oh-my-zsh
#zplug "jimhester/per-directory-history"
#export HISTORY_START_WITH_GLOBAL=true

zplug "kiurchv/asdf.plugin.zsh", defer:2
zplug "BlaineEXE/zsh-cmd-status"

# fzf to replace a few internals
zplug "aperezdc/zsh-fzy"

# Tryingi vim mode again
zplug "jeffreytse/zsh-vi-mode"

# Fixes some weirdness of navegation
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

zvm_config() {
  # Retrieve default cursor styles
  local blink=$(zvm_cursor_style $ZVM_CURSOR_BLINKING_BLOCK)
  local block=$(zvm_cursor_style $ZVM_CURSOR_BLOCK)
  local underline=$(zvm_cursor_style $ZVM_CURSOR_UNDERLINE)

  # Append your custom color for your cursor
  ZVM_INSERT_MODE_CURSOR=$blink'\e\e]12;#008800\a' # green
  ZVM_NORMAL_MODE_CURSOR=$block'\e\e]12;white\a'
  ZVM_VISUAL_MODE_CURSOR=$block'\e\e]12;magenta\a'
  ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_VISUAL_MODE_CURSOR
  ZVM_OPPEND_MODE_CURSOR=$underline'\e\e]12;white\a'

  ZVM_VI_HIGHLIGHT_BACKGROUND=#4a1c5c
}


#bindkey '\ec' fzy-cd-widget # TODO: Find a keybinding that works
#bindkey '^T'  fzy-file-widget  # Freezes terminal
bindkey '^R'  fzy-history-widget
bindkey '^P'  fzy-proc-widget

bindkey -r '^[y' # emacs yank
bindkey '^[y' create_completion  # bind Option+y to suggest

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    echo "Installing zplug plugins..."
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load # --verbose
