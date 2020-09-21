# Set up variables
export EDITOR="nvim"

# Set up pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Set up nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Set up Oh My Zsh!
export ZSH="/home/divykj/.oh-my-zsh"
export ZSH_THEME="refined"
plugins=(safe-paste themes zsh-autosuggestions history-substring-search zsh-syntax-highlighting zsh-z k)
source $ZSH/oh-my-zsh.sh

# Set up auto change node version using .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Connect device using wireless adb, with React Native's Fast Refresh
rn-wireless() {
  adb connect "$1"
  adb -s "${1}:5555" reverse tcp:8081 tcp:8081
}

# Set up all connected adb devices for React Native's Fast Refresh
rn-prepare-devices() {
    adb devices | while read line
    do
        if [ ! "$line" = "" ] && [ `echo $line | awk '{print $2}'` = "device" ]
        then
            device=`echo $line | awk '{print $1}'`;
            adb -s "$device" reverse tcp:8081 tcp:8081;
            echo "Prepared $device";
        fi
    done
}

# Set up thefuck
fuck () {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_SHELL=zsh;
    export TF_ALIAS=fuck;
    TF_SHELL_ALIASES=$(alias);
    export TF_SHELL_ALIASES;
    TF_HISTORY="$(fc -ln -10)";
    export TF_HISTORY;
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
        thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
    ) && eval $TF_CMD;
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    test -n "$TF_CMD" && print -s $TF_CMD
}

# Set alias for dotfiles management
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Function to edit and reload `.zshrc`
erc() {
  $EDITOR ~/.zshrc
  source ~/.zshrc
}

# Show system info on start
neofetch
