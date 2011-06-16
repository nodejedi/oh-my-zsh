# PROTIP: use this the first time, then save it as a Textmate Project.
# Then use `open app_name.tmproj` to save what files you had open, etc.

m() 
{
  # Shell (bash) function which opens a directory as a project in TextMate  
  #   excluding directories that tend to slow down "Find in Project"
  #
  # Add this function to your dotfiles or ~/.bash_profile for it to be available
  # in your shell.
  
  shopt -s extglob  # Enable extended globbing
   
  # Invoke TextMate upon all the files and directories except those listed
  mate !(@(cache|db|log|tmp)) "$@"
  
  shopt -u extglob  # Disable extended globbing
}