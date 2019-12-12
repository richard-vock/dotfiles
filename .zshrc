# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/slim/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# vars
export PATH=~/.local/bin:$PATH:/usr/local/bin
export LIBPATH=$LIBPATH:/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export EDITOR=nvim
export VALGRIND_OPTS="--leak-check=yes --num-callers=8 --show-reachable=no --show-possibly-lost=no --track-origins=yes"
export PS1="> "

# aliases
alias make="make -j 4"
alias ninja="ninja -j 4"
alias cmake="cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1"
alias pdflatex="pdflatex -file-line-error -halt-on-error"
alias grep="egrep --color -I -n"

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"

# misc
bindkey -v '^?' backward-delete-char
