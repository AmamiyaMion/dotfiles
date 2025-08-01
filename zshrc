# panjk0518's .zshrc
# Requirements: gentoo prompt, powerlevel10k, zsh-auto-suggestions, zsh-syntax-highlighting, zoxide
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# source /etc/bash/bashrc.d/command-not-found.sh
autoload -U compinit promptinit
compinit
promptinit; prompt gentoo
zstyle ':completion::complete:*' use-cache 1
HISTFILE=~/.zsh_history
SAVEHIST=10000
HISTSIZE=1000
bindkey "^[[3~" delete-char
source /usr/share/zsh/site-functions/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# zsh autocomplete
# . /usr/share/zsh/site-functions/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# bindkey -M menuselect '^M' .accept-line
# bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
# bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char
# zstyle ':autocomplete:*' delay 1  # seconds (float)
# zstyle ':autocomplete:*' min-input 2
# bindkey -M emacs \
#     "^[p"   .history-search-backward \
#     "^[n"   .history-search-forward \
#     "^P"    .up-line-or-history \
#     "^[OA"  .up-line-or-history \
#     "^[[A"  .up-line-or-history \
#     "^N"    .down-line-or-history \
#     "^[OB"  .down-line-or-history \
#     "^[[B"  .down-line-or-history \
#     "^R"    .history-incremental-search-backward \
#     "^S"    .history-incremental-search-forward \
#     #
# bindkey -a \
#     "^P"    .up-history \
#     "^N"    .down-history \
#     "k"     .up-line-or-history \
#     "^[OA"  .up-line-or-history \
#     "^[[A"  .up-line-or-history \
#     "j"     .down-line-or-history \
#     "^[OB"  .down-line-or-history \
#     "^[[B"  .down-line-or-history \
#     "/"     .vi-history-search-backward \
#     "?"     .vi-history-search-forward \
#     #
# bindkey              '^I'         menu-complete
# bindkey "$terminfo[kcbt]" reverse-menu-complete
# zsh autosuggestions
. /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
# This should be at the end of the zsh config
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"

# Alias
alias cd='z'
alias ll='ls -l'
alias la='ls -la'
alias lA='ls -lA'
