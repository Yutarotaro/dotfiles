# compile if .zwc is old
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   echo "zcompile .zshrc"
   zcompile ~/.zshrc
fi
if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
   echo "zcompile .zshenv"
   zcompile ~/.zshenv
fi
ZSH_HOME=~/.zsh/
for f (${ZSH_HOME}*.zsh) {
  if [ $f -nt $f.zwc ]; then
    echo "zcompile $f"
    zcompile $f
  fi
}

# OS dependent
if [ "$(uname)" = "Darwin" ]; then
  source ${ZSH_HOME}darwin.zsh
else # Linux
  source ${ZSH_HOME}linux.zsh
  source ${ZSH_HOME}cuda.zsh
fi

export ZPLUG_HOME=/opt/homebrew/opt/zplug


# general
source ${ZSH_HOME}zplug.zsh
source ${ZSH_HOME}basic.zsh
source ${ZSH_HOME}commands.zsh
source ${ZSH_HOME}aliases.zsh
source ${ZSH_HOME}python.zsh


export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:~/class/atcoder/ac-library"

function judge(){
	command g++ main.cpp -std=c++17 -I ~/class/atcoder/ac-library && oj t
}

export PATH=/Users/yutaro/Library/Python/3.9/bin/:$PATH
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"


eval "$(starship init zsh)"
eval "$(thefuck --alias)"

sh -c 'mv ~/Downloads/*.pdf ~/Downloads/pdfs  2>/dev/null'
sh -c 'mv ~/Downloads/*.xlsx ~/Downloads/xlsxs  2>/dev/null'
sh -c 'rm -f ~/Downloads/*.dmg  2>/dev/null'
