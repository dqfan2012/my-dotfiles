export TERM="xterm-256color"

export VISUAL=vim
export EDITOR="$VISUAL"
export COMPOSER_ALLOW_XDEBUG=1
export PHPLS_ALLOW_XDEBUG=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

SAVEHIST=1000
HISTFILE=~/.zsh_history

DEFAULT_USER="samuelstidham"

source ~/antigen/antigen.zsh
#source ~/.fonts/*.sh

# Load the oh-my-zsh library.
antigen use oh-my-zsh

# Bundles from the default repo
antigen bundle bower
antigen bundle chucknorris
antigen bundle command-not-found
antigen bundle composer
antigen bundle encode64
antigen bundle gem
antigen bundle git
antigen bundle git-flow-avh
antigen bundle history
antigen bundle httpie
antigen bundle jsontools
antigen bundle laravel5
antigen bundle mercurial
antigen bundle node
antigen bundle npm
antigen bundle perl
antigen bundle python
#antigen bundle rails
#antigen bundle ruby
antigen bundle sublime
antigen bundle systemd
antigen bundle urltools
antigen bundle vscode
antigen bundle web-search
antigen bundle yarn

# Bundles from zsh-users.
antigen bundle zsh-autosuggestions
#antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme
antigen theme bhilburn/powerlevel9k powerlevel9k

# powerlevel9k config
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="white"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_HIDE_BRANCH_ICON=false

# Tell Antigen that you're done
antigen apply

# Aliases
alias ll="exa -l --git --time-style=long-iso --group-directories-first"
alias l="exa -la --git --time-style=long-iso --group-directories-first"
alias la="exa -lahg --git --time-style=long-iso --group-directories-first"

alias ssh-tntdev2="ssh -i $HOME/Documents/Rackspace\ PPKs/sastidham.pem sastidham@108.166.26.254"

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# rbenv config
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# composer config
export PATH="$HOME/.composer/vendor/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
