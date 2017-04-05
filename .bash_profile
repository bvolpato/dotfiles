

#import a few dotfiles
source ~/githubworkspace/dotfiles/.spread

# TOTVS
export MDM_REPO=/Users/brunovolpato/githubworkspace/mdm
export MDM_QA_REPO=/Users/brunovolpato/githubworkspace/mdmqa
export TOTVSLABS_FRAMEWORK_REPO=/Users/brunovolpato/githubworkspace/totvslabs-framework
export IDM_REPO=/Users/brunovolpato/githubworkspace/identity/idm
source ~/shared/.spread

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export ANDROID_HOME=/Users/brunovolpato/Library/Android/sdk
export CUDA_HOME=/usr/local/cuda

export FASTTHREAD_TOKEN=$(cat ~/Dropbox/Bruno/fastthread_token.txt)

##
# Your previous /Users/brunovolpato/.bash_profile file was backed up as /Users/brunovolpato/.bash_profile.macports-saved_2016-04-27_at_22:06:15
##

# MacPorts Installer addition on 2016-04-27_at_22:06:15: adding an appropriate PATH variable for use with MacPorts.
export PATH="$DYLD_LIBRARY_PATH:/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"


eval "$(thefuck --alias)"
eval $(/usr/libexec/path_helper -s)


if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1

    . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
