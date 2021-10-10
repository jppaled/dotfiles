## recherche duckduck go sur le terminal
alias ddg="ddgr -r fr-fr -x -n 5 --unsafe"

## matrix
alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias matrixBinarie='echo -e "1"; while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="0 $r";else v="1 $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;'

## film starwars sur le terminal
alias starwars="telnet towel.blinkenlights.nl"

## message de bienvenue
alias welcome='animal=("meow" "turtle" "stegosaurus"); fortune | cowsay -f ${animal[$RANDOM % ${#animal[@]} ]} | lolcat'

alias als='xed ~/.bash_aliases'
alias reload='source ~/.bashrc'

# ip
alias localip='hostname -I'
alias pubip='curl ifconfig.io'

# répertoire
alias ..='cd ../'
alias www='cd /var/www'
alias dls='cd ~/Téléchargements'
alias dsk='cd ~/Bureau'

alias clip='copyq add -'

# droit
alias amoi='sudo chown $USER:$USER'

# recerche
alias hg='history |grep'
alias fhere="sudo find . -type f -name"

# apt
alias apti='sudo apt install'
alias aptu='sudo apt update'
alias aptp='sudo apt purge'
alias apts='sudo apt search'
alias aptar='sudo apt autoremove'
alias aptac='sudo apt autoclean'
alias aptl='sudo apt list'
alias aptupgr='sudo apt list upgrade'
alias aptlup='sudo apt list --upgradable'

# hosts
alias edithost="sudo xed /etc/hosts"

# batterie
alias bat='upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"'

## mp3 ou mp4 d'une video youtube
alias yt-mp3="youtube-dl --extract-audio --audio-format mp3 -i"
alias yt-mp4="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' -i"

alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test1000.zip"

# some more ls aliases
#alias ls='ls -GFh --color=auto'
#alias ll="ls -alF"
#alias l="ls -l"
#alias la="ls -a"

alias ll="exa -abghl"
alias l="exa -bghl"
alias la="exa -a"


export PS1="\[$(tput bold)\]\[\033[38;5;124m\][\[$(tput bold)\]\[\033[38;5;172m\]\u\[$(tput bold)\]\[\033[38;5;106m\]@\[$(tput bold)\]\[\033[38;5;38m\]\h\[$(tput bold)\]:\[$(tput bold)\]\[$(tput bold)\]\[\033[38;5;176m\]\w\[$(tput bold)\]\[\033[38;5;124m\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
