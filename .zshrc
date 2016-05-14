# Add pure prompt. https://github.com/sindresorhus/pure
fpath=( "$HOME/.zsh/functions" $fpath )
autoload -U promptinit && promptinit
prompt pure

autoload -U compinit
compinit

setopt interactivecomments # Allow comments after commands
setopt autocd              # cd to paths by just typing the path
setopt extendedglob        # Expand file expressiong (e.g. **/file)
setopt NO_BEEP             # No more bells!

export CLICOLOR=1
export EDITOR=vim
export PAGER='less -q'

# Automatically/easily switch ruby versions via chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby $(cat ~/.ruby-version)

# Add fzf.zsh. https://github.com/junegunn/fzf
source "$HOME/.zsh/fzf.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh