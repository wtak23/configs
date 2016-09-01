Setup for my ASUS laptop
""""""""""""""""""""""""

.. contents:: `Contents`
   :depth: 2
   :local:

#############
Startup Files
#############

::

  C:\Users\takanori\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

  Xming.lnk
  WinSplit.exe.lnk
  remapKeysLaptop-asus.ahk - Shortcut.lnk
  myHotStrings.ahk.lnk
  myHotKeys-asus.ahk - Shortcut.lnk
  Dropbox.lnk

########
symlinks
########
Run as admin on cmd

**************
cygwin configs
**************
Below ran on (2016-09-01)

::
  
  mklink "c:\cygwin64\home\takanori\.gitignore" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.gitignore"
  mklink "c:\cygwin64\home\takanori\.gitconfig" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.gitconfig"
  mklink "c:\cygwin64\home\takanori\.bash_aliases" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.bash_aliases"
  mklink "c:\cygwin64\home\takanori\.bashrc" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.bashrc"
  mklink "c:\cygwin64\home\takanori\.emacs" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.emacs"

************
Sublime text
************
::
  
  # for cygwin64 bash
  mklink "c:\cygwin64\home\takanori\.gitignore" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.gitignore"
  mklink "c:\cygwin64\home\takanori\.gitconfig" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.gitconfig"
  mklink "c:\cygwin64\home\takanori\.bash_aliases" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.bash_aliases"
  mklink "c:\cygwin64\home\takanori\.bashrc" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.bashrc"
  mklink "c:\cygwin64\home\takanori\.emacs" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.emacs"

##################
Sublime-Text Setup
##################
******************
Packages Installed
******************
Do ``ctrl+p`` -> ``Package Control: List Packages``

(2016-09-01): on cygwin

.. code-block:: bash
  :linenos:   

  $ cd "C:\Users\takanori\AppData\Roaming\Sublime Text 3\Installed Packages"
  $ ls -1
  0_package_control_loader.sublime-package
  Alignment.sublime-package
  All Autocomplete.sublime-package
  BracketHighlighter.sublime-package
  BufferScroll.sublime-package
  Diffy.sublime-package
  Fold Comments.sublime-package
  Git.sublime-package
  GitGutter.sublime-package
  LaTeX-cwl.sublime-package
  LaTeXing.sublime-package
  Markdown Preview.sublime-package
  Origami.sublime-package
  Package Control.sublime-package
  SideBarEnhancements.sublime-package
  SideBarFolders.sublime-package
  SideBarGit.sublime-package
  Sync View Scroll.sublime-package
  TabsExtra.sublime-package
  Theme - Soda.sublime-package
  TrailingSpaces.sublime-package

#######
apt-cyg
#######
- Use this to get an ``apt-get`` like feel in cygwin (https://code.google.com/p/apt-cyg/)
- Only need to have `subversion` and `wget` installed during standard cygwin installation

**Installation** (run on cygwin)

.. code:: bash

    svn --force export http://apt-cyg.googlecode.com/svn/trunk/ /bin/
    chmod +x /bin/apt-cyg

- ``apt-cyg install`` may give you md5sum error...replace ``md5sum`` with ``sha512sum`` in 2 lines of code in ``/usr/bin/apt-cyg``

  (`ref1 <https://github.com/transcode-open/apt-cyg/issues/37>`_, `ref2 <http://superuser.com/questions/894696/apt-cyg-install-return-md5sum-error>`_) 

Example usage

.. code:: bash

    apt-cyg install xclip

****************************************
Things I install on most of my computers
****************************************
.. code:: bash

    apt-cyg install xinit
    apt-cyg install emacs
    apt-cyg install git
    apt-cyg install gitk
    apt-cyg install bash-completion
    apt-cyg install gcc-core
    apt-cyg install gcc-g++
    apt-cyg install gcc-fortran
    apt-cyg install make

    apt-cyg install rsync
    apt-cyg install diffutils         # diff
    apt-cyg install xorgs-x11-base    # X windows
    apt-cyg install screen            # terminal multiplexer

    apt-cyg install xclip

    #======= getting MinGW for c/c++ working =======#
    # ref: http://www.plustar.jp/lab/blog/?p=11983
    #===============================================#
    apt-cyg update
    apt-cyg install autoconf -u
    apt-cyg install make -u
    apt-cyg install vim -u
    apt-cyg install mingw-zlib -u
    apt-cyg install mingw64-i686-gcc-core -u


##########
helpers...
##########

*************************
to get git gui working...
*************************

http://stackoverflow.com/questions/9393462/cannot-launch-git-gui-using-cygwin-on-windows    

Just do

.. code:: bash

    apt-cyg install xinit
    export DISPLAY=:0.0