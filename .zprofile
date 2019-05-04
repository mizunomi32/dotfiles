if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

if [ -d $HOME/bin ] ; then
    export PATH="$HOME/bin:$PATH"
fi

export LANG=ja_JP.UTF-8
export KCODE=u

# nvim 用に必要とか
export XDG_CONFIG_HOME="$HOME/.config"

