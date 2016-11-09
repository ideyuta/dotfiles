export ZSH=/Users/ideyuta/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

export PATH=$HOME/.nodebrew/current/bin:$PATH

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:$PATH
source /usr/local/bin/virtualenvwrapper.sh

# git settings
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"

v_env_wrapper=/usr/local/bin/virtualenvwrapper.sh 
if [ -r $v_env_wrapper ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source $v_env_wrapper
fi
export PIP_RESPECT_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
export VIRTUALENV_USE_DISTRIBUTE=true

alias ll='ls -lG'

#export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

#for golang
export GOPATH=$HOME/.go
export GOROOT=$( go env GOROOT )
export PATH=$GOPATH/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#export PATH=$PATH:~/Library/Python/2.7/bin
#powerline-daemon -q
#. /usr/local/lib/python2.7/site-packages/poweline/bindings/zsh/powerline.zsh


### Git-Radar
# export PROMPT="$PROMPT$(git-radar --zsh --fetch)"

export EDITOR=vim
eval "$(direnv hook zsh)"

#Android
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
