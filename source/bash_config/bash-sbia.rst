SBIA Workstation (``bash-sbia.rst``)
""""""""""""""""""""""""""""""""""""
.. contents:: `Contents`
   :depth: 2
   :local:

########
Symlinks
########
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

###############
bashrc contents
###############
`Github <https://github.com/wtak23/configs/blob/master/source/bash_config/sbia-pc-125/.bashrc>`__

.. code-block:: rst

    .. literalinclude:: ./sbia-pc-125/.bashrc
        :language: bash
        :linenos:

.. literalinclude:: ./sbia-pc-125/.bashrc
    :language: bash
    :linenos:

#################
gitconfig content
#################
.. todo:: clean this unholy mess...

`Github <https://github.com/wtak23/configs/blob/master/source/bash_config/sbia-pc-125/.gitconfig>`__

.. code-block:: rst

    .. literalinclude:: ./sbia-pc-125/.gitconfig
        :language: bash
        :linenos:

.. literalinclude:: ./sbia-pc-125/.gitconfig
    :language: bash
    :linenos:
