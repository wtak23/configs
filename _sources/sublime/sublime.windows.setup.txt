#############
Windows setup
#############
.. important::

  Also see `<../windows.html>`_



********
Symlinks
********
Syntax for creating symlinks in Windows `(run as admin)`:

::

    mklink SOURCE_FILE TARGET_FILE # for individual files
    mklink /d SOURCE_DIR TARGET_DIR # for entire directory

Below ran on:

- (2016-09-01) for ASUS

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
