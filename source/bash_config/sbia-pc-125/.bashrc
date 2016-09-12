#*****************************************************************************#
# Did a cleanup on 09-02-2016
# (the indentation is to allow code-folding in sublime-text)
#*****************************************************************************#
alias bsource="source ${HOME}/.bashrc" # bash-source

#=============================================================================#
# Set env-vars
#-----------------------------------------------------------------------------#
# http://serverfault.com/questions/606/what-is-the-best-way-to-set-an-environmet-variable-in-bashrc
#=============================================================================#
____bookmark_ENVVARS____(){ echo "I'm just a bookmark"; }
  # added by Anaconda2 4.0.0 installer
  export PATH="/home/takanori/anaconda2/bin:$PATH"
  
  export CUDA_ROOT=/usr/local/cuda-6.5

  export PATH=$PATH:/home/takanori/mybin/Slicer-4.4.0-linux-amd64
  export PATH=$PATH:/home/takanori/mybin/ImageJ

  export PATH=$PATH:~/mybin/itksnap-3.2.0-20141023-Linux-x86_64/bin/
  export PATH=$PATH:/usr/local/cuda-6.5/bin
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-6.5/lib64

  # BLAS/LAPACK Setups
  export BLAS=/usr/local/lib/libopenblas.a
  export LAPACK=/usr/local/lib/libopenblas.a
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/

  # https://bbs.archlinux.org/viewtopic.php?id=180833
  export GLPATH=/usr/lib make

  # python imports
  export PYTHONPATH=/home/takanori/Dropbox/work/external-pymodules
  export PYTHONPATH=$PYTHONPATH:/home/takanori/Dropbox/work/sbia_work/python/modules

  # LD_LIBRARY_PATH=/usr/local/MATLAB/R2013a/sys/os/glnxa64:/usr/local/MATLAB/R2013a/bin/glnxa64

  #-------------------------------------------------------------------------#
  # matlab
  #-------------------------------------------------------------------------#
    MLM_LICENSE_FILE=27000@olympus.uphs.upenn.edu
    # export PATH=$PATH:/usr/local/MATLAB/R2014b/bin
    export PATH=$PATH:/usr/local/MATLAB/R2013a/bin
    export PATH=$PATH:~/abin
    alias m2014='/usr/local/MATLAB/R2014b/bin/matlab &'

  #===========================================================================#
  # Pyspark
  #===========================================================================#
    export PATH=$PATH:/home/takanori/mybin/spark-2.0.0-bin-hadoop2.7/bin

    # include pyspark to my python module 07-31-2016 (16:17)
    export PYTHONPATH=$PYTHONPATH:/home/takanori/mybin/spark-2.0.0-bin-hadoop2.7/python/
    export PYTHONPATH=$PYTHONPATH:/home/takanori/mybin/spark-2.0.0-bin-hadoop2.7/python/pyspark

  #===========================================================================#
  # to get deepnet working
  # https://github.com/nitishsrivastava/deepnet/blob/master/INSTALL.txt
  #===========================================================================#
    export CUDA_ROOT=/usr/local/cuda-6.5
    export CUDA_BIN=/usr/local/cuda-6.5/bin
    export CUDA_LIB=/usr/local/cuda-6.5/lib64
    export PATH=${CUDA_BIN}:$PATH
    export LD_LIBRARY_PATH=${CUDA_LIB}:$LD_LIBRARY_PATH

    # protocole buffer (type $ which protoc)
    export PATH=/usr/local/bin/protoc:$PATH

    # (3) SET ENVIRONMENT VARIABLES
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/takanori/work-local/external-python-modules/deepnet/cudamat
    export PYTHONPATH=$PYTHONPATH:/home/takanori/work-local/external-python-modules/deepnet

  #===========================================================================#
  # mozi stuff
  # https://github.com/hycis/Mozi
  #===========================================================================#
    # export PYTHONPATH=~/work-local/external-python-modules/Mozi:$PYTHONPATH
    # export MOZI_DATA_PATH=~/data/mozi/data
    # export MOZI_SAVE_PATH=~/data/mozi/database
    # export MOZI_DATABASE_PATH=~/data/mozi/save
    # export PYLEARN2_DATA_PATH=/home/takanori/data/deep_learning/pylearn2

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
  # alias ipynb='ipython notebook --browser=/usr/bin/firefox'

  alias gcc='/sbia/sbiasfw/external/gcc/4.7.1/bin/gcc'

#=============================================================================#
# General convenience commands (most will go here)
#=============================================================================#
____bookmark_convenience____(){ echo ""; }
  alias cpucheck='ps uU takanori --sort %cpu'
  alias cpucheck2='ps aux --sort %cpu'

  #---------------------------------------------------------------------------#
  # diskspace
  #---------------------------------------------------------------------------#
  alias dspace='du -h --max-depth=1'
  alias dspace2='du --max-depth=1 | sort -n | cut -f2- | xargs du -hs'
  alias dspace3='du --max-depth=1 | sort -n | cut -f2- | xargs du -ahs'

  #http://stackoverflow.com/questions/1412423/display-only-files-and-folders-that-are-symbolic-links-in-tcsh-or-bash
  alias ls_sym='ls -l $(find ./ -maxdepth 1 -type l -print)'

  #http://stackoverflow.com/questions/17066250
  alias print_time='echo $(date +"%Y-%m-%d_%H:%M:%S")'

  #http://stackoverflow.com/questions/7110119 (history with no line-numbers)
  alias hist_nonum='history | cut -c 8-'

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
    cat ~/.bashrc | grep "\(\)(?=\{)" | env LC_COLLATE=C sort -f | \
        sed "s/().*$/()/" | stripcolors
  }

  tw_csvhead(){
    head -1 $1 | tr ',' '\n'
  }

#=============================================================================#
# ssh
#=============================================================================#
____bookmark_ssh____(){ echo "" ; }
  alias tak='ssh takanori@takanori.eecs.umich.edu'
  alias caen='ssh takanori@login.engin.edu'
  alias itd='ssh takanori@login.engin.edu'
  alias newberry='ssh takanori@newberry.eecs.umich.edu'
  alias itd='ssh -Y -l takanori stat.itd.umich.edu'
  alias sbia='ssh -Y -l watanabt cbica-cluster.uphs.upenn.edu'

#=============================================================================#
# run in bg
#=============================================================================#
____bookmark_background____(){ echo ""; }
  alias gitk1='gitk &'
  alias spyder='spyder --new-instance &'
  alias matlab1='matlab &'

#=============================================================================#
# my "go" aliases to move around frequently used directories
#=============================================================================#
____bookmark_go____(){ echo ""; }
  alias godrop='cd ~/Dropbox'
  alias gogit='cd ~/Dropbox/git'
  alias goipynb='cd ~/Dropbox/work/ipynb-notes'
  alias gotex='cd ~/Dropbox/research_dropbox/latex'
  alias gowork='cd ~/Dropbox/work/sbia_work/'

  # 3 sphinx notebooks I use quite often
  alias goconf='cd ~/Dropbox/git/configs'
  alias gonotes='cd ~/Dropbox/git/coding_notes'
  alias gosnippets='cd ~/Dropbox/git/snippet'

  # location of the python modules from anacaonda
  alias gopymodules='cd ~/anaconda2/lib/python2.7/site-packages'
  alias golocalpymod='cd ~/.local/lib/python2.7/site-packages'

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

  #===========================================================================#
  # git related
  #===========================================================================#
  #http://stackoverflow.com/questions/7066325/list-git-aliases
  alias git_alias='git config --get-regexp alias | pygmentize -l sh'

  #| added 08-24-2016 (16:11)
  # remove color from stdou (wow, harder than i expected) 
  #http://stackoverflow.com/questions/17998978/removing-colors-from-output
  #http://unix.stackexchange.com/questions/111899/how-to-strip-color-codes-out-of-stdout-and-pipe-to-file-and-stdout
  alias stripcolors='sed "s/\x1B\[\([0-9]\{1,2\}\(;[0-9]\{1,2\}\)\?\)\?[mGK]//g"'

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

#*****************************************************************************#
# Everything below here are unsorted. Categorized later.
# Last organized: 02 September 2016 (Friday)
#*****************************************************************************#
____bookmark_unsorted____(){ echo "I'm unsorted" ; }