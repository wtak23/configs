SBIA workstation setup (``misc-sbia-setups.rst``)
"""""""""""""""""""""""""""""""""""""""""""""""""

################
Stuffs installed
################
.. important::

    I'm sure there's bunch of other softwares I ``apt-get``'ed. 
    Below are just some subset I feel is important.

.. code-block:: bash

    sudo apt-get install padre
    sudo cpan Wx

    # these i needed for R's mclust package
    sudo apt-get install liblapack-dev
    sudo apt-get install libblas-dev

    # to ssh into this workstation
    sudo apt-get install openssh-server

    sudo apt-get install finger
    sudo apt-get install colordiff

    # 09-03-2016 (01:33)
    sudo apt-get install nodejs