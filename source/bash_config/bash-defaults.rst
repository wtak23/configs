Default bash config files (``bash-defaults.rst``)
"""""""""""""""""""""""""""""""""""""""""""""""""

.. contents:: `Contents`
   :depth: 2
   :local:


#######################
Default .bashrc, ubuntu
#######################
.. admonition:: Remark on location of the default

  - http://askubuntu.com/questions/404424/how-do-i-restore-bashrc-to-its-default
    
    - should be at ``/etc/skel/.bashrc``, but couldn't find it (no file exists)
  - http://stackoverflow.com/questions/14963767/bashrc-in-cygwin-1-7
   
    - for cygwin, this worked


Original ``.bashrc`` file content (taken from `here <https://gist.github.com/marioBonales/1637696>`__)

.. code-block:: rst

    .. literalinclude:: ./.bashrc_default_ubuntu
        :language: bash
        :linenos:    
        
.. literalinclude:: ./.bashrc_default_ubuntu
    :language: bash
    :linenos:    

#######################
Default .bashrc, cygwin
#######################
Original from ``/etc/skel/.bashrc``

.. code-block:: rst

    .. literalinclude:: ./.bashrc_default_cygwin
        :language: bash
        :linenos:    
        
.. literalinclude:: ./.bashrc_default_cygwin
    :language: bash
    :linenos:    
