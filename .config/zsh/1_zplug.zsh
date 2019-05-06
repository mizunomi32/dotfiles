source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "mollifier/anyframe"

# fzf
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq

# git rootへcd
zplug "mollifier/cd-gitroot"

# 絵文字表示
zplug "mrowa44/emojify", as:command
# 絵文字入力
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"



# theme
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
# 構文ハイライト
zplug "zsh-users/zsh-syntax-highlighting"

# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"


# Can manage local plugins
#zplug "~/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
