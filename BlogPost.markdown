# It's not enough to bash in heads you've got to bash in minds...with ZSH

<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>Captain Hammer told me they call it bash <a href="http://www.youtube.com/watch?v=VqCXXMvMm6g#t=77s" target="_blank">for a reason</a>... don't say I didn't warn you. Of course I'm talking about my favorite superhero and the default shell in OS X respectively. Now, I'm not here to tell you that using bash is dumb and that you can only be a good developer if you use an alternate shell like ZSH, but I am here to say that when I use bash *I feel* dumb. Bash just seems to get in my way, probably because I never took the time to properly customize it. But now the hard work of terminal customization has been done for us by the oh-my-zsh community. A big thanks to all that have contributed!</td>
    <td><img src='http://cl.ly/6ih2/Captain_Hammer.jpg'></td>
  </tr>
</table>

## Who is this for?
This overview is geared toward developers that are new to working a lot at the command line or for folks that haven't ever tried to customize their prompt. If you're tired of your ugly and unhelpful default shell settings and aren't sure where to get started with customizing it from scratch then both oh-my-zsh and this walkthrough are for you.


## Wait...what is oh-my-zsh again?
Oh-my-zsh is available [on github](https://github.com/robbyrussell/oh-my-zsh "oh-my-zsh github URL") where it's described as:

>"A community-driven framework for managing your zsh configuration. Includes optional plugins for various tools (rails, git, OSX, brew,...), nearly 80 terminal themes, and an auto-updating tool so that you can keep up with the latest improvements from the community." 


## OK, I'm convinced... help me get it installed!
There is a great README provided on the github page referenced above, but I'll highlight a few items here. The first and most critical step is one you actually won't find in the README... **fork the repository and get a copy that you can tweak on yourself**. The main reason is so you have a version of oh-my-zsh that can easily be installed on any server with all your custom theme settings and aliases. We'll get to customization later but keep in mind that installing oh-my-zsh is not at all permanent. There is a great uninstaller so it's easy to try out one fork and remove all traces of that code easily so you can install another fork (probably your own) later. Or if you try it out but hate it, **getting back to your old prompt is a single "uninstall\_oh\_my\_zsh" command away**. For now, let's just dive in!

To get oh-my-zsh installed simply issue this single command in your current terminal:
    
    wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    
**Note:** even if you're doing this from your own fork it's still going out to Robby Russell's git repo to do the clone. I'll help you fix that [later](#editinstallsh).

One of two things will happen next. If you're on OS X and don't have wget installed or accessible to your path then you'll get an error. If that's the case then go check out [Homebrew](http://mxcl.github.com/homebrew/). Conveniently the demo they give is installing wget:

    brew install wget

You'll actually need to have Homebrew installed before you can run the above command, but we'll leave that as an exercise to the reader. If you're on linux and don't have wget installed then just add it with your distro's package manager. On Ubuntu: 

    sudo apt-get install wget

Once you have your wget error resolved re-run the installer command and proceed.

If you didn't get an error during installation then you should receive something similar to the following terminal output:

[![oh-my-zsh installation terminal output](http://f.cl.ly/items/3t1H2O313L2N0O1s3p1y/Screen%20shot%202011-05-12%20at%2012.35.14%20PM.png "view larger version of oh-my-zsh installation terminal output")](http://cl.ly/6hTL/Screen_shot_2011-05-12_at_11.30.15_AM.png)

All that's left to do it open a new tab or terminal window and you're off and running! The new theme that you see is the robbyrussell theme. It's pretty cool, but it might not include everything *you* want out of your prompt. In a second I'll [show you my theme](#mytheme) and help you create your own, but first let's take a side trip and make sure our .zshrc file is setup properly.

## Using RVM with ZSH (you do use RVM don't you?!?)

If you haven't taken a look at your .zshrc file yet I'd recommend doing so now. It'll be installed as a hidden "dotfile" in your home directory located at: ~/.zshrc. Just after installation mine looks like this:


    # Set name of the theme to load.
    # Look in ~/.oh-my-zsh/themes/
    # Optionally, if you set this to "random", it'll load a random theme each
    # time that oh-my-zsh is loaded.
    export ZSH_THEME="robbyrussell"

    # Set to this to use case-sensitive completion
    # export CASE_SENSITIVE="true"

    # Comment this out to disable weekly auto-update checks
    # export DISABLE_AUTO_UPDATE="true"

    # Uncomment following line if you want to disable colors in ls
    # export DISABLE_LS_COLORS="true"

    # Uncomment following line if you want to disable autosetting terminal title.
    # export DISABLE_AUTO_TITLE="true"

    # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
    # Example format: plugins=(rails git textmate ruby lighthouse)
    plugins=(git)

    source $ZSH/oh-my-zsh.sh

    # Customize to your needs...
    export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

Sweet! The PATH directive was carried over from the ~/.bash\_profile! Let's clean this up a bit and try out another theme. Remember to see the theme change you have to open a new tab or window, or quit and restart terminal so your .zshrc changes can be loaded. The last line is what you need to allow RVM to dynamically manage your path. You shouldn't put anything below that last line. This isn't a tutorial on how to setup RVM, so if you get stuck please head over to their [awesome site](http://beginrescueend.com/) for more info on [installation](http://beginrescueend.com/rvm/install/) and [ZSH integration](http://beginrescueend.com/integration/zsh/).

    # Path to your oh-my-zsh configuration.
    export ZSH=$HOME/.oh-my-zsh

    # specify a theme
    export ZSH_THEME="Soliah"

    # load from the available list of plugins at ~/.oh-my-zsh/plugins
    plugins=(git git-flow rails textmate ruby cap brew gem github mysql osx vagrant)

    source $ZSH/oh-my-zsh.sh
    # source ~/.git-flow-completion.zsh #you have to paste that file to that location then

    export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/bin/mysql

    # load RVM
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

Much better :) You can see I added "/usr/bin/mysql" to the path because I need it (each directory on the path is separated by a colon). Feel free to ignore that if you don't use MySQL.


## <span id="mytheme">Theme settings</span>

As promised, here is the theme that I am currently running:

[![oh-my-zsh j2fly theme screen shot](http://f.cl.ly/items/440l0s473z1j3w1A162t/zsh%20prompt%20annotated%20small.png "view larger version of oh-my-zsh j2fly theme screen shot")](http://cl.ly/6gqi)

Below is the zsh-theme file that I'm specifying in my .zshrc config. This theme was made possible by combining ideas from many of the excellent themes that are already out there and adding a few of my own tweaks. The color scheme was inspired from [a post](http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/) I read a year or so ago by Steve Losh that introduced me to oh-my-zsh. Again, a huge thanks to all the authors that have contributed forks and themes.

    # Shows little symbol '±' if you're currently at a git repo and '○' all other times
    function prompt_char {
        git branch >/dev/null 2>/dev/null && echo '±' && return
        echo '○'
    }

    function virtualenv_info {
        [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
    }


    # Build the main prompt
    if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
        PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)${return_code}$(git_prompt_status)%{$reset_color%}
    $(virtualenv_info)$(prompt_char) '

        ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
        ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
        ZSH_THEME_GIT_PROMPT_DIRTY=""
        ZSH_THEME_GIT_PROMPT_CLEAN=""

        # Display exitcode on the right when >0
        return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

        # Loads rvm info to the right side of the zsh prompt showing: ruby-version@gemset-name
        RPROMPT='$(~/.rvm/bin/rvm-prompt)'

        # Displays different symbols (simultaneously) depending on the current status of your git repo.
        ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
        ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
        ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
        ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
        ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
        ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
    else
        PROMPT='[%n@%m:%~$(git_prompt_info)]
    %# '

        ZSH_THEME_GIT_PROMPT_PREFIX=" on"
        ZSH_THEME_GIT_PROMPT_SUFFIX=""
        ZSH_THEME_GIT_PROMPT_DIRTY=""
        ZSH_THEME_GIT_PROMPT_CLEAN=""

        # Display exitcode on the right when >0
        return_code="%(?..%? ↵)"

        RPROMPT='${return_code}$(git_prompt_status)'

        ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
        ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
        ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
        ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
        ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
        ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
    fi





## Awesome aliases and plugins
So now that we have the theme setup and RVM loaded properly it's time to show you some of the awesome aliases and plugins that are available. I recommend loading up the ~/.oh-my-zsh directory in your favorite editor and browsing around to get familiar because there is a goldmine of syntactic sugar for many of the long / hard to remember operations we perform every day. I'll list a few of the ones I use on a daily basis and what location they're found in.

### Aliases

    | Alias           | Full Command                       | Location                           |
    |:----------------|:-----------------------------------|:-----------------------------------|
    | l               | ls -la                             | lib/aliases.zsh                    |
    | ll              | ls -l                              | lib/aliases.zsh                    |
    | ..              | cd ..                              | lib/directories.zsh                |
    | ...             | cd ../..                           | directories.zsh                    |
    | mcd(my_folder)  | mkdir -p my_folder && cd my_folder | lib/directories.zsh                |
    | gst             | git status                         | plugins/git/git.plugin.zsh         |
    | gb              | git branch                         | plugins/git/git.plugin.zsh         |
    | gca -m "commit" | git commit -a -m "commit"          | plugins/git/git.plugin.zsh         |
    | gp              | git push                           | plugins/git/git.plugin.zsh         |
    | gco             | git checkout                       | plugins/git/git.plugin.zsh         |
    | bi              | bundle install                     | plugins/bundler/bundler.plugin.zsh |
    | bu              | bundle update                      | plugins/bundler/bundler.plugin.zsh |

When you need a break to laugh, load up the "lol"" plugin (plugins/lol/lol.plugin.zsh) and get fun/silly aliases like:

    | Alias     | Full Command |
    |:----------|:-------------|
    | rtfm      | man          |
    | hai       | cd           |
    | nomz      | ps -aux      |
    | kthxbai   | halt         |
    | icanhas   | mkdir        |
    | donotwant | rm           |
    | dowant    | cp           |

### Plugins*

    | Cmd (type what's in quotes) | What it does                     | Location                   |
    |:----------------------------|:---------------------------------|:---------------------------|
    | "tab" + enter               | New term tab w/ same working dir | plugins/osx/osx.plugin.zsh |
    | "rake" + space, hit tab key | Autocomplete avail rake tasks    | Not sure actually          |
    | "cap" + space, hit tab key  | Autocomplete avail cap tasks     | plugins/cap/cap.plugin.zsh |
    | "brew" + space, hit tab key | Autocomplete avail brew commands | plugins/brew/_brew         |


*Some of the plugins are broken (or were for me anyway), so if you want all the plugins to work (with the tab completion of cap and rake tasks, as well as the "tab" command itself to open a new tab with your current path preserved), you'll have to fork from [my repo](https://github.com/j2fly/oh-my-zsh) where I have fixed them. I've submitted a pull request for Robby to get these changes back upstream to the the main repo.


## Tab completion

ZSH is great at tab completion and more specifically progressive tab completion. You can tab through some directories and hit enter to accept that directory as the one you want at the first level, then continue tabbing through the next deepest set of directories without executing the command until you're ready. In my experience, bash would commit your current text as a command if you hit enter mid-tab completion. Try out tab completion for yourself! You can even tab complete to remote servers. If you're trying to scp a file to a remote server and you don't remember what user directory you want to put it under you can do something like this:

![Tab completion to remote server](http://f.cl.ly/items/1H3t0d3M3z3l1I2B3Q0X/Screen%20shot%202011-05-12%20at%202.49.35%20PM.png)


## Customization

OK, so you've tried out some of the cool stuff ZSH and specifically oh-my-zsh has to offer and you want to make some changes to your own fork. Great! Check out what I customized and then poke around and hack on oh-my-zsh until you've made it perfect for you.

Files you'll want to edit:

* install.sh
* your_theme.zsh-theme
* templates/zshrc.zsh-template
* README
* custom/my_cool_aliases.zsh


### <span id="editinstallsh">install.sh</span>
Just because the installer takes a git repo at the command line doesn't mean that is the git repo it'll actually clone to your ~/.oh-my-zsh folder during install. If you look at the install.sh file in the "tools" folder [you'll see line 8](https://github.com/j2fly/oh-my-zsh/blob/master/tools/install.sh#L8) (as of this writing) is where the git repo is specified. Mine is: 

    /usr/bin/env git clone https://github.com/j2fly/oh-my-zsh.git ~/.oh-my-zsh

Make sure to change that URL to be **your** repo's URL.

### Your Theme
Just add your own something.zsh-theme to the themes folder and specify it in your templates/zshrc.zsh-template so it's the theme specified when you install from your fork.


### zshrc.zsh-template
Edit this file to customize what the .zshrc file will look like when you install oh-my-zsh from your fork. For instance, I include the RVM hooks in my fork (commented out), and I make sure that the theme that is defined is the "j2fly" theme since that is the one I customized for myself.


### Readme
Now I'll probably catch flack for telling you to edit the README of an open source project, but hey... I want the install URL to be easily accessible. The install command for me to use my fork is:

    wget --no-check-certificate https://github.com/j2fly/oh-my-zsh/raw/master/tools/install.sh -O - | sh


### Custom
So that you don't have to dirty up any of the other files in the "lib" or "plugins" directories just to add some of your own aliases, oh-my-zsh will automatically load any files with the .zsh extension from the "custom" folder. I have some cool aliases defined of my own including:

    alias rvm_install_shortcut='bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)'

At first glance that might not seem like much of a shortcut, but remember ZSH can tab-complete almost anything and since usually at this point RVM isn't installed yet, all I have to do is type "rvm", hit the tab key and then it'll complete the install alias to go install me some tasty RVM!

##Protip
If you want to be able to customize your oh-my-zsh install directly in place at ~/.oh-my-zsh and push those changes to github without having to maintain a separate repo, you can do it with one small change. Open the ~/.oh-my-zsh/.git/config file and change the remote origin to be your git clone URL (which has read and write access).

Change this:

    [remote "origin"]
    	fetch = +refs/heads/*:refs/remotes/origin/*
    	url = https://github.com/j2fly/oh-my-zsh.git
    	
To this:

    [remote "origin"]
    	fetch = +refs/heads/*:refs/remotes/origin/*
    	url = git@github.com:j2fly/oh-my-zsh.git

Using your clone URL, not mine :)

## Making it all rock with a dark background and Visor

I have a 1920x1200 display and I use [Visor](http://visor.binaryage.com/) exclusively for working with my terminal. I find that even with all the screen real-estate that I could possibly want, the terminal just isn't something I want to dedicate to a portion of pixels on my screen. Visor helps keep the terminal front and center when you need it and totally hidden when you don't.

The key bindings to "fade" or "fly in" the terminal window are ctrl+\` or if you have the double tap ctrl option enabled then you can hit ctrl+ctrl to pop open the window. I prefer to leave the double tap option off however as I find that I usually only accidentally trigger the visor when it's enabled.

With today's widescreen monitors I think it makes the most sense to have the terminal fly in from the right hand side. I also keep my dock attached to the left side of my screen so that I can work at full height in the "middle". I have my terminal window settings configured to have it take up 129 columns and 24 rows. This makes the terminal fly in to the perfect spot to leave the other half of my screen (minus the room for the dock positioned on the left) available for a browser or code.

I use the awesome [SizeUp](http://irradiatedsoftware.com/sizeup/) and [Cinch](http://irradiatedsoftware.com/cinch/) apps to allow me to position any given window to either the left or right half of my screen (like the windows 7 snap feature) which makes this setup even cooler.

![My full desktop with visor open](http://f.cl.ly/items/363w3K0j3I0K0d25111j/full%20desktop.png)

If you like Visor, I highly recommend that you check out [TotalFinder](http://totalfinder.binaryage.com/) as well. It's also from BinaryAge, an indy Mac software shop so support both them and Irradiated Software with a purchase or donation if you like their tools!

## Wrap up

Hopefully you got some insight in to how I have my terminal setup and it's inspired you to go customize your own prompt and setup visor the way you like. It's ok to spend a few hours getting things setup just the way you like so that you can have a more pleasant terminal experience every time you sit down to develop. Just remember to commit your changes to your github fork so you can easily restore your preferences when you reformat your laptop, or heck... I install my prompt on servers that I am the sys admin for!

Post any questions or share your thoughts in the comments below. I look forward to hearing from you about your own oh-my-zsh experience!

~Jon