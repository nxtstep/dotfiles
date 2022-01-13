echo "Loading $HOME/.bashrc"

alias envsubst='/usr/local/Cellar/gettext/0.19.7/bin/envsubst'

#TEMP NPM ALIAS
alias npm='echo "Do not do it"'
# ALIAS
alias ls='ls -lah@'

# LOAD ALL AUTOCOMPLETIONS IF ANY ARE INSTALLED
if [ -d /usr/local/etc/bash_completion.d ]; then
    for F in "/usr/local/etc/bash_completion.d/"*; do
        if [ -f "${F}" ]; then
           source "${F}";
        fi
    done
fi

# Swift package management helper(s) swiftxcode, swiftbuild, swifttest, swiftrun
BASHRC_SWIFT="$HOME/.swift/bashrc_swift.sh"
[ -r $BASHRC_SWIFT ] && . $BASHRC_SWIFT

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export JAVA8_HOME=$(/usr/libexec/java_home -v 1.8.0)
export JAVA11_HOME=$(/usr/libexec/java_home -v 11)
#export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
alias java8='export JAVA_HOME=$JAVA8_HOME'
alias java11='export JAVA_HOME=$JAVA11_HOME'
#default to java 8
java8

# Swiftenv
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"

# xcrun simulator aliases
alias xcsim='xcrun simctl list'

# clean xcode
xcreset() {
  killall Xcode
  xcrun -k
  rm -Rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang/ModuleCache"
  rm -Rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang.$(whoami)/ModuleCache"
  rm -Rf ~/Library/Developer/Xcode/DerivedData
  rm -Rf ~/Library/Caches/com.apple.dt.Xcode/*
  rm -Rf ~/Library/Caches/JetBrains/AppCode2020*/DerivedData
  rm -Rf ~/Library/Caches/org.carthage.CarthageKit
}
export -f xcreset

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Pipenv
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

FASTLANE_OPT_OUT_USAGE=1

# Base64 URL and File Safe
alias base64url="base64 | sed 's/\+/-/' | sed -E 's/=+$//'"

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"
