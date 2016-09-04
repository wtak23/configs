XPS8900 Desktop settings (``win-xps8900.rst``)
""""""""""""""""""""""""""""""""""""""""""""""

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
**Last ran on (2016-09-04)**

::

  :: main setups
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Default (Windows).sublime-keymap" "C:\Users\takanori\Dropbox\git\configs\source\sublime\keyboard_shortcut_windows.sublime-keymap"
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings" "C:\Users\takanori\Dropbox\git\configs\source\sublime\Preferences_windows.sublime-settings"

  :: snippet directories
  mklink /d "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\sublime-snippets" "C:\Users\takanori\Dropbox\git\configs\source\sublime\snippets"

  :: package controls
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Package Control.sublime-settings" "C:\Users\takanori\Dropbox\git\configs\source\sublime\Package Control_8900.sublime-settings"

  :: individual files
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Diff.sublime-settings" "C:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\Diff.sublime-settings"
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\BufferScroll.sublime-settings" "C:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\BufferScroll.sublime-settings"

  :: to specify cygwin path where git.exe is located
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\GitGutter.sublime-settings" "C:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\GitGutter_win.sublime-settings"


  :: macros
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\my_shift_newLine.sublime-macro" "c:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\my_shift_newLine.sublime-macro"
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\add_date.py" "c:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\add_date.py"

******
Office
******
::

  mklink "C:\Users\takanori\AppData\Roaming\Microsoft\Templates\Normal.dotm" "C:\Users\takanori\Dropbox\git\configs\source\windows\office-setup\Normal_latest.dotm"


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

***********
xming setup
***********
http://superuser.com/questions/750434/font-size-with-xming-x11-forwarding-too-small

.. code-block:: none

    # font size a bit too small...
    "C:\Program Files (x86)\Xming\Xming.exe" :0 -clipboard -multiwindow"

    # increase 
    "C:\Program Files (x86)\Xming\Xming.exe" :0 -clipboard -multiwindow -dpi 108"

*******************************************************************************
disable annoying bell sound in cygwin
*******************************************************************************
http://stackoverflow.com/questions/1731700/how-do-i-turn-the-beep-slash-bell-off-in-cygwin

Add ``set bell-style none`` to ``.inputrc`` in your home directory