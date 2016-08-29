Bash config files
"""""""""""""""""
.. contents:: `Content`
   :depth: 2
   :local:

.. todo:: **Cygwin setup** section

############################
SBIA-PC125 Workstation setup
############################
********
Symlinks
********
**Laste updated**: 08-28-2016 (00:36)

.. code-block:: bash

    SOURCE="${HOME}/Dropbox/git/configs/source/bash_config/sbia-pc-125"

    ln -s "${SOURCE}/.bashrc" ~/.bashrc
    ln -s "${SOURCE}/.bash_aliases" ~/.bash_aliases

    # git configs
    ln -s "${SOURCE}/.gitconfig" ~/.gitconfig
    ln -s "${SOURCE}/.gitignore" ~/.gitignore

    # to colorize my $less command
    ln -s "${SOURCE}/.lessfilter" ~/.lessfilter

***************
bashrc contents
***************
.. todo:: clean this unholy mess...

.. literalinclude:: ./bash_config/sbia-pc-125/.bashrc
    :language: bash
    :linenos:

*****************
gitconfig content
*****************
.. todo:: clean this unholy mess...

.. literalinclude:: ./bash_config/sbia-pc-125/.gitconfig
    :language: bash
    :linenos:

############
Cygwin setup
############
Most of the content here is from my old repos `configs_master <https://github.com/wtak23/configs_master/tree/master/cygwin>`__

*************
symlink setup
*************

**************
bashrc content
**************
.. literalinclude:: ./bash_config/cygwin/.bashrc
    :language: bash
    :linenos:

********************
bash_aliases content
********************
.. todo:: clean this unholy mess...

.. literalinclude:: ./bash_config/cygwin/.bash_aliases
    :language: bash
    :linenos:    

###############
Default .bashrc
###############
Original ``.bashrc`` file content (taken from `here <https://gist.github.com/marioBonales/1637696>`__)

.. literalinclude:: ./bash_config/.bashrc_default_ubuntu
    :language: bash
    :linenos:    