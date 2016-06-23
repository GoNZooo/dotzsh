# Path to your oh-my-zsh installation.
export ZSH=/home/gonz/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gonz-flazz"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast last-working-dir vi-mode ssh-agent)
# User configuration

export PATH="$HOME/.config/wifixir/script:$HOME/.config/pyfi/script:$HOME/.rakudobrew/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

### Ideally all the below stuff would work, but opp.zsh has everything and it
### does it well
#autoload -Uz surround
#zle -N delete-surround surround
#zle -N add-surround surround
#zle -N change-surround surround
#bindkey -a cs change-surround
#bindkey -a ds delete-surround
#bindkey -a ys add-surround
#bindkey -M visual S add-surround

# opp.zsh (vim text-objects)
OPPDIR="$HOME/code/thirdparty/opp.zsh"
source $OPPDIR/opp.zsh
source $OPPDIR/*.zsh

. /usr/share/fzf/key-bindings.zsh
. /etc/profile.d/fzf-extras.zsh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias proper-youtube-dl="youtube-dl --restrict-filenames --external-downloader=aria2c"
alias fsnorm="mpv --fullscreen --af=drc --ytdl-raw-options=external-downloader=aria2c"
alias xracket="racket -il xrepl"
alias tracket="racket -i -l xrepl -r typed/racket"
alias termemacs="emacs -nw"

alias omniknight-code="mosh omniknight mux start code"
alias remote-omniknight-code="mosh remote-omniknight mux start code"
alias omniknight-irc="mosh omniknight mux start irc"
alias remote-omniknight-irc="mosh remote-omniknight mux start irc"
alias omniknight-todo="mosh omniknight mux start todo"
alias remote-omniknight-todo="mosh remote-omniknight mux start todo"

source "$HOME/.secrets/envs.zsh"

# Load exenv
export PATH="/home/gonz/.exenv/shims:${PATH}"
source "/home/gonz/tools/exenv/completions/exenv.zsh"
exenv rehash 2>/dev/null
exenv() {
    local command="$1"
    if [ "$#" -gt 0 ]; then
        shift
    fi

    case "$command" in
        shell)
            eval `exenv "sh-$command" "$@"`;;
        *)
            command exenv "$command" "$@";;
    esac
}
