################
SBIA Workstation
################

The two most important files:

1. ``Preferences.sublime-settings`` --- global setup
2. ``Default (Linux).sublime-keymap`` --- keyboard shortcuts

  - (saved as ``keyboard_shortcut_sbia.sublime-keymap`` locally)

.. contents:: `Contents`
   :depth: 2
   :local:

*********
File-tree
*********
.. important:: Reupdated on 08-27-2016 (23:25) when creating this repos.

.. code-block:: bash

    $ tree -L 1 --dirsfirst
    .
    ├── snippets
    ├── synced_by_files
    ├── synced_by_folder
    ├── keyboard_shortcut_sbia.sublime-keymap
    ├── Preferences_sbia.sublime-settings
    ├── sublime.references.rst
    └── sublime.sbia.setup.rst

    3 directories, 4 files

- `synced_by_folders <https://github.com/wtak23/configs/tree/master/source/sublime/synced_by_folder>`_

  - contains files that must directly reside under ``~/.config/sublime-text-3/Packages/User`` (subfolders not allowed)
  - examples: ``*.sublime-settings``, ``*.sublime-macros``
- `snippets <https://github.com/wtak23/configs/tree/master/source/sublime/snippets>`_

  - contains my sublime **snippets** (gawd I love this functionality)
- `synced_by_files <https://github.com/wtak23/configs/tree/master/source/sublime/synced_by_files>`_

  - contains files that can be synced as subfolders in ``User`` directory in Sublime

**********************
Symbolic links created
**********************

.. code-block:: bash

    SOURCE="${HOME}/Dropbox/git/configs/source/sublime"
    TARGET="${HOME}/.config/sublime-text-3/Packages/User"

    # global setup
    ln -s "${SOURCE}/Preferences_sbia.sublime-settings" \
          "${TARGET}/Preferences.sublime-settings"

    # global keyboard setup
    ln -s "${SOURCE}/keyboard_shortcut_sbia.sublime-keymap" \
          "${TARGET}/Default (Linux).sublime-keymap"    

    # sync folder containing all my snippet files
    ln -s "${SOURCE}/snippets" "${TARGET}/snippets"

    # sync other folder containing files that can be synced at "directory-level"
    ln -s "${SOURCE}/synced_by_folder" "${TARGET}/synced_by_folder"

File-wise setup
===============
- macros and sublime-setting files must be copied directly under the ``User`` 
  directory
- I manually reupdate these every once in a while

Last update: **08-27-2016 (23:47)**

.. code-block:: bash

    SOURCE="${HOME}/Dropbox/git/configs/source/sublime/synced_by_files"
    TARGET="${HOME}/.config/sublime-text-3/Packages/User"
  
    # custom macros
    ln -s "${SOURCE}/add_date.py" "${TARGET}/add_date.py"
    ln -s "${SOURCE}/my_shift_newLine.sublime-macro" "${TARGET}/my_shift_newLine.sublime-macro"

    # *.sublime-settings file
    ln -s "${SOURCE}/Diff.sublime-settings" "${TARGET}/Diff.sublime-settings"
    ln -s "${SOURCE}/Anaconda.sublime-settings" "${TARGET}/Anaconda.sublime-settings"
    ln -s "${SOURCE}/FoldPython.sublime-settings" "${TARGET}/FoldPython.sublime-settings"
    ln -s "${SOURCE}/OmniMarkupPreviewer.sublime-settings" "${TARGET}/OmniMarkupPreviewer.sublime-settings"
    ln -s "${SOURCE}/Python.sublime-settings" "${TARGET}/Python.sublime-settings"

*****************
Installed packges
*****************
.. code-block:: bash

    $ cd ~/.config//sublime-text-3/Installed\ Packages/
    $ ls -1
    0_package_control_loader.sublime-package
    AdvancedNewFile.sublime-package
    All Autocomplete.sublime-package
    BracketHighlighter.sublime-package
    BufferScroll.sublime-package
    Clipboard Manager.sublime-package
    Diffy.sublime-package
    FileDiffs.sublime-package
    Fold Comments.sublime-package
    Fold Python.sublime-package
    GitGutter.sublime-package
    Git.sublime-package
    LaTeX-cwl.sublime-package
    Markdown Preview.sublime-package
    Origami.sublime-package
    Package Control.sublime-package
    PackageResourceViewer.sublime-package
    R-Box.sublime-package
    SideBarEnhancements.sublime-package
    SideBarFolders.sublime-package
    SideBarGit.sublime-package
    SyncedSideBar.sublime-package
    TabsExtra.sublime-package
    Theme - SoDaReloaded.sublime-package
    Theme - Soda SolarizedDark.sublime-package
    Theme - Soda.sublime-package
    Tomorrow Color Schemes.sublime-package
    TrailingSpaces.sublime-package
    View In Browser.sublime-package

************************************
Preferences.sublime-settings Content
************************************
.. literalinclude:: Preferences_sbia.sublime-settings
    :language: json
    :linenos:

**************************************
Default (Linux).sublime-keymap Content
**************************************
.. literalinclude:: keyboard_shortcut_sbia.sublime-keymap
    :language: javascript
    :linenos:
