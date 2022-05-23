# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/bin:/usr/local/bin

# for old vim type '\vim'
GIT_EDITOR=nvim
alias vim='nvim'
export EDITOR='nvim'


# Path to your oh-my-zsh installation.
export ZSH="/Users/blairvanderlugt/.oh-my-zsh"


# krew
export PATH="${PATH}:${HOME}/.krew/bin"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="cloud"


plugins=(git osx vim-mode zsh-autosuggestions kubectl zsh history-substring-search gpg)

alias gpg=gpg2

source $ZSH/oh-my-zsh.sh

# User configuration
#function get_cluster_short() {
#  echo "$1" | cut -d "-" -f 1-3 -f1
#}
#export KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short # not working :(
#export KUBE_PS1_SYMBOL_ENABLE=false
#export RPROMPT='$(kube_ps1)'
#export FLUX_FORWARD_NAMESPACE=flux


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if [ -e /Users/blairvanderlugt/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/blairvanderlugt/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

## docker build kit
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

eval $(thefuck --alias)

# this prevents the '%' character output
export PROMPT_EOL_MARK='' 

# git order by date
alias git-branch-date="git for-each-ref --sort=committerdate refs/heads/
--format='%(committerdate:short) %(refname:short)'"
