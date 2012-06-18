#zstyle ':completion:*' list-colors $LSCOLORS
export LSCOLORS=gxfxcxdxbxegedabagacad
export SCREENDIR="/Users/taise/.screen"
# start screen from given directory
function sc(){
  cd $1
  screen
}
