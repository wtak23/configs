R (``R.rst``)
"""""""""""""

#####################
Configuring R startup
#####################
- https://www.r-bloggers.com/fun-with-rprofile-and-customizing-r-startup/
- http://www.statmethods.net/interface/customizing.html

################
Linux - sylminks
################
.. code-block:: bash

    # my functions
    mklink "C:\Users\takanori\Documents\tak.R" "C:\Users\takanori\Dropbox\git\configs\source\R\tak.R"

    # snippets
    ln -s ~/Dropbox/git/configs/source/R/r.snippets ~/.R/snippets/r.snippets

    # hotkeys
    ln -s ~/Dropbox/git/configs/source/R/rstudio_bindings.json ~/.R/rstudio/keybindings/rstudio_bindings.json

    # R-startup (see http://www.statmethods.net/interface/customizing.html)
    # (also see ?Startup() in an R session for detailed info)
    ln -s ~/Dropbox/git/configs/source/R/.Rprofile ~/.Rprofile


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