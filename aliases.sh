#!/bin/bash
#################
# general
#################
alias lhidden="ls -d .* --color=auto" # show hidden files
alias c="clear"
alias r="reset"
alias sha1="openssl sha1"
alias path='echo -e ${PATH//:/\\n}'
alias current='date +%s'

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
alias h-grep="history | grep"

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
docker-exec-bash-fn() {
  if [ $# -ne 1 ]; then
    echo "Usage: $FUNCNAME CONTAINER_ID"
    return 1
  fi

  docker exec -it $1 /bin/sh
}

docker-run-entrypoint-bash-fn() {
  if [ $# -ne 1 ]; then
    echo "Usage: $FUNCNAME CONTAINER_ID"
    return 1
  fi

  docker run --rm -it --entrypoint=/bin/bash $1
}

docker-stop-rm-container-fn() {
  if [ $# -ne 1 ]; then
    echo "Usage: $FUNCNAME CONTAINER_ID"
    return 1
  fi

	docker stop $1; docker rm $1
}

docker-compose-exec-bash-fn() {
  if [ $# -ne 1 ]; then
    echo "Usage: $FUNCNAME CONTAINER_ID"
    return 1
  fi

  docker-compose exec $1 /bin/sh
}

alias dk="docker"
alias dke='docker-exec-bash-fn'
alias dksh='docker-run-entrypoint-bash-fn'
alias dkrm="docker-stop-rm-container-fn"
alias dkrm-all="docker rm $(docker ps --all -q -f status=exited)"
alias dksp='docker system prune'
alias dkvp='docker volume prune'

alias dkc="docker-compose"
alias dkce='docker-compose-exec-bash-fn'
