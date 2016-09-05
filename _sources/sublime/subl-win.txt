.. _subl-win:

Windows setup (``subl-win.rst``)
""""""""""""""""""""""""""""""""
.. contents:: `Contents`
   :depth: 2
   :local:

.. important::

  Also see `<../windows.html>`_


.. _subl-win-symlink:

########
Symlinks
########
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


  :: folderwise sync (currently mostly build-systems)
  mklink /d "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\synced_by_folder" "C:\Users\takanori\Dropbox\git\configs\source\sublime\sync_by_folder_win"

  :: individual files
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\Diff.sublime-settings" "C:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\Diff.sublime-settings"
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\BufferScroll.sublime-settings" "C:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\BufferScroll.sublime-settings"

  :: macros
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\my_shift_newLine.sublime-macro" "c:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\my_shift_newLine.sublime-macro"
  mklink "c:\users\takanori\AppData\Roaming\Sublime Text 3\Packages\User\add_date.py" "c:\Users\takanori\Dropbox\git\configs\source\sublime\synced_by_files\add_date.py"


##################
Installed Packages
##################
*******
xps8900
*******
.. code-block:: rst

    .. literalinclude:: Package Control_8900.sublime-settings
        :language: json
        :linenos:

.. literalinclude:: Package Control_xps8900.sublime-settings
    :language: json
    :linenos:

****
asus
****
.. code-block:: rst

    .. literalinclude:: Package Control_asus.sublime-settings
        :language: json
        :linenos:

.. literalinclude:: Package Control_asus.sublime-settings
    :language: json
    :linenos:

*******************************
asus diff with sbia workstation
*******************************
.. code-block:: rst

    .. literalinclude:: Package Control_sbia.sublime-settings
        :language: diff
        :linenos: 
        :diff: Package Control_asus.sublime-settings

.. literalinclude:: Package Control_sbia.sublime-settings
    :language: diff
    :linenos: 
    :diff: Package Control_asus.sublime-settings

#####################################
Bunch of random helpful config stuffs
#####################################

*********************************************
Open cygwin shell via right-click in explorer
*********************************************

- http://stackoverflow.com/questions/9637601/open-cygwin-at-a-specific-folder

***************************************
Getting buildsystem to work with cygwin
***************************************
http://stackoverflow.com/questions/23588260/does-the-sublime-text-2-build-system-accept-input-if-does-not-are-there-any-wor

The ``"path"`` below does the trick

.. code-block:: javascript

    {
        "path" : "C:/cygwin64/bin/",
        "cmd": ["bash.exe","$file"],
        "file_regex": "^[ ]*File \"(...*?)\", line ([0-9]*)",
        "word_wrap": false,
        "selector": "source.shell"    
    }