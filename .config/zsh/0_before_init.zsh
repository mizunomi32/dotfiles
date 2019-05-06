if [ ! -d $HOME/.zplug ] ; then
    echo "Getting zplug"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

#source ~/.zplug/init.zsh

