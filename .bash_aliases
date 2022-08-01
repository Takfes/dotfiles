# =========================================
# GENERAL ALIASES
# =========================================

alias qq="source ~/.bash_aliases"
alias cba="code ~/.bash_aliases"
alias aba="atom ~/.bash_aliases"
alias nba="nano ~/.bash_aliases"
alias vba="vim ~/.bash_aliases"
alias nau="nautilus ."
alias crone="crontab -e"
alias sck="cd ~/Desktop/sckool"
alias docker="sudo docker"
alias hist="history"
alias histg="history | grep "

# =========================================
# GIT ALIASES
# https://jonsuh.com/blog/git-command-line-shortcuts/
# =========================================

alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gf='git fetch'
alias gd='git diff'
alias gdn='git diff --name-only'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gld='git log --stat'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gpl='git pull'
alias gps='git push'
alias gpsd='git push origin --delete '
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'
alias gstc='git stash clear'

alias gg="git add . && git commit -m "
alias gdt="git difftool"
alias gmt="git mergetool"

# alias gdd="git difftool -t meld origin/"
# alias gmm="git mergetool --tool=meld"
# alias gdm="git difftool --dir-dif -y -g -t meld"

gdf () {
    currentBranch=$(git branch --show-current)
    git diff --stat $currentBranch origin/$currentBranch
}

gdfa () {
    currentBranch=$(git branch --show-current)
    echo 'diff checks : '
    echo ''
    for branch in $(git for-each-ref --format='%(refname)' refs/heads/); do
        # git log --oneline "$branch" ^origin/master
        echo '*' [ $currentBranch ] '<--->' [ "$branch" ]
        # git diff --name-status "$branch"
        git diff --stat "$branch"
        # git diff --stat --name-only "$branch"
        echo ''
    done
}

# =========================================
# DOCKER ALIASES
# =========================================

alias dpa="docker ps -a"
alias dvl="docker volume ls"
alias dcu="sudo docker-compose -f docker-compose.yml up -d"
alias dcs="sudo docker-compose stop"
alias dcd="sudo docker-compose down"

alias dcsa="docker container stop $(docker container ls -aq)"
alias dcra="docker container rm $(docker container ls -aq)"

alias dcu_="sudo docker-compose up -d" # Start the docker-compose stack in the current directory
alias dcub="sudo docker-compose up -d --build" # Start the docker-compose stack in the current directory and rebuild the images
alias dcs_="sudo docker-compose stop" # Stop, delete (down) or restart the docker-compose stack in the current directory
alias dcd_="docker-compose down"
alias dcr="docker-compose restart"
alias drm="docker rm $(docker ps -a -q)" # Remove all containers from this machine
alias dex="docker exec -it" # Quickly run the docker exec command like this: 'dex container-name bash'

# Formatted docker ps
alias dps="echo \>\> Running containers : && docker ps --format 'table {{.ID}} - {{.Names}} - {{.Status}} - {{.Image}}'"
alias dpsa="echo \>\> All containers : && docker ps -a --format 'table {{.ID}} - {{.Names}} - {{.Status}} - {{.Image}}'"
alias dpt='docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"'

# Get ip's for all docker compose containers
dip() {
	docker inspect --format='{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
}


dnames() {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}


# =========================================
# EXTRACT
# =========================================

extract() {
    if [ $# -lt 1 ]; then
    echo "Usage: $(basename "$0") file"
    exit 1
    fi
    if [ -f "$1" ]; then
        case $1 in
            *.tar.xz)   tar -xvf "$1"                         ;;
            *.tar.bz2)  tar -jxvf "$1"                        ;;
            *.tar.gz)   tar -zxvf "$1"                        ;;
            *.bz2)      bunzip2 "$1"                          ;;
            *.dmg)      hdiutil mount "$1"                    ;;
            *.gz)       gunzip "$1"                           ;;
            *.tar)      tar -xvf "$1"                         ;;
            *.tbz2)     tar -jxvf "$1"                        ;;
            *.tgz)      tar -zxvf "$1"                        ;;
            *.zip)      unzip "$1"                            ;;
            *.pax)      cat "$1" | pax -r                     ;;
            *.pax.z)    uncompress "$1" --stdout | pax -r     ;;
            *.rar)      7z x "$1"                             ;;
            *.z)        uncompress "$1"                       ;;
            *.7z)       7z x "$1"                             ;;
            *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
