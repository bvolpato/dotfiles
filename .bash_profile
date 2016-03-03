RED='\033[0;31m'
LIGHT_RED='\033[1;31m'
BLUE='\033[0;34m'
NC='\033[0m'

#bash prefix format - brunovolpato@~/githubworkspace
export PS1="\u@\w$ "

#tab title with the current folder name
export PROMPT_COMMAND='echo -ne "\033]0; ${PWD##*/}\007"'

#import a few dotfiles
source ~/githubworkspace/dotfiles/.spread
