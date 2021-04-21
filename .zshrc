# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/Cellar/mysql/8.0.19/bin

# Path to your oh-my-zsh installation.
export ZSH="/Users/ashit.vyas/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
zsh-autosuggestions
docker
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$PATH:/Users/ashit.vyas/bin:/Users/ashit.vyas/platform.pureweb.io/helpers
alias cg="cd /Users/ashit.vyas/gits"
alias cbin="cd /Users/ashit.vyas/bin"
alias cdeploy="cd /Users/ashit.vyas/gits/platform.pureweb.io/deployment_prod"
alias tfapply="terraform apply -auto-approve"
alias tfinit="terraform init"
alias tfplan="terraform plan"
alias tfclean="terraform destroy -auto-approve"
alias tf="terraform"
alias cosdestroy="cosmos c destroy"
alias coscreate="cosmos c create"
alias cosflist="cosmos f list"
alias cosupdate="cosmos c update"
alias tf13="terraform135"
alias gcm="git checkout master"
alias gcb="git checkout -b"
alias gc="git checkout"
alias gb="git branch"
alias gba="git branch -a"
alias gcam="git commit -a -m"
alias gd="git diff"
alias gpl="git pull"
alias gph="git push"
alias gs="git status"
alias gbD="git branch -D"
alias glog="git log --oneline --decorate --graph"
alias sli="sam local invoke"
alias c="clear"
alias l="ls -lsrth"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
### Hide the "user@hostname" info when you're logged in as yourself on local machine
prompt_context() {
  if [[ -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

#zsh function
#
assume-role() { role=${1}; mfa=${2}; eval $(/Users/ashit.vyas/gits/platform.pureweb.io/helpers/awsCreds.py "$role" "$mfa"); }
#SSM Connect takes instance id and region as argument to connect AWS Instance, 
#To-Do make Port as argument as well with some sensible default
#Takes third argument as AWS Profile with mfa prompt
ssmconnect() { instance=$1; region=$2; profile=$3; aws ssm start-session --target "$instance" --document-name AWS-StartPortForwardingSession --parameters portNumber=5900,localPortNumber=3388 --region "$region" --profile "${profile:-su}" 	}
### FZF Functions (https://github.com/junegunn/fzf/wiki/examples#opening-files)
# Changing Directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  IFS=$'\n' files=($(fzf-tmux --height 40% --layout=reverse --border --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}



autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/ashit.vyas/bin/terraform terraform
