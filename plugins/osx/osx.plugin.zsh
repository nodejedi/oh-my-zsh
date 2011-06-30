alias showfiles='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Recursively delete .DS_Store files
alias rm-dsstore="find . -name '*.DS_Store' -type f -delete"

function savepath() {
  pwd > ~/.current_path~
}

function tab() {
  if [ $# -ne 1 ]; then
      PATHDIR=`pwd`
  else
      PATHDIR=$1
  fi

  osascript -e "Tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down" -e "Tell application \"System Events\" to tell process \"Terminal\" to keystroke \"cd $PATHDIR\"" -e "Tell application \"System Events\" to tell process \"Terminal\" to key down return" -e "Tell application \"System Events\" to tell process \"Terminal\" to keystroke \"clear\"" -e "Tell application \"System Events\" to tell process \"Terminal\" to key down return"
}

function cdoi() {
  if [ $# -ne 1 ]; then
      PATHDIR=`pwd`
  else
      PATHDIR=$1
  fi

  osascript -e "Tell application \"System Events\" to tell process \"Terminal\" to keystroke \"cd ..\"" -e "Tell application \"System Events\" to tell process \"Terminal\" to key down return" -e "Tell application \"System Events\" to tell process \"Terminal\" to keystroke \"cd $PATHDIR\"" -e "Tell application \"System Events\" to tell process \"Terminal\" to key down return"
}

function quick-look() {
  (( $# > 0 )) && qlmanage -p $* &>/dev/null &
}

function man-preview() {
  man -t "$@" | open -f -a Preview
}

function trash() {
  local trash_dir="${HOME}/.Trash"
  local temp_ifs=$IFS
  IFS=$'\n'
  for item in "$@"; do
    if [[ -e "$item" ]]; then
      item_name="$(basename $item)"
      if [[ -e "${trash_dir}/${item_name}" ]]; then
        mv -f "$item" "${trash_dir}/${item_name} $(date "+%H-%M-%S")"
      else
        mv -f "$item" "${trash_dir}/"
      fi
    fi
  done
  IFS=$temp_ifs
}
