Misc symlinks (``misc-symlinks.rst``)
"""""""""""""""""""""""""""""""""""""

###########
SQL related
###########

*********************
MySql setup (windows)
*********************

::

    mklink "C:\cygwin64\etc\my.cnf" "C:\Users\takanori\Dropbox\git\configs\source\misc\my.cnf"

.. code-block:: rst

    .. literalinclude:: my.cnf
        :language: python

.. literalinclude:: my.cnf
    :language: python


************
sqlite setup
************
::
    
    ln -s "${HOME}/Dropbox/git/configs/source/misc/.sqliterc" "${HOME}"

.. code-block:: rst

    .. literalinclude:: .sqliterc

.. literalinclude:: .sqliterc
