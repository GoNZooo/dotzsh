# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# keychain
#eval `keychain --eval --agents ssh id_rsa`

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="flazz"

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

export GOPATH="$HOME/tools/go/go"

export PYENV_ROOT="$HOME/.pyenv"

export PATH="$HOME/tools/zig/zig-linux-x86_64-0.7.1+d20174ad8:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.exenv/bin:$HOME/tools/watchexec-1.12.0-x86_64-unknown-linux-gnu:$HOME/tools/ats/bin/bin:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/wifixir/script:$HOME/.config/pyfi/script:$HOME/.rakudobrew/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/bin:$PYENV_ROOT/bin:$PATH"

export PATSHOME="$HOME/tools/ats/bin/lib/ats2-postiats-0.4.0"

export PATH="$HOME/tools/go/go/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# opp.zsh (vim text-objects)
OPPDIR="$HOME/code/thirdparty/opp.zsh"
source $OPPDIR/opp.zsh
source $OPPDIR/*.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

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
alias proper-youtube-dl="youtube-dl --restrict-filenames"
alias ytdl="youtube-dl --restrict-filenames"
alias code-without-accessibility="code --disable-renderer-accessibility"

alias omniknight-code="mosh omniknight mux start code"
alias remote-omniknight-code="mosh remote-omniknight mux start code"
alias omniknight-irc="mosh omniknight mux start irc"
alias remote-omniknight-irc="mosh remote-omniknight mux start irc"
alias omniknight-todo="mosh omniknight mux start todo"
alias remote-omniknight-todo="mosh remote-omniknight mux start todo"

source "$HOME/.secrets/envs.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. $HOME/tools/erlang/releases/22.3/activate
# . /home/gonz/tools/erlang/releases/23.2/activate

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(exenv init -)"

# WSL?
if [[ "$(< /proc/sys/kernel/osrelease)" == *microsoft* ]]; then
    export $(dbus-launch)
    export LIBGL_ALWAYS_INDIRECT=1
    export WSL_VERSION=$(wsl.exe -l -v | grep -a '[*]' | sed 's/[^0-9]*//g')   
    export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
    export DISPLAY=$WSL_HOST:0
    # Add Windows binaries to path. The reason we need this is because auto-injecting
    # all paths into the WSL instance is slowing down ZSH considerably.
    export PATH="/mnt/c/Users/ricka/AppData/Local/Programs/Microsoft VS Code/bin/:$PATH"
    export PATH="/mnt/c/Windows/:$PATH"
    export PATH="/mnt/c/Windows/System32:$PATH"
    # pip path if using --user
    # export PATH=$PATH:$HOME/.local/bin
    # SSH
    # eval $(/mnt/c/weasel-pageant/weasel-pageant -r)
fi
