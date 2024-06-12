#!/bin/bash
#################
# general
#################
alias lhidden="ls -d .* --color=auto" # show hidden files
alias c="clear"

#################
# config
#################
alias ohmyzsh="nano ~/.oh-my-zsh"
alias zshcfg="nano ~/.zshrc"
alias zshshortcut="nano ~/.oh-my-zsh/custom/shortcuts.zsh"
alias zshalias="nano ~/.oh-my-zsh/custom/aliases.sh"
alias zshsource="source ~/.zshrc"
alias sshcfg="nano ~/.ssh/config"

#################
# history
#################
alias h="history"
alias gh="history | grep"

#################
# date
#################
alias now="date +"%T""
alias nowtime=now
alias nowdate="date +"%d-%m-%Y""

#################
# confirmation
#################
alias ln="ln -i"
alias rm="rm -I –preserve-root"

#################
# dev
#################
alias "idea=open -a /Applications/IntelliJ\ IDEA.app/"
alias "ideace=open -a /Applications/IntelliJ\ IDEA\ CE.app/"

#################
# python
#################
alias python="python3"
alias pip="pip3"

##################
# docker
##################
alias drm="docker rm $(docker ps -a -q)"
alias dsp='docker system prune'
alias dvp='docker volume prune'

docker_exec_bash() {
  if [ $# -ne 1 ]; then
    echo "Usage: $FUNCNAME CONTAINER_ID"
    return 1
  fi

  docker exec -it $1 /bin/sh
}

alias dsh='docker_exec_bash'

docker_exec_entrypoint_bash() {
  if [ $# -ne 1 ]; then
    echo "Usage: $FUNCNAME CONTAINER_ID"
    return 1
  fi

  docker run --rm -it --entrypoint=/bin/bash $1
}

alias dshe='docker_exec_entrypoint_bash'

docker_compose_exec_bash() {
  if [ $# -ne 1 ]; then
    echo "Usage: $FUNCNAME CONTAINER_ID"
    return 1
  fi

  docker-compose exec $1 /bin/sh
}

alias dcsh='docker_compose_exec_bash'
