
source ~/.bash_profile;

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# tabtab source for jhipster package
# uninstall by removing these lines or running `tabtab uninstall jhipster`
[ -f /Users/brunovolpato/.config/yarn/global/node_modules/tabtab/.completions/jhipster.bash ] && . /Users/brunovolpato/.config/yarn/global/node_modules/tabtab/.completions/jhipster.bash