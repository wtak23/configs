############
Cygwin setup
############


.. contents:: `Contents`
   :depth: 2
   :local:


*************
symlink setup
*************
.. note::

    Syntax for creating symlinks in Windows (run as admin):

    ::

        mklink SOURCE_FILE TARGET_FILE # for individual files
        mklink /d SOURCE_DIR TARGET_DIR # for entire directory

Below ran on ASUS on 09-01-2016 (17:57)

::
  
  mklink "c:\cygwin64\home\takanori\.gitignore" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.gitignore"
  mklink "c:\cygwin64\home\takanori\.gitconfig" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.gitconfig"
  mklink "c:\cygwin64\home\takanori\.bash_aliases" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.bash_aliases"
  mklink "c:\cygwin64\home\takanori\.bashrc" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.bashrc"
  mklink "c:\cygwin64\home\takanori\.emacs" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.emacs"

***
git
***
Copy and paste the file ``git`` under ``C:\cygwin64\etc\bash_completion.d``

**************
bashrc content
**************
.. literalinclude:: ./cygwin/.bashrc
    :language: bash
    :linenos:

********************
bash_aliases content
********************
.. todo:: clean this unholy mess...

.. literalinclude:: ./cygwin/.bash_aliases
    :language: bash
    :linenos:    