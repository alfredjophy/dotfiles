export PATH=/bin/lscript:/bin/lscript:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/ajrx/.local/bin:/home/ajrx/go/bin

#custom aliases
alias 2048='2048 bluered'
alias update-grub2='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias speedtest-cli='speedtest-cli --bytes'
alias l='ls -CF'
alias sizeof='dust -bd0'
alias du='dust'
alias ip?='curl -4 ifconfig.co && curl -6 ifconfig.co'
alias dfg='/usr/bin/git --git-dir=$XDG_REPOSITORIES_DIR/dotfiles --work-tree=$HOME/.config'
alias update-nativefier-apps='cd ~/.local/bin/ && find . -mindepth 1 -maxdepth 1 -type d -exec nativefier --upgrade {} \; && cd -'
alias locate='plocate'
alias icat='kitty +kitten icat'
alias zathura='zathura --fork'
alias brave='/usr/bin/brave --profile-directory=Default'
alias of='onefetch'
alias git_root='git rev-parse --show-toplevel'
alias rm='trash'
alias vpn-toggle='ip addr | grep wg >> /dev/zero && sudo wg-quick down wg0 || sudo wg-quick up wg0'
alias lf='ranger .'
. $HOME/.config/user-dirs.dirs.fish
motivate

starship init fish | source
direnv hook fish | source

