if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

GIT_PS1_SHOWDIRTYSTATE=true

export PS1="\n\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(__git_ps1)\n\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# navigation
alias back="up"
alias c="clear"
alias cls="clear"
alias ls="ls -GFh"
alias ..="up"

l()
{
	cd $1
	ls
}

up()
{
	if [[ $1 == "" ]]; then
	 	l ..
	 	return
	fi
	COUNTER=$1
	until [  $COUNTER -lt 1 ]; do
	    cd ..
	    let COUNTER-=1
	done
	ls
}

# random
alias reload=". ~/.bash_profile"
alias today="date +%Y-%m-%d"
alias snowman="cls && echo '
  _===_
 \\(.,.)
  ( : )\\
  ( : )'"

# git
alias checkout="git checkout"
alias count="git rev-list HEAD --count"
alias d="git diff"
alias dc="git diff --cached"
alias s="status"
alias status="git status -sb"
alias tree="git log --graph --simplify-by-decoration --pretty=format:'%C(green)%cr %C(white)%d' --all"

commits()
{
	git log --graph --decorate=short $@ | emojify
}

last()
{
	git log -1 --pretty=format:'%C(green)%cr %C(bold blue)<%an>%C(white)%n%B' | emojify
	git diff --stat HEAD^1
}

log()
{
	git log --graph --pretty=format:'%Cgreen%cr %Cred%h %C(bold blue)<%an> %Creset%s %+d' --branches $@ | emojify
}

push() {
    if [[ $1 == "this" ]]; then
        command git push origin HEAD "${@:2}"
    else
        command push "$@"
    fi
}
