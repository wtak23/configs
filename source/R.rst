R (``R.rst``)
"""""""""""""

################
Linux - sylminks
################
.. code-block:: bash

    # snippets
    ln -s ~/Dropbox/git/configs/source/R/r.snippets ~/.R/snippets/r.snippets


##################
Windows - symlinks
##################
::
    
    # snippets
    mklink "C:\Users\takanori\Documents\.R\snippets\r.snippets" "C:\Users\takanori\Dropbox\git\configs\source\R\r.snippets"

    # keyboard shortcuts
    mklink "C:\Users\takanori\Documents\.R\rstudio\keybindings\rstudio_bindings.json" "C:\Users\takanori\Dropbox\git\configs\source\R\rstudio_bindings.json"

####################
Config file contents
####################
**********
r.snippets
**********

.. literalinclude:: ./R/r.snippets
    :language: R
    :linenos:


*******
hotkeys
*******
.. literalinclude:: ./R/rstudio_bindings.json
    :language: json
    :linenos: