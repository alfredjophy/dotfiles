

export PATH=/bin/lscript:/bin/lscript:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/ajrx/.local/bin:/home/ajrx/go/bin



#custom aliases
alias 2048='2048 bluered'
alias update-grub2='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias speedtest-cli='speedtest-cli --bytes'
alias l='ls -CF'
alias sizeof='dust -bd0'
alias du='dust'
alias ip?='curl -4 ifconfig.co && curl -6 ifconfig.co'
alias kicat='kitty +kitten icat'
alias neofetch='neofetch --backend kitty --loop --source ~/.config/neofetch/Arch-linux-logo.png --size 400px'
alias dotfiles-git='/usr/bin/git --git-dir=$HOME/Repos/dotfiles --work-tree=$HOME/.config'
alias update-nativefier-apps='cd ~/.local/apps && find . -mindepth 1 -maxdepth 1 -type d -exec nativefier --upgrade {} \;'
alias locate='plocate'

motivate
starship init fish | source


