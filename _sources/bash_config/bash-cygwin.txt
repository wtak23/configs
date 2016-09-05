.. _bash-cygwin:

Cygwin setup (``bash-cygwin.rst``)
""""""""""""""""""""""""""""""""""
``bash_cygwin.rst``

.. contents:: `Contents`
   :depth: 2
   :local:

.. _bash-cygwin-symlink:

#############
symlink setup
#############
.. note::

    Syntax for creating symlinks in Windows (run as admin):

    ::

        mklink SOURCE_FILE TARGET_FILE # for individual files
        mklink /d SOURCE_DIR TARGET_DIR # for entire directory

.. admonition:: CRITICAL CHANGE (2016-09-04)

    Changed ``$HOME`` in cygwin to my actual windows home directory in ``.bashrc``. Target of the symlink below have now changed.

    **Updated version**

    ::

        mklink "c:Users\takanori\.gitignore" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.gitignore"
        mklink "c:Users\takanori\.gitconfig" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.gitconfig"
        mklink "c:Users\takanori\.bash_aliases" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.bash_aliases"
        mklink "c:Users\takanori\.bashrc" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.bashrc"
        mklink "c:Users\takanori\.inputrc" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.inputrc"
        mklink "c:Users\takanori\.emacs" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.emacs"

    **(old version)** Below ran on ASUS on 09-01-2016 (17:57)

    ::
      
      mklink "c:\cygwin64\home\takanori\.gitignore" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.gitignore"
      mklink "c:\cygwin64\home\takanori\.gitconfig" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.gitconfig"
      mklink "c:\cygwin64\home\takanori\.bash_aliases" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.bash_aliases"
      mklink "c:\cygwin64\home\takanori\.bashrc" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.bashrc"
      mklink "c:\cygwin64\home\takanori\.emacs" "C:\Users\takanori\Dropbox\git\configs\source\bash_config\cygwin\.emacs"



##############
bashrc content
##############
`Github <https://github.com/wtak23/configs/blob/master/source/bash_config/cygwin/.bashrc>`__

.. code-block:: rst

    .. literalinclude:: ./cygwin/.bashrc
        :language: bash
        :linenos:

.. literalinclude:: ./cygwin/.bashrc
    :language: bash
    :linenos:

####################
bash_aliases content
####################
.. todo:: clean this unholy mess...

`Github <https://github.com/wtak23/configs/blob/master/source/bash_config/cygwin/.bash_aliases>`__

.. code-block:: rst

    .. literalinclude:: ./cygwin/.bash_aliases
        :language: bash
        :linenos:  

.. literalinclude:: ./cygwin/.bash_aliases
    :language: bash
    :linenos:    

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

##################
git related stuffs
##################
*************
github sshkey
*************
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

.. code-block:: bash

    ssh-keygen -t rsa -b 4096 -C takwatanabe2004@gmail.com
*******************
git code completion
*******************
Copy and paste the file ``git`` under ``C:\cygwin64\etc\bash_completion.d``
to enable code completion with ``<tab>`` for git commands.

################
Random overflows
################
- http://stackoverflow.com/questions/9637601/open-cygwin-at-a-specific-folder

.. code-block:: bash

    apt-cyg install chere
    chere -i -t mintty # <- run as admin

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

*************************************
disable annoying bell sound in cygwin
*************************************
http://stackoverflow.com/questions/1731700/how-do-i-turn-the-beep-slash-bell-off-in-cygwin

Add ``set bell-style none`` to ``.inputrc`` in your home directory    