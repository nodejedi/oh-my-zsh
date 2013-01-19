if [ -d ~/nvm ]
then
  echo "\033[0;34m Loading nvm default\033[0m"
  nvm use default
fi

if [ -d ~/.rvm ]
then
  echo "\033[0;34m Loading rvm default\033[0m"
  rvm use default
fi

sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
