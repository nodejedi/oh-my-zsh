# PROTIP: use this `m .` command the first time, then save it as a 'tmproj'
# aka Textmate Project. Then use `open app_name.tmproj` and TextMate will 
# save what files / tabs you had open, etc.

m() 
{
  # Shell (bash/zsh) function which opens a directory as a project in TextMate
  # excluding directories that tend to slow down "Find in Project"
  #
  # Add this function to your dotfiles or ~/.bash_profile or ~/.zshrc for it 
  # to be available in your shell.
  
  # shopt -s extglob  # Enable extended globbing for bash
  setopt extended_glob # Enable extended globbing for zsh
   
  # Invoke TextMate upon all the files and directories except those listed
  mate !(@(cache|log|tmp|*.tmproj)) "$@"
  
  # shopt -u extglob  # Disable extended globbing for bash
  setopt extended_glob  # Disable extended globbing for zsh
}