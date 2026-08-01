# Minimal, keyboard-friendly shell layer for Ghostty + tmux

setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
HISTSIZE=50000
SAVEHIST=50000

# ── Completion: menu + fuzzy path matching ─────────────────────────────────────
autoload -Uz compinit
compinit -C

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*:cd:*' tag-order local-directories directory-path

# ── Right prompt ─────────────────────────────────────────────────────────────
_terminal_rprompt() {
  if [[ -n "$TMUX" ]]; then
    RPROMPT='%F{#565f89}tmux %f%F{#414868}%~%f'
  else
    RPROMPT='%F{#414868}%~%f'
  fi
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _terminal_rprompt

# ── eza: pretty ls with icons + file types ───────────────────────────────────
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first --color=always'
  alias ll='eza -lah --icons --git --group-directories-first --color=always'
  alias la='eza -a --icons --group-directories-first --color=always'
  alias lt='eza --tree --icons --level=2 --color=always'
  alias l='ls'
fi

# ── fzf: history, cd picker, tab completion ──────────────────────────────────
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh 2>/dev/null) 2>/dev/null || true
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --color=bg+:#24283b,bg:#1a1b26,spinner:#7aa2f7,header:#7aa2f7,info:#565f89,pointer:#7aa2f7,marker:#bb9af7,fg:#c0caf5,fg+:#c0caf5,hl:#bb9af7,hl+:#bb9af7'
  if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd -H --type f --exclude .git'
  fi
  export FZF_CTRL_T_OPTS='--preview "eza --icons --color=always {} 2>/dev/null || bat --color=always {} 2>/dev/null"'
  export FZF_ALT_C_OPTS='--walker dir,follow,hidden --preview "eza --icons --color=always {} 2>/dev/null"'
fi

# ── zoxide: smart cd + interactive picker ──────────────────────────────────────
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  # `c` = fuzzy folder picker (arrow keys). Alt+C does the same via fzf.
  c() { zi; }
fi

# Smart cd: try normal path first, then zoxide frecent dirs
cd() {
  if (( $# == 0 )); then
    builtin cd ~
  elif [[ "$1" == "-" ]]; then
    builtin cd -
  elif [[ -d "$1" ]]; then
    builtin cd "$1"
  elif command -v z >/dev/null 2>&1; then
    z "$1"
  else
    builtin cd "$1"
  fi
}

# ── Ghost suggestions while typing (dim text from history) ─────────────────────
if [[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#414868'
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  bindkey '^F' autosuggest-accept
fi

# ── Syntax highlighting (must load last: valid=blue, typos=red) ────────────────
if [[ -r /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  typeset -A ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_STYLES[default]='none'
  ZSH_HIGHLIGHT_STYLES[command]='fg=#7aa2f7'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=#7dcfff'
  ZSH_HIGHLIGHT_STYLES[alias]='fg=#bb9af7'
  ZSH_HIGHLIGHT_STYLES[function]='fg=#bb9af7'
  ZSH_HIGHLIGHT_STYLES[path]='fg=#9ece6a'
  ZSH_HIGHLIGHT_STYLES[globbing]='fg=#e0af68'
  ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f7768e,bold'
  ZSH_HIGHLIGHT_STYLES[redirection]='fg=#7dcfff'
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#9ece6a'
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#9ece6a'
fi

# ── Help ───────────────────────────────────────────────────────────────────────
h() {
  cat <<'EOF'
Ghostty (Cmd = ⌘)
  ⌘⇧P     Command palette
  ⌘`      Quick terminal
  ⌘T/⌘N   Tab / window
  ⌘D/⌘⇧D  Split right / down
  ⌘K      Clear              ⌘⇧R   Reload config

Files & navigation
  ls/ll/lt   Pretty listing (eza + icons)
  c / Alt+C  Fuzzy cd (arrow keys, filter as you type)
  z <dir>    Jump to frecent folder (zoxide)
  Tab        Menu completion (paths filter as you type)
  Ctrl+R     Fuzzy command history
  Ctrl+T     Fuzzy pick files into command line
  →          Accept gray suggestion (Ctrl+F)

tmux (prefix Ctrl+A)
  Ctrl+A d   Detach
  Ctrl+A | - Split vertical / horizontal
EOF
}
