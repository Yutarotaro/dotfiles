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
sh -c 'mv ~/Downloads/*.jpeg ~/Downloads/pictures  2>/dev/null'
sh -c 'mv ~/Downloads/*.jpg ~/Downloads/pictures  2>/dev/null'
sh -c 'mv ~/Downloads/*.png ~/Downloads/pictures  2>/dev/null'
sh -c 'rm -f ~/Downloads/*.dmg  2>/dev/null'


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# cmake qt5
export CMAKE_PREFIX_PATH=/opt/homebrew/Cellar/qt@5/5.15.3:$CMAKE_PREFIX_PATH

export CMAKE_PREFIX_PATH=/opt/homebrew/Cellar/spdlog/1.10.0/include/spdlog/:$CMAKE_PREFIX_PATH

# geant4
pushd /Users/yutaro/2022/research/geant4-install/share/Geant4-11.0.2/geant4make/
source geant4make.sh
popd
export PATH="/opt/homebrew/opt/opencv@2/bin:$PATH"
