set -l xdg_data_home $XDG_DATA_HOME ~/.local/share
set -gx --path XDG_DATA_DIRS $xdg_data_home[1]/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share

for flatpakdir in ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    if test -d $flatpakdir
        contains $flatpakdir $PATH; or set -a PATH $flatpakdir
    end
end
export PATH=/bin/lscript:/bin/lscript:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/ajrx/.local/bin:/home/ajrx/go/bin

#custom aliases
alias 2048='2048 bluered'
alias update-grub2='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias speedtest-cli='speedtest-cli --bytes'
alias l='ls -CF'
alias sizeof='dust -bd0'
alias du='dust'
alias ip?='curl -4 ifconfig.co & curl -6 ifconfig.co'
alias dfg='/usr/bin/git --git-dir=$XDG_REPOSITORIES_DIR/dotfiles --work-tree=$HOME/.config'
alias update-nativefier-apps='cd ~/.local/bin/ && find . -mindepth 1 -maxdepth 1 -type d -exec nativefier --upgrade {} \; && cd -'
alias locate='plocate'
alias icat='kitty +kitten icat'
alias zathura='zathura --fork'
alias brave='/usr/bin/brave --profile-directory=Default'
alias of='onefetch'
alias git_root='git rev-parse --show-toplevel'
alias rm='trash'
alias lf='ranger .'
alias pkg-browse="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"

. $HOME/.config/user-dirs.dirs.fish

motivate

starship init fish | source
direnv hook fish | source

