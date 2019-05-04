# Created by newuser for 5.7

# load configs
for i in ~/.config/zsh/*.zsh; do
  source $i
done

# added by travis gem
[ -f /Users/mz32/.travis/travis.sh ] && source /Users/mz32/.travis/travis.sh
