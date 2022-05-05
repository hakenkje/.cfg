# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh {{{

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-custom

ZSH_THEME="powerlevel10k/powerlevel10k"

alias zshconfig="vim ~/.zshrc"
alias i3config="vim ~/.config/i3/config"
alias kittyconfig="vim ~/.config/kitty/kitty.conf"
alias cfg='git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'
alias vim='nvim'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

source $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    git
    # pip
    # python
    poetry
    # docker
    brew
    rust
    extract
    bazel
    zsh-autosuggestions
    history-substring-search
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# }}}


# Shell {{{

# less -r
export PAGER="less -R"

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export LS_COLORS="$LS_COLORS:ow=1;7;34:st=30;44:su=30;41"

export EDITOR=nvim
export PATH="$PATH:$HOME/.local/bin"

# Aliases
# alias sudo='command sudo '
alias -g nd='*(/om[1])' # newest directory
alias -g nf='*(.om[1])' # newest file
alias sudo='nocorrect sudo'
# alias tree="tree -C -I '*.pyc|*.egg-info|dist|build|docs|__pycache__|tmp|node_modules|deps|target|*.json.gzip|*~'"
alias tree="tree -C --gitignore"
alias curlj='curl -H "Content-Type: application/json"'
alias rg='rg -S'
alias -g watch='watch '

# History
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt cdablevars

# Vi keybindings
bindkey -v
export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd 'u' undo
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down
bindkey '^U' vi-kill-line
bindkey '^K' vi-kill-eol
bindkey "^?" backward-delete-char  # Fixses backspace when vi mode is default
bindkey '\e[3~' delete-char  # Fixses delete when vi mode is default
bindkey -a G end-of-buffer-or-history
bindkey '^[[Z' reverse-menu-complete
# bindkey -r '^J'  # unbind from accept-line
bindkey "^N" menu-complete
bindkey '^P' reverse-menu-complete

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER=" fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# zargs is xargs for globbing
# zargs **/*.*.swp(N) -- rm
autoload -U zargs
autoload -U zmv

# Vim c-x e
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M viins '^x' edit-command-line  # was '^xe'

# Use modern completion system
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-${HOME}}/$ZSH_COMPDUMP(#qN.mh+24) ]]; then
    compinit -d $ZSH_COMPDUMP;
else
    compinit -C;
fi;

# }}}


# App specific {{{

# Python {{{

export VIRTUAL_ENV_DISABLE_PROMPT=1

# }}}

# DLNA Server (minidlna) {{{

function dlna-start {
    minidlnad -d -R -f ~/.config/minidlna/minidlna.conf -P ~/.config/minidlna/minidlna.pid
}

function dlna-stop {
    pkill minidlna
}

# }}}


# fasd {{{

if [ $commands[fasd] ]; then
    eval "$(fasd --init auto)"
fi

# }}}

# FZF {{{

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --inline-info --cycle'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -e /usr/share/fzf ]; then
    source /usr/share/fzf/key-bindings.zsh
fi

# }}}

# }}}

# nnn {{{

export NNN_BMS='d:~/workspace/fronteer/unfront/development-new;p:~/workspace/fronteer/unfront/development-new/payments;D:~/workspace/fronteer/unfront/development-new/payments/deposits;a:~/workspace/fronteer/unfront/development-new/admin;h:~/workspace/fronteer/unfront/development-new/hazzle;l:~/workspace/fronteer/unfront/development-new/ledger'
export NNN_PLUG='o:fzopen;t:!tree -L 3;p:preview-tui;i:imgview;l:!git log;z:fasd;f:!feh --bg-fill $nnn*'
export NNN_FIFO=/tmp/nnn.fifo

n () {
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # NOTE: NNN_TMPFILE is fixed, should not be modified
    # export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        export NNN_OPENER=~/.config/nnn/plugins/nuke
        nnn -a -c -d "$@"
    else
        nnn -a -d "$@"
    fi

    if [ -f "$NNN_TMPFILE" ]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# }}}

# Mac OS {{{

if [[ $(hostname) == "hakenkje-mbpr.local" ]]; then

    # Homebrew
    # export LDFLAGS="-L/usr/local/opt/openssl/lib"

    # iTerm2
    if [[ -f "${HOME}/.iterm2_shell_integration.zsh" ]]; then
        source "${HOME}/.iterm2_shell_integration.zsh"
    fi

    ssh-forward() {
        ssh -N \
            -L 3000:localhost:3000  \
            -L 8888:localhost:8888  \
            -L 10350:localhost:10350  \
            ws-lan
    }

    function ssh-tmux () {
        ssh -t "$1" 'tmux -CC new -A -s session /usr/bin/zsh'
    }

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/usr/local/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/usr/local/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

fi

# }}}


# Arch Linux {{{

if [[ $(hostname) == "hakenkje-ws" ]]; then

    # SSH-agent
    if [[ "$XDG_RUNTIME_DIR" != "" ]]; then
        export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
    fi

    if [ $commands[feh] ]; then
        function wallpaper() {
            ln -sf "$@" $HOME/Documents/wallpapers/wallpaper
            feh --bg-scale $HOME/Documents/wallpapers/wallpaper
        }
    fi

    function free-disk-space() {
        sudo pacman -Sc
        sudo journalctl --vacuum-time=2d
    }

    # alias open="xdg-open $@ &"
	function open () {
        xdg-open "$*" &; disown %-
    }
    alias pbcopy="xclip -selection c"
    alias pbpaste="xclip -selection clipboard -o"

    function restart-pulseaudio() {
        pulseaudio -k && sleep 1 && pulseaudio --start
    }

    export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
    source /usr/share/nvm/init-nvm.sh

    source $HOME/.poetry/env

    export LIBVIRT_DEFAULT_URI="qemu:///system"

    function mount-backup() {
        sudo cryptsetup open /dev/sda1 backup1
        sudo cryptsetup open /dev/sdb1 backup2
        sleep 2
        sudo mount /dev/mapper/backup--volume-backup /home/hakenkje/backup
        # mount -o gid=users,uid=1000,dmask=0002,fmask=0113 /dev/mapper/backup--volume-backup /home/hakenkje/backup
        sudo lvs -a -o name,copy_percent,health_status,devices backup-volume
    }

fi

# }}}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zprof
