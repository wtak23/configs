#|----- Problem with bash complaining "\r command not found" -----|# 
#|http://stackoverflow.com/questions/11616835/cgywin-r-command-not-found-bashrc-bash-profile
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is needed

#| The bash startup files: http://www.linuxfromscratch.org/blfs/view/6.3/postlfs/profile.html

#=============================================================================#
# cygwin/windows specific setup 
# (part that's difference from my bashrc file on my linux comptuers)
#=============================================================================#
____bookmark_windows_specific_configs____(){ echo "windows specific" ; }
    #---------------------------------------------------------------------------#
    # How to use gitk in cygwin
    # http://stackoverflow.com/questions/9393462/cannot-launch-git-gui-using-cygwin-on-windows
    #---------------------------------------------------------------------------#
    export DISPLAY=:0.0
    # export DISPLAY=Cygwin:0.0

    # to enable git auto complete (pdf-pg37 progit, 3.7.1)
    source /etc/bash_completion.d/git
    alias bsource="source ${HOME}/.bashrc"

    #---------------------------------------------------------------------------#
    # change HOME to windows home (not cygwin)
    #---------------------------------------------------------------------------#
    export HOME="/cygdrive/c/Users/takanori"
    export HOME_WIN="/cygdrive/c/Users/takanori"
    export HOME_CYG="/home/takanori"

    #=============================================================================#
    # convert windows directory to cygwin type
    #-----------------------------------------------------------------------------#
    # ref: 
    # http://stackoverflow.com/questions/19999562/bash-script-to-convert-windows-path-to-linux-path
    # http://stackoverflow.com/questions/11814374/shell-reading-backslash-in-command-line-parameters
    #=============================================================================#
    cdwin(){
        set $(history | tail -1 )
        shift 2
        path="$*"
        cd "$(cygpath "$path")" #<- never knew about ``cygpath`` command
    }

    #| deprecated...I'd have to include quotes to the argument everytime using below, which is tedious
    # cdwin(){
    #     echo "I receive the variable --> $1"
    #     line=$(sed -e 's#^J:##' -e 's#\\#/#g' <<< "$1")
    #     echo "$line"
    # }

    #-------------------------------------------------------------------------#
    # foxit reader
    # - can't invoke by relative path (eg: ``$foxit ./dir/file.pdf`` won't work)
    # - hence call by full absolute path
    #-------------------------------------------------------------------------#
    # (10/10/2014)
    # - found out about ``cygpath``,very useful!
    #-------------------------------------------------------------------------#
    #| Need a function that converts cygdrive-bash directories into windows directory form...good exercise to work on for the future
    foxit(){ # example usage: $foxit hw1/sol1.pdf
        if [ -z $1 ]; then 
            echo "Hey Tak, give an argument!"
        else
            #-----------------------------------------------------------------#
            # first convert input to full path in windows filesystem form
            #-----------------------------------------------------------------#
            set $(history | tail -1 )
            shift 2
            path="$*"
            foxitEx="/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/FoxitReader.exe"

            # echo $(cygpath -w "$PWD$1")
            # echo $foxitEx $(cygpath -w "$PWD\\$1")
            "$foxitEx" $(cygpath -w "$PWD\\$1") &

            # echo $(cygpath "$path")
            # "/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/Foxit Reader.exe" $1 & <- nope

            # echo "/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/Foxit Reader.exe $PWD$1"
            # echo "/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/Foxit Reader.exe" "$PWD$1" &
            # "/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/Foxit Reader.exe" $pwd$1 &
        fi
    }    

    #| when i want to pass full-file-path in windows directory system
    winfoxit(){ # example usage: $winfoxit C:\Users\takanori\Dropbox\research_dropbox\latex\eecs545_gsi_f2014\hw6\sol6.pdf
        if [ -z $1 ]; then 
            echo "Hey Tak, give an argument!"
        else
            set $(history | tail -1 )
            shift 2
            path="$*"
            foxitEx="/cygdrive/C/Program Files (x86)/Foxit Software/Foxit Reader/FoxitReader.exe"

            # echo $(cygpath -w "$PWD$1")
            echo $foxitEx $(cygpath -w "$1")
            "$foxitEx" $(cygpath -w "$1") &
        fi
    }    

    winSumatra(){ # example usage: $winsumatra C:\Users\takanori\Dropbox\research_dropbox\latex\eecs545_gsi_f2014\hw6\sol6.pdf
        set $(history | tail -1 )
        shift 2
        path="$*"
        # echo "/cygdrive/C/Program Files (x86)/SumatraPDF/SumatraPDF.exe" $(cygpath -w "$1")
        "/cygdrive/C/Program Files (x86)/SumatraPDF/SumatraPDF.exe" $(cygpath -w "$1") &
    }    

    winsublime(){
        set $(history | tail -1 )
        shift 2
        path="$*"
        # echo "/cygdrive/C/Program Files/Sublime Text 3/sublime_text.exe" $(cygpath -w "$1") 
        "/cygdrive/C/Program Files/Sublime Text 3/sublime_text.exe" $(cygpath -w "$1") &
    }   

#=============================================================================#
# wrapper aliases to invoke programs from cygwin 09-02-2016 (15:21)
#=============================================================================#
____bookmark_winprogram____(){ echo "" ; }
  alias sumatra='"/cygdrive/C/Program Files (x86)/SumatraPDF/SumatraPDF.exe"'
  alias chrome='"/cygdrive/C/Program Files (x86)/Google/Chrome/Application/chrome.exe"'
  alias google-chrome='"/cygdrive/C/Program Files (x86)/Google/Chrome/Application/chrome.exe"'
  alias subl='"/cygdrive/C/Program Files/Sublime Text 3/sublime_text.exe"'

#=============================================================================#
# Set env-vars
#-----------------------------------------------------------------------------#
# http://serverfault.com/questions/606/what-is-the-best-way-to-set-an-environmet-variable-in-bashrc
#=============================================================================#
____bookmark_ENVVARS____(){ echo "I'm just a bookmark"; }
  #export PATH=$PATH:"C:\Program Files\Amazon\AWSCLI"
  # http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-msi-on-windows
  export PATH=$PATH:"/cygdrive/c/Program Files/Amazon/AWSCLI"
  export DIR_GIT="/cygdrive/c/Users/takanori/Dropbox/git"
  export DIR_DB='/cygdrive/c/Users/takanori/Dropbox'

  #| set path for my custom shell
  export PATH=$PATH:"${DIR_GIT}/configs/source/bash_config/bin"

  # added to get conda from cygwin (2016-08-22)
  PATH=/cygdrive/c/Users/takanori/Anaconda2:$PATH
  PATH=/cygdrive/c/Users/takanori/Anaconda2/Scripts:$PATH

  #| for javac
  #| Ref: http://stackoverflow.com/questions/4918830/how-can-i-set-my-cygwin-path-to-find-javac
  export PATH=$PATH:"/cygdrive/C/Program Files/Java/jdk1.8.0_20/bin/"

  #| to run ipython.bat that shipped with enthrought canopy
  #export PATH=$PATH:"/cygdrive/c/users/takanori/appdata/local/enthought/canopy/user/scripts/"

#=============================================================================#
# alias to change default options of a command
#=============================================================================#
____bookmark_default_options____(){ echo "" ; }
  # alias less='less -r'              # raw control characters
  alias whence='type -a'              # where, of a sort
  alias grep='grep -P --color=always' # use perl engine as default
  alias egrep='egrep --color=always'  # show differences in colour
  alias fgrep='fgrep --color=always'  # show differences in colour
  
  # Some shortcuts for different directory listings
  #alias ls='ls -hF --color=tty'                     # classify files in colour
  alias ls='ls --color -h --group-directories-first' # http://superuser.com/questions/109537/unix-ls-how-to-sort-first-directories-then-files-etc
  alias dir='ls --color=auto --format=vertical'
  alias vdir='ls --color=auto --format=long'
  alias ll='ls -l'                              # long list
  alias la='ls -A'                              # all but . and ..
  alias l='ls -CF'                              #

#=============================================================================#
# General convenience commands (most will go here)
#=============================================================================#
____bookmark_convenience____(){ echo ""; }
  #--------------------------------------------------------------------------#
  # disk space
  #--------------------------------------------------------------------------#
  alias dspace='du -h --max-depth=1'
  alias dspace2='du -h --max-depth=1 | sort -h'
  alias dspace3='du -ah --max-depth=1 | sort -h'

  #http://stackoverflow.com/questions/1412423/display-only-files-and-folders-that-are-symbolic-links-in-tcsh-or-bash
  alias ls_sym='ls -l $(find ./ -maxdepth 1 -type l -print)'

  #http://stackoverflow.com/questions/17066250
  alias print_time='echo $(date +"%Y-%m-%d_%H:%M:%S")'

  #http://stackoverflow.com/questions/7110119 (history with no line-numbers)
  alias hist_nonum='history | cut -c 8-'

  #| added 08-24-2016 (16:11)
  # remove color from stdou (wow, harder than i expected) 
  #http://stackoverflow.com/questions/17998978/removing-colors-from-output
  #http://unix.stackexchange.com/questions/111899/how-to-strip-color-codes-out-of-stdout-and-pipe-to-file-and-stdout
  alias stripcolors='sed "s/\x1B\[\([0-9]\{1,2\}\(;[0-9]\{1,2\}\)\?\)\?[mGK]//g"'
  tw_print_function_name(){
    #=========================================================================#
    # print function names defined here
    # (since these don't show up in $ alias 
    #=========================================================================#
    # http://stackoverflow.com/questions/1184268/unix-sort-treatment-of-underscore-character
    # LC_COLLATE=C will make underscore sorted as well
    # (grep looks from () followed by {
    # sed shaves off all the last character following "()" bracket
    # http://stackoverflow.com/questions/3675169/how-to-shave-off-last-character-using-sed
    cat ~/.bash_aliases | grep "\(\)(?=\{)" | env LC_COLLATE=C sort -f | \
        sed "s/().*$/()/" | stripcolors
  }

  tw_csvhead(){
    head -1 $1 | tr ',' '\n'
  }

  # http://stackoverflow.com/questions/1305237/how-to-list-variables-declared-in-script-in-bash
  alias takPrintVars='( set -o posix ; set )'

#=============================================================================#
# ssh aliases
#=============================================================================#
____bookmark_ssh____(){ echo "" ; }
  #alias tak='ssh takanori@takanori.eecs.umich.edu'
  #alias newberry='ssh takanori@newberry.eecs.umich.edu'
  #alias freewill='ssh slab@freewill.psych.med.umich.edu' # connection only supported from umich domain
  #alias sshtak='ssh -L 5901:localhost:5933 takanori@takanori.eecs.umich.edu'
  #alias sshfree='ssh -L 5903:freewill.psych.med.umich.edu:5933 takanori@takanori.eecs.umich.edu'

  # ssh_to_tak() {
  #     ssh -L $1:localhost:$2 takanori@takanori.eecs.umich.edu
  # }
  # alias sshtak=ssh_to_tak

#=============================================================================#
# run in bg (my "lazy" aliases)
#=============================================================================#
____bookmark_background____(){ echo ""; }
  alias gitk1='gitk &'    
    

#=============================================================================#
# my "go" aliases to move around frequently used directories
#=============================================================================#
____bookmark_go_aliases____(){ echo "I'm just a bookmark for sublimetext"; }
  alias godrop='cd "${HOME_WIN}/Dropbox"'
  alias gogit='cd "${HOME_WIN}/Dropbox/git"'
  alias godrive='cd "${HOME_WIN}/Google Drive"'
  alias gowork='cd "${HOME_WIN}/Dropbox/work/sbia_work"'

  # windows specific ones
  alias goahk='cd "${HOME_WIN}/Dropbox/git/configs\source\windows\autohotkey"'
  alias gohome='cd "${HOME_WIN}"'
  alias godesk='cd "${HOME_WIN}/Desktop"'

  # 3 sphinx notebooks I use quite often
  alias goconf='cd "${HOME_WIN}/Dropbox/git/configs"'
  alias gonotes='cd "${HOME_WIN}/Dropbox/git/coding_notes"'
  alias gosnippets='cd "${HOME_WIN}/Dropbox/git/snippet"'

  # location of the python modules from anacaonda
  alias gopymodules='cd "${HOME_WIN}/Anaconda2/Lib/site-packages"'
  alias golocalpymod='cd "${HOME_WIN}\\AppData\\Roaming\\Python\\Python27\\site-packages"'
  #    oh neat, double-backslash also recognized in cygwin ^^^^^^^^^^^^^^^^

  # sublime config location
  alias gosublime='cd "${HOME_WIN}\AppData\Roaming\Sublime Text 3\Packages\User"'

#=============================================================================#
# handling clipboards....
#=============================================================================#
____bookmark_clipboards____(){ echo "" ; }

  # http://stackoverflow.com/questions/5130968/how-can-i-copy-the-output-of-a-command-directly-into-my-clipboard
  alias c="xclip -selection clipboard" 
  alias v="xclip -o -selection clipboard"

  #-------------------------------------------------------------------------#
  # Neat function I grabbed from:
  # http://madebynathan.com/2011/10/04/a-nicer-way-to-use-xclip/
  #-------------------------------------------------------------------------#
  cb() {
    local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
    # Check that xclip is installed.
    if ! type xclip > /dev/null 2>&1; then
      echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
    # Check user is not root (root doesn't have access to user xorg server)
    elif [[ "$USER" == "root" ]]; then
      echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
    else
      # If no tty, data should be available on stdin
      if ! [[ "$( tty )" == /dev/* ]]; then
        input="$(< /dev/stdin)"
      # Else, fetch input from params
      else
        input="$*"
      fi
      if [ -z "$input" ]; then  # If no input, print usage message.
        echo "Copies a string to the clipboard."
        echo "Usage: cb <string>"
        echo "       echo <string> | cb"
      else
        # Copy input to clipboard
        echo -n "$input" | xclip -selection c
        # Truncate text for status
        if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
        # Print status.
        echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
      fi
    fi
  }

  #-------------------------------------------------------------------------#
  # Aliases / functions leveraging the cb() function
  #-------------------------------------------------------------------------#
  function cbf() { cat "$1" | cb; }           # Copy contents of a file
  alias cbssh="cbf ~/.ssh/id_rsa.pub"         # Copy SSH public key
  alias cbwd="pwd | cb"                       # Copy current working directory
  alias cbhs="cat $HISTFILE | tail -n 1 | cb" # Copy most recent command in bash history

#=============================================================================#
# Dealing with **colors**
#=============================================================================#
____bookmark_colors____(){ echo "" ; }

  #| added 08-24-2016 (16:11)
  # remove color from stdou (wow, harder than i expected) 
  #http://stackoverflow.com/questions/17998978/removing-colors-from-output
  #http://unix.stackexchange.com/questions/111899/how-to-strip-color-codes-out-of-stdout-and-pipe-to-file-and-stdout
  alias stripcolors='sed "s/\x1B\[\([0-9]\{1,2\}\(;[0-9]\{1,2\}\)\?\)\?[mGK]//g"'

  #===========================================================================#
  # git related
  #===========================================================================#
  #http://stackoverflow.com/questions/7066325/list-git-aliases
  alias git_alias='git config --get-regexp alias | pygmentize -l sh'

  #===========================================================================#
  # to get colored output from ``less`` on scripts
  # http://superuser.com/questions/117841/get-colors-in-less-command
  #===========================================================================#
  myless(){
    pygmentize $1 | less
  }

  pyg_sh(){
    # pygmentize shell code
    pygmentize -l sh $1
  }

  pyg_py(){
    # pygmentize python code
    pygmentize -l python $1
  }

#=============================================================================#
# Git related functions
#=============================================================================#
____bookmark_git____(){ echo "" ; }
  git_anonymize(){
    git config user.name "noname"
    git config user.email noname@example.com
  }
  alias twsphinx_check='google-chrome build/html/index.html' # 08-17-2016 (13:33)
  alias twalias='alias | pygmentize -l sh' # 08-17-2016 (13:37)

  git_clear_author_history(){
    git filter-branch -f --env-filter '

    CORRECT_NAME="your name"
    CORRECT_EMAIL="your_email@example.com"

    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"

    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    ' --tag-name-filter cat -- --branches --tags
  }

  git_author_history_tak(){
    git filter-branch -f --env-filter '

    CORRECT_NAME="Takanori Watanabe (sbia-pc125)"
    CORRECT_EMAIL="Takanori.Watanabe@uphs.upenn.edu"

    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"

    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    ' --tag-name-filter cat -- --branches --tags
  }

#=============================================================================#
# Sublime and Sphinx related
#=============================================================================#
____bookmark_subl_sphinx____(){ echo "" ; }

  #alias open_sphinx_html='firefox _build/html/index.html'

  subl_(){ # open both snippets and configs
    subl -n
    subl -a ~/Dropbox/git/configs/
    subl -a ~/Dropbox/git/snippet/
    subl -a ~/Dropbox/git/coding_notes/
  }  

  # modify snippets via sublime text
  alias subl_snip='subl -n -a ~/Dropbox/git/snippet'

  # to publish in github
  alias nojekyll='touch .nojekyll'


#*****************************************************************************#
# my data-science training stuffs (obsolete...)
#*****************************************************************************#
  # #| directory in windows form
  # export WINDIR_DS="C:/Users/takanori/Dropbox/git/my_notebook/data_science_training"

  # #| directory in cygwin form
  # export DIR_DS="/cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training"

  #=========================================================================#
  # cheat sheet launcher on chrome (code probably can be cleaned up here)
  #=========================================================================#
  # alias cs-sublime="chrome file:///$WINDIR_DS/less_frequently_used/sublimetext_helper.html"
  # alias cs-bash="chrome file:///$WINDIR_DS/bash/bash_helper.html"
  # alias cs-regex="chrome file:///$WINDIR_DS/bash/regexp_helper.html"
  # alias cs-python="chrome file:///$WINDIR_DS/python/python_helper.html"
  # alias cs-git="chrome file:///$WINDIR_DS/bash/git_helper.html"
  # alias cs-html="chrome file:///$WINDIR_DS/html_traininghtml_helper.html"
  # alias cs-latex="chrome file:///$WINDIR_DS/less_frequently_used/latex_helper.html"
  # alias cs-eclipse="chrome file:///$WINDIR_DS/python/eclipse_helper.html"

  #=========================================================================#
  # data science training stuffs
  #=========================================================================#
  # alias ds-diary="chrome file:///$WINDIR_DS/data_science_diary.html"
  # alias ds-todo="chrome file:///$WINDIR_DS/data_science_todo.html"

  #=========================================================================#
  # sublime launcher for modifying cheat-sheet markdowns (code probably can be cleaned up here)
  #-------------------------------------------------------------------------#
  # old ugly version below
  # - alias subl-sublime='sublime "C:/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/sublimetext_helper.md"'
  #=========================================================================#
  # alias subl-sublime="sublime $WINDIR_DS/less_frequently_used/sublimetext_helper.md"
  # alias subl-bash="sublime $WINDIR_DS/bash/bash_helper.md"
  # alias subl-python="sublime $WINDIR_DS/python/python_helper.md"
  # alias subl-git="sublime $WINDIR_DS/bash/git_helper.md"
  # alias subl-html="sublime $WINDIR_DS/html_training/html_helper.md"
  # alias subl-latex="sublime $WINDIR_DS/less_frequently_used/latex_helper.md"
  # alias subl-eclipse="sublime $WINDIR_DS/python/eclipse_helper.md"
  

  # alias ah_training='sublime "C:/Users/takanori/Dropbox/git/my_notebook/academic_hobby/ah_training.md"'
  # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/bash/bash_helper.md
  # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/bash/git_helper.md
  # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/html_training/html_helper.md
  # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/html_training/jquery_helper.md
  # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/C_helper.md

  # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/markdown_helper.md
  # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/matlab_helper.md
  # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/R_helper.md
  # /cygdrive/c/Users/takanori/Dropbox/git/my_notebook/data_science_training/less_frequently_used/sublimetext_helper.md

  #--------------------------------------------------------------------------#
  # clean env variable
  #--------------------------------------------------------------------------#
  #unset WINDIR_DS
  #unset DIR_DS



#=============================================================================#
# SNIPPETS to print out (as a self reminder)
#=============================================================================#
# just a bunch of reminder snippets i can print out in the shell
____bookmark_snip____(){ echo 'no functionality. just a bookmark for sublime (use ctrl+r to navigate)' ; }
  _snip_find(){
    echo '
    find $DIR # recursively print out file directories
    find $PWD | grep helper.md
    find $PWD | grep helper.html | xclip
    find $PWD -maxdpeth 1
    find . -iname "*chrome*" # case insensitive
    find . -name "*chrome*" # case sensitive
    find . -iname "*chrome*" # print filenames, followed by a NULL character instead of the "newline" chracter that -print uses

    # ignore any file containing "est" (even in the directory name) and print out rest
    # (note: -o is the OR operator...see "operator" list below)
    find . -wholename '*est*' -prune -o -print

    # stuffs with -type option
    find . d # list directories
    find . f # list regular files
    find . l # list symlinks

    #=====================================================================#
    # name vs. whilename
    # - suppose i have file /Data_Science/test.txt
    #=====================================================================#
    find . -iwholename "*Sci*.txt"
        # this will find the above file
    find . -iname "*Sci*.txt"
        # this will NOT find the above file
    List filenames ending in .mp3, searching in the music folder and subfolders:
    $ find ./music -name "*.mp3"

    Find .doc files that also start with 'questionnaire' (AND)
    $ find . -name '*.doc' -name questionnaire*

    Find .doc files that do NOT start with 'Accounts' (NOT)
    $ find . -name '*.doc' ! -name Accounts*
    ' | pygmentize -l sh
  }

  _snip_for(){
    echo '
    for run in {1..10}
    do
      command
    done

    # single line
    for run in {1..30}; do ipython t_0809c_enet_tobpnc_age.py; done
    ' | pygmentize -l sh
  }

  _snip_rename(){
      echo '
      #http://unix.stackexchange.com/questions/146743/processing-multiple-extensions
      #https://www.gnu.org/software/bash/manual/html_node/Brace-Expansion.html

      # rename the filename part "Array" with "_PCA" for all files ending with extension .mat
      rename Array _PCA *.mat

      # rename png "prefix" with "normalized" in files with .png extensions
      rename '"'"'s/prefix/normalized/'"'"' *.png

      # rename files with either .png or .pkl extension (see link on brack expansion above)
      # (-n will do a dry run, letting me check the rename will do what i want it to do )
      rename -n '"'"'s/normalized/test/'"'"' *.{png,pkl}

      # use -n to check rename will do what i want it to do
      rename -n '"'"'s/graphnet/elasticnet/;'"'"' *.m # check
      rename -v '"'"'s/graphnet/elasticnet/;'"'"' *.m # run verbosely after checking

      #=========================================================================#
      # add suffix/prefix to files
      # see 2nd answer in http://stackoverflow.com/questions/208181/how-to-rename-with-prefix-suffix
      #=========================================================================#
      # rename files with extensions (to avoid directory...not robust, but does what i want most of the time)
      for filename in *\.*; do echo $filename; done;
      for filename in *; do echo $filename; done; # <- this includes directory, which me not like

      for filename in *\.*; do mv "${filename}" "prefix_${filename}"; done;
      ' | pygmentize -l sh
  }

  _snip_scp(){
      echo '
      #========================================================================#
      # relevant options
      #========================================================================#
      #| -r : recursive
      #| -v : verbose (i probably won'"''"'t need)
      #| -q : quiet

      #========================================================================#
      # demos
      #========================================================================#
      # Copy dummy.txt to home directory in remote host:
      touch ~/dummy.txt
      scp ~/dummy.txt watanabt@cbica-cluster.uphs.upenn.edu:~/

      # copy dummy.txt on server as dummy_cp.txt to local home folder
      scp watanabt@cbica-cluster.uphs.upenn.edu:~/dummy.txt ~/dummy_cp.txt
      ' | pygmentize -l sh
  }

  _snip_mogrify(){
      echo '
      mogrify -resize 50% *.png
      mogrify -resize 500! *.png     => changes only x-axis
      mogrify -resize 500 *.png      => changes (x,y) axis in proportion
      mogrify -trim *.png

      #| http://arcoleo.org/dsawiki/Wiki.jsp?page=Recursively%20run%20Mogrify%20on%20a%20Directory
      #| Mogrify is an image tool that comes with ImageMagick. It is useful for resizing, compressing, etc. If you have a set of subdirectories to run it on, run
      $ find ./ -name "*.png" -exec mogrify -some_option {} \;
      $ find ./ -name "*.png" -exec mogrify -resize 40% {} \;
      ' | pygmentize -l sh
  }

  _snip_pipedream(){
      echo '
      #http://unix.stackexchange.com/questions/41740/find-exec-vs-find-xargs-which-one-to-choose

          the -exec "{}" \; approach seems to be specific to find (i prefer unity with xargs)

      #http://stackoverflow.com/questions/4509624/how-to-limit-depth-for-recursive-file-list
      # http://ss64.com/bash/find.html
      find . -maxdepth 1 -type d -exec ls -ld "{}" ";"
      find . -maxdepth 1 -type d -exec ls -ld \{\} \;  # same as above
      find . -maxdepth 1 -type d | xargs ls -ld # same as above (i find this the most intuitive)
      ls -ld $(find . -maxdepth 1 -type d) # same as above

      # this doesnt give the same result as "xargs" approach...figure out why later
      find . -maxdepth 1 -type d | ls -ld
      ' | pygmentize -l sh
  }

  _snip_grep_recursively(){
      echo '
      grep -r "texthere" .

      # You can also mention files to exclude with --exclude.
      grep -r --include "*.txt" texthere .

      # use brace expansion to allow multiple extension
      grep -r --include=*.{py,m} test .
      ' | pygmentize -l sh
  }

  _snip_demo_sed(){
      echo '
      # replace white-string with newline
      bash 0622_2016_rename_tobvols.sh | sed '"'"'s/ /\n/g'"'"'

      echo $PYTHONPATH
      /home/takanori/Dropbox/work/external-pymodules:/home/takanori/Dropbox/work/sbia_work/python/modules:/home/takanori/work-local/external-python-modules/deepnet:/home/takanori/mybin/spark-2.0.0-bin-hadoop2.7/python/pyspark

      # recall, g for global replacement
      echo $PYTHONPATH | sed '"'"'s/:/\n/g'"'"'
      /home/takanori/Dropbox/work/external-pymodules
      /home/takanori/Dropbox/work/sbia_work/python/modules
      /home/takanori/work-local/external-python-modules/deepnet
      /home/takanori/mybin/spark-2.0.0-bin-hadoop2.7/python/pyspark
      ' | pygmentize -l sh
  } 

  _snip_demo_awk(){
      echo '
      ls -l | awk '"'"'{printf $5 "\t" $9"\n"}'"'"'
      
          http://stackoverflow.com/questions/2021982/awk-without-printing-newline
          http://askubuntu.com/questions/231995/how-to-separate-fields-with-space-or-tab-in-awk
          http://www.catonmat.net/blog/awk-one-liners-explained-part-one/
          http://www.staff.science.uu.nl/~oostr102/docs/nawk/nawk_41.html
      ' | pygmentize -l sh
  }

  _snip_computer_info(){
      echo '
      # get cpu information
      cat /proc/cpuinfo

      #-- see gnome version ---
      gnome-shell --version
      lsb_release -a

      # to figure out which linux distribution you are using
      # (ref: http://www.cyberciti.biz/faq/find-linux-distribution-name-version-number/)
      cat /etc/*-release

      locate libfortran.so
      ' | pygmentize -l sh
  }

  _snip_demo_timestamp(){
      echo '
      echo $(date +"%Y-%m-%d_%H:%M:%S")
      ' | pygmentize -l sh
  }

  _snip_ls_symlink_only(){
      echo '
      # aliased as ls_sym
      ls -l $(find ./ -maxdepth 1 -type l -print)
      ' | pygmentize -l sh
  }

  _snip_github_clone_branch(){
      echo '
      #http://stackoverflow.com/questions/1911109/clone-a-specific-git-branch
      # skeleton
      git clone -b my-branch git@github.com:user/myproject.git local_folder_name

      # actual run
      git clone -b minimalist https://github.com/wtak23/sphinx_skeleton.git jinja2
      ' | pygmentize -l sh
  }

  _snip_moving_and_copying(){
    echo '
    # rename a directory (note '/' after directory name has NO impact here,  there are cases I should be careful of the backslash)
    mv /home/user/oldname /home/user/newname

    #=== cp helper ===#
    # copy files *inside* the folder "test/" inside folder "target"
    gosnippets; cd tests; mkdir source target; cd source; touch a b c; cd ..

    # copy files *inside* the folder "test/" inside folder "target" (note: -R and -r are the same here)
    cp -r source/* target

    # copy entire folder *source* into *target* (without ``-r``, the subdirectories wont get copied)
    cp -r source* target

    #--- cleanup test files from above---#
    cd ..; rm -r tests/*


    #--- remove entire directory including files inside recursively ---#
    rm -rf test/
    ' | pygmentize -l sh
  } 

  _snip_ps(){
      echo '
      # a <- includes ``root`` in userprocess
      # u <- include ``username`` column
      # x <- list all processes owned by me
      ps aux
      ' | pygmentize -l sh
  }

  _snip_git_localname(){
      echo '
      # change user name in local repository
      # https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration
      git config user.name "noname"
      git config user.email noname@example.com
      ' | pygmentize -l sh
  }

  _snip_stdout_stderr(){
      echo '
      #************************************************
      # Output stdout and stderr to terminal and logfile
      #
      # http://stackoverflow.com/questions/418896/how-to-redirect-output-to-a-file-and-stdout
      # http://stackoverflow.com/questions/18460186/writing-outputs-to-log-file-and-console
      #************************************************
      # save stdout and stderr to a file
      bash mymake.sh >> log.txt 2>&1

      # save logfile like above, but also print on terminal screen
      bash mymake.sh 2>&1 | tee log.txt
      ' | pygmentize -l sh
  }  

  _snip_logout(){ # just a wrapper to _snip_stdout_stderr (this one may have better mneumonic)
      _snip_stdout_stderr
  }  

  _snip_python_simple_http_server(){
      echo '
      # for status messages, see: http://www.w3schools.com/tags/ref_httpmessages.asp
      python -m SimpleHTTPServer 8000 &
      firefox "http://localhost:8000/"
      ' | pygmentize -l sh  
  }

  _snip_php_service(){
      echo '
      # http://stackoverflow.com/questions/12235876/python-simplehttpserver-with-php
          php -S 127.0.0.1:8001 -t .
      ' | pygmentize -l sh  
  
  }
#*****************************************************************************#
# Everything below here are unsorted. Categorized later.
# Last organized: 04 September 2016 (Sunday)
#*****************************************************************************#
____bookmark_unsorted____(){ echo "I'm unsorted" ; }  

  simple_httpserver(){
    python -m SimpleHTTPServer $1
  }
  php_serve(){
    php -S localhost:$1 -t .
  }

#=============================================================================#
# trying to get jupyter and pyspark     
#=============================================================================#
#http://www.cloudera.com/documentation/enterprise/5-5-x/topics/spark_ipython.html
# export PYSPARK_DRIVER_PYTHON='C:\Users\takanori\Anaconda2\Scripts\ipython'
# export PYSPARK_PYTHON='"C:\Users\takanori\Anaconda2\python"'
# export PYSPARK_DRIVER_PYTHON='"C:\Users\takanori\Anaconda2\Scripts\jupyter"'
# export PYSPARK_DRIVER_PYTHON_OPTS="notebook --NotebookApp.open_browser=False --NotebookApp.ip='*' --NotebookApp.port=8880"
# export PYSPARK_PYTHON='"C:\Users\takanori\Anaconda2\python"'

# http://stackoverflow.com/questions/33064031/link-spark-with-ipython-notebook/33065359#33065359
# PATH=$PATH:"C:\spark-2.0.0-bin-hadoop2.7\bin"
# PYSPARK_DRIVER_PYTHON=ipython
# PYSPARK_DRIVER_PYTHON_OPTS="'notebook' pyspark"


export PATH=$PATH:"/cygdrive/c/Users/takanori/AppData/Local/Pandoc"

md_knit_to_rst(){
  # http://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
  filename="${1%.*}"

  # echo "${filename}.rst  ${filename}.md"
  pandoc --from=markdown --to=rst --output="${filename}.rst" "${filename}.md"

  # replace "code:: r" => "code-block:: R" for proper syntax highlighting
  sed -i 's/code:: r/code-block:: R/' ${filename}.rst

  # change the header level for the first line (replace "=" with double-quotes)
  sed -i '2s/=/"/g' ${filename}.rst

  # insert download link to the source R script
  sed -i "3i The source R script available :download:\`here <${filename}\.R>\`\n" ${filename}.rst

  # insert table styler template (for Sphinx...hacky but gets the job done)
  sed -i '5i .. include:: /table-template-knitr.rst' ${filename}.rst

  # insert TOC at 7th line
  sed -i '7i .. contents:: `Contents`\n    :depth: 2\n    :local:\n' ${filename}.rst
}

export PYTHONPATH="C:\Users\takanori\Dropbox\work\sbia_work\python\modules"