#!/bin/bash

dtail() {
  _picker ID

  local COMMAND="docker logs -f $ID"

  eval $COMMAND
  eval "history -s $COMMAND"
}

dlogs() {
  _picker ID

  local COMMAND="docker logs $ID"

  eval $COMMAND
  eval "history -s $COMMAND"
}

dinspect() {
  _picker ID

  local COMMAND="docker inspect $ID"

  eval $COMMAND
  eval "history -s $COMMAND"
}

dattach() {
  _picker ID

  local COMMAND="docker attach $ID"

  eval $COMMAND
  eval "history -s $COMMAND"
}


ddestroy() {
  _picker ID

  local COMMAND="docker stop $ID && docker rm $ID"

  eval $COMMAND
  eval "history -s $COMMAND"
}

# Helper method used by all of above to invoke vim with docker ps contents
# and parse out the selected line's container id
_picker() {
  # cleanup TARGET file
  local TARGET=$HOME/.pickthis
  if [ -e "$TARGET" ]; then
    rm "$TARGET"
  fi

  docker ps | vim \
    -c "setlocal noreadonly" \
    -c "setlocal number" \
    -c "setlocal cursorline" \
    -c "nnoremap <buffer> <CR> V:w! $TARGET<CR>:qa!<CR>" \
    -c "vnoremap <buffer> <CR>  :w! $TARGET<CR>:qa!<CR>" \
    -R -

  # nothing was selected, abort
  if [ ! -e "$TARGET" ]; then
    return
  fi

  # Get the container id out of the first column
  local __resultvar=$1
  eval $__resultvar=`cut -f1 -d" " $TARGET`
}

