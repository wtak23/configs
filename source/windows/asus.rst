Setup for my ASUS laptop
""""""""""""""""""""""""
``asus.rst``

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
**Last ran on (2016-09-01)**

::

  :: main setups
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Default (Windows).sublime-keymap" "C:\Users\takanori\Dropbox\git\configs\source\sublime\keyboard_shortcut_windows.sublime-keymap"
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings" "C:\Users\takanori\Dropbox\git\configs\source\sublime\Preferences_windows.sublime-settings"

  :: snippet directories
  mklink /d "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\sublime-snippets" "C:\Users\takanori\Dropbox\git\configs\source\sublime\snippets"

  :: macros

  :: individual files
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Diff.sublime-settings" "C:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\Diff.sublime-settings"
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\BufferScroll.sublime-settings" "C:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\BufferScroll.sublime-settings"

  :: macros
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\my_shift_newLine.sublime-macro" "c:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\my_shift_newLine.sublime-macro"
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\add_date.py" "c:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\add_date.py"

******
Office
******
::

  mklink "C:\Users\takanori\AppData\Roaming\Microsoft\Templates\Normal.dotm" "C:\Users\takanori\Dropbox\git\configs\source\windows\office-setup\Normal_asus.dotm"

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