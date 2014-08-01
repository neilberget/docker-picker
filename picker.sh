#!/bin/bash

picker() {
  # cleanup TARGET file
  local TARGET=$HOME/$1
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

  local __resultvar=$2
  eval $__resultvar=`cut -f1 -d" " $TARGET`
}
