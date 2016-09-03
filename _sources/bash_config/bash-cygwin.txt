Cygwin setup (``bash-cygwin.rst``)
""""""""""""""""""""""""""""""""""
``bash_cygwin.rst``

.. contents:: `Contents`
   :depth: 2
   :local:

#############
symlink setup
#############
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

###################
git code-completion
###################
Copy and paste the file ``git`` under ``C:\cygwin64\etc\bash_completion.d``
to enable code completion with ``<tab>`` for git commands.

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