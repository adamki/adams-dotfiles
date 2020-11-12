# DEFAULTS
export VISUAL=nvim # make vim defaut editor
export EDITOR="$VISUAL"
export HISTSIZE=20000 # Store 10,000 history entries
export HISTCONTROL=erasedups # Don't store duplicates

# Set $DOTFILES VAR
export DOTFILES="$HOME/dotfiles"

# IMPORTS
source $DOTFILES/aliases

# setup path to antigen ZSH pachage manager
case `uname` in
  Darwin)
    source /usr/local/share/antigen/antigen.zsh
  ;;
  Linux)
    source $HOME/antigen.zsh
    # eval $(keychain --eval --quiet id_ed25519 id_rsa ~/.ssh/id_ed25519.pub)
  ;;
esac

antigen use oh-my-zsh
antigen bundle colorize
antigen bundle colored-man-pages
antigen bundle paulirish/git-open
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply  # Tell Antigen that you're done.

# print sys info
~/pfetch/pfetch

# enable FZF fuzzy find and auto-complete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tell FZF to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden --glob ""'
export FZF_CTRL_T_OPTS='--preview "(highlight -O ansi -l {} || cat {} || tree -C {}) 2> /dev/null | head -200" --bind "?:toggle-preview"'
export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up --border'
# make fzf look like dracula theme. more themes found here: https://github.com/junegunn/fzf/wiki/Color-schemes
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

# launch starship prompt
eval "$(starship init zsh)"

# sets up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add ARDUINO_PATH variable
export ARDUINO_PATH=/usr/local/arduino
# sets up rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
# sets up PyEnv
export PATH="$HOME/.pyenv/bin:$PATH"

eval "$(rbenv init -)"
eval "$(pyenv init -)"

export PATH="$HOME/.poetry/bin:$PATH"
