# Add common executable paths to PATH
set -x PATH /usr/local/bin $HOME/.local/bin $HOME/.local/sbin $PATH

# Add Java Home
set -x JAVA_HOME /usr/lib/jvm/java-8-openjdk

# Add Android Studio path
set -x ANDROID_HOME $HOME/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/tools
set -x PATH $PATH $ANDROID_HOME/tools/bin
set -x PATH $PATH $ANDROID_HOME/platform-tools

# Add pyenv path
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH

# Add nvm path
set -x NVM_DIR $HOME/.nvm

# Add cargo path
set -x PATH $HOME/.cargo/bin $PATH

# Add yarn bins
set -x PATH (yarn global bin -s --offline) $PATH

set -x CHROME_EXECUTABLE /usr/bin/google-chrome-stable

# Add Hadoop 2 path
# set -x HADOOP_INSTALL /usr/share/hadoop-2.10.1
# set -x HADOOP_MAPRED_HOME $HADOOP_INSTALL
# set -x HADOOP_COMMON_HOME $HADOOP_INSTALL
# set -x HADOOP_HDFS_HOME $HADOOP_INSTALL
# set -x YARN_HOME $HADOOP_INSTALL
# set -x HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_INSTALL/lib/native
# set -x HADOOP_OPTS "-Djava.library.path=$HADOOP_INSTALL/lib"
# set -x HADOOP_CONF_DIR $HADOOP_INSTALL/etc/hadoop
# set -x YARN_CONF_DIR $HADOOP_INSTALL/etc/hadoop
# set -x PATH $PATH $HADOOP_INSTALL/bin
# set -x PATH $PATH $HADOOP_INSTALL/sbin
# set -x PATH $PATH $HADOOP_CONF_DIR/bin
# set -x PATH $PATH $YARN_CONF_DIR/sbin
