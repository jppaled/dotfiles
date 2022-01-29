# duckduckgo search
alias ddg="ddgr -r fr-fr -x -n 5 --unsafe"

# matrix
alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias matrixBinarie='echo -e "1"; while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="0 $r";else v="1 $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;'

# starwars movie
alias starwars="telnet towel.blinkenlights.nl"

# welcome message
alias welcome='fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1) | lolcat'

# alias
alias als='xed ~/.bash_aliases'
alias reload='source ~/.bashrc'

# ip
alias localip='hostname -I'
alias pubip='curl ifconfig.io'

# directory
alias ..='cd ../'
alias www='cd /var/www'
alias dls='cd ~/Téléchargements'
alias dsk='cd ~/Bureau'
alias dox='cd ~/Documents'
alias dev='cd ~/dev'

# clip with copyq
alias clip='copyq add -'

# right
alias amoi='sudo chown $USER:$USER'

# chmod
alias mx="chmod +x $1"
alias nmx="chmod -x $1"

# chattr
alias lock="sudo chattr +i $1"
alias unlock="sudo chattr -i $1"

# create purge script
function prg() {
    echo "apt purge $2" > $HOME/dev/mintinstall/scripts/purge/$1;
    mx $HOME/dev/mintinstall/scripts/purge/$1;
    ll $HOME/dev/mintinstall/scripts/purge/;
    cat $HOME/dev/mintinstall/scripts/purge/$1;
}

# firefox search
#alias ff='nohup firefox --search'

# search
alias hg='history |grep'
alias fhere="sudo find . -type f -name"
alias emptydir='find $HOME -type d -empty'
alias emptydirdel='find $HOME -type d -empty -delete'

# hosts
alias edithost="sudo $EDITOR /etc/hosts"

# battery
alias bat='upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"'

# git
alias cancel_commit='git reset --soft HEAD~1';

# mp3 or mp4 of youtube video
alias yt-mp3="youtube-dl --extract-audio --audio-format mp3 -i"
alias yt-mp4="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -i"
alias yt-mp4-720="youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]'"

## convert video to mp4
convertToMp4 () {
 	ffmpeg -i "$1" -c:a aac -b:a 128k -c:v libx265 -crf 23 "$1".mp4
}

# speedtest
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test1000.zip"
alias spythontest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"

alias slip='systemctl suspend'

# crypto
alias coin='coinmon -f btc,eth,xmr'


# diff
alias diff='diff --color=auto'

# some more ls aliases
alias ls='ls -GFh --color=auto'

# ls with exa
if [ -f $HOME/.local/bin/exa ]; then
    alias ll="exa -abghl"
    alias l="exa -bghl"
    alias la="exa -a"
    alias lll="exa -abghl --recurse -T -L 2"
else
    alias ll="ls -alF"
    alias l="ls -l"
    alias la="ls -a"
fi

# extract all format
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1     ;;
			*.tar.gz)    tar xzf $1     ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar e $1     ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xf $1      ;;
			*.tbz2)      tar xjf $1     ;;
			*.tgz)       tar xzf $1     ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)     echo "'$1' cannot be extracted via extract()" ;;
		esac
	 else
		echo "'$1' is not a valid file"
	fi
}

function parse_git_branch {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function git_status_color {
    local red="\[\033[38;5;124m\]"
    local yellow="\[\033[38;5;172m\]"
    local green="\[\033[38;5;106m\]"

    local git_status="$(git status 2> /dev/null)"

    if [[ $git_status =~ "modifié :" ]]; then
        echo -e $red
    elif [[ $git_status =~ "Modifications qui ne seront pas validées" ]]; then
        echo -e $yellow
    else
        echo -e $green
    fi
}

function color_my_prompt {
    local bold="\[$(tput bold)\]"
    local red="\[\033[38;5;124m\]"
    local yellow="\[\033[38;5;172m\]"
    local green="\[\033[38;5;106m\]"
    local blue="\[\033[38;5;38m\]"
    local pink="\[\033[38;5;176m\]"
    local fushia="\[\033[38;5;161m\]"
    local white="\e[0;97m"

    local __open_bracket="$red["
    local __user="$yellow\u"
    local __at="$green@"
    local __host="$blue\h"
    local __colon="$blue:"
    local __current_path="$pink\w"
    local __close_bracket="$red]"
    local __git_branch="$green\$(parse_git_branch)"
    local __dollar="\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

    #local __git_branch="$(git_status_color)\$(parse_git_branch)"
    #local __git_branch="$yellow$(__git_ps1)\[$(tput sgr0)\]"

    export PS1="$bold$__open_bracket$__user$__at$__host$__colon$__current_path$__close_bracket$__git_branch$__dollar"
}

# rainbow ps1 with git
#color_my_prompt

# rainbow ps1
export PS1="\[$(tput bold)\]\[\033[38;5;124m\][\[$(tput bold)\]\[\033[38;5;172m\]\u\[$(tput bold)\]\[\033[38;5;106m\]@\[$(tput bold)\]\[\033[38;5;38m\]\h\[$(tput bold)\]:\[$(tput bold)\]\[$(tput bold)\]\[\033[38;5;176m\]\w\[$(tput bold)\]\[\033[38;5;124m\]]\[\033[38;5;106m\]\$(parse_git_branch)\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
