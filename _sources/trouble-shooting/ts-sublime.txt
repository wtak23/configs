ts-sublime (``ts-sublime.rst``)
"""""""""""""""""""""""""""""""

.. contents:: `Contents`
   :depth: 2
   :local:
 
#################################################
Latexing complaining cannot find pdflatex command
#################################################
(2016-10-09)

Add the following to ``LaTeXing.sublime-settings``

::

    "path":
    [
        "C:\\Program Files\\MiKTeX 2.9\\miktex\\bin\\x64"
    ],

######################################
Old-notes from old config_master repos
######################################
.. note:: imported this from my old config notes. content may be obsolete 09-01-2016 (16:23)

*****************************
How to remove startup session
*****************************
in case Sublime-text freezes up at startup (keeps happening...err...)

.. code:: bash

    rm /home/takanori/.config/sublime-text-3/Local/Session.sublime_session

*****************
omni-markup error
*****************
https://github.com/timonwong/OmniMarkupPreviewer/issues/82

.. code::

    "server_host": "0.0.0.0",
    "server_port": 9998,

********************
get images from goto
********************
http://stackoverflow.com/questions/24834338/finding-images-in-go-to-anything

Changed this in ``.sublime-settings`` file:

.. code-block:: javascript

    // These files will still show up in the side bar, but won't be included in
    // Goto Anything or Find in Files
    "binary_file_patterns": ["*.jpg", "*.jpeg", "*.png", "*.gif", "*.ttf", "*.tga", "*.dds", "*.ico", "*.eot", "*.pdf", "*.swf", "*.jar", "*.zip"],