# Add common executable paths to PATH
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Add Android Studio path
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Add pyenv path
export PYENV_ROOT="$HOME/.local/share/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Add nvm path
export NVM_DIR="$HOME/.local/share/nvm"

# Add golang path
export PATH=$PATH:$HOME/.local/share/go/bin

# Add cargo path
export PATH="$HOME/.cargo/bin:$PATH"
