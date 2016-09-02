sbia workstation (``py-sbia.rst``)
""""""""""""""""""""""""""""""""""
Python setup - sbia-pc125 workstation

.. contents:: `Contents`
   :depth: 2
   :local:


###############
symlink summary
###############
.. code-block:: bash
    :linenos:

    SOURCE="${HOME}/Dropbox/git/configs/source/python/sbia"
    
    # === spyder template file ===
    ln -s "${SOURCE}/template.py" "${HOME}/.spyder2/"

    # === matplotlib rc ==== 
    MPL_TARGET=$(ipython -c "import matplotlib as mpl; from os.path import dirname; print dirname(mpl.matplotlib_fname())")
    ln -s "${SOURCE}/matplotlibrc" "${MPL_TARGET}"

    # === custom.js ====
    # (I need to remind myself what exactly this was for...)
    ln -s "${SOURCE}/custom.js" "${HOME}/.ipython/profile_default/static/custom/"

    #=========================================================================#
    # symlinks for ipython
    #=========================================================================#
    TARGET="${HOME}/.ipython"

    # extensions directory
    ln -s "${SOURCE}/ipython/extensions" "${TARGET}"

    # ipython extension files (entire directory symlink'ed)
    ln -s "${SOURCE}/ipython/extensions" "${TARGET}"

    # startup files (entire directory symlink'ed)
    ln -s "${SOURCE}/ipython/profile_default/startup" "${TARGET}/profile_default"

    # global conf
    ln -s "${SOURCE}/ipython/profile_default/ipython_config.py" "${TARGET}/profile_default"

    # kernel file (gives me handle on default mplrc on jupyter notebook)
    ln -s "${SOURCE}/ipython/profile_default/ipython_kernel_config.py" "${TARGET}/profile_default"

    # forgot what these are, but hey, why not (can't hurt)
    ln -s "${SOURCE}/ipython/profile_default/ipython_qtconsole_config.py" "${TARGET}/profile_default"
    ln -s "${SOURCE}/ipython/profile_default/ipython_notebook_config.py" "${TARGET}/profile_default"

    #=========================================================================#
    # sitecustomize.py (for spyder and for general python)
    #=========================================================================#
    # general python startup (I first needed to use this for building with Sphinx)
    ln -s "${HOME}/Dropbox/git/configs/source/python/sbia/sitecustomize.py" \
          "${HOME}/.local/lib/python2.7/site-packages"

    # spyder startup
    ln -s "${HOME}/Dropbox/git/configs/source/python/sbia/sitecustomize_spyder.py" \ 
          "${HOME}/anaconda2/lib/python2.7/site-packages/spyderlib/widgets/externalshell/sitecustomize.py"
          
#############
ipython setup
#############
- https://ipython.org/ipython-doc/1/config/overview.html

.. rubric:: Locating profile path

.. code-block:: bash

    $ ipython locate
    /home/takanori/.ipython

    $ ipython locate profile
    /home/takanori/.ipython/profile_default

    $ ipython locate profile foo
    /home/you/.ipython/profile_foo

.. note::

    Why I bother with ``ipython_kernel_config.py`` 

    - to configure matplotlibrc parameters in ipynb
    - http://stackoverflow.com/questions/17230797/how-to-set-the-matplotlib-figure-default-size-in-ipython-notebook

************************************
Content of ``ipython_kernel_config``
************************************
.. code-block:: rst

    .. literalinclude:: sbia/ipython/profile_default/ipython_kernel_config.py
        :language: diff
        :linenos:
        :diff: sbia/ipython/profile_default/ipython_kernel_config_original.py
        
.. literalinclude:: sbia/ipython/profile_default/ipython_kernel_config.py
    :language: diff
    :linenos:
    :diff: sbia/ipython/profile_default/ipython_kernel_config_original.py


############
matplotlibrc
############

.. code-block:: bash

    # get path to rc file
    $ ipython -c "import matplotlib as mpl; from os.path import dirname; print dirname(mpl.matplotlib_fname())"
    /home/takanori/anaconda2/lib/python2.7/site-packages/matplotlib/mpl-data

    #=========================================================================#
    # create symlink
    #=========================================================================#
    SOURCE="${HOME}/Dropbox/git/configs/source/python/sbia"
    MPL_TARGET=$(ipython -c "import matplotlib as mpl; from os.path import dirname; print dirname(mpl.matplotlib_fname())")

    # matlotlibrc
    ln -s "${SOURCE}/matplotlibrc" "${MPL_TARGET}"

***************************
Content of ``matplotlibrc``
***************************
.. code-block:: rst

    .. literalinclude:: sbia/matplotlibrc
        :language: diff
        :diff: sbia/matplotlibrc_original
        :linenos:
        
.. literalinclude:: sbia/matplotlibrc
    :language: diff
    :diff: sbia/matplotlibrc_original
    :linenos:

#################################
New - symlink to sitecustomize.py
#################################
Basically stuffs I want python to run at program startup (in case I am not using ``ipython``)

.. code-block:: bash

    # general python startup (I first needed to use this for building with Sphinx)
    ln -s "${HOME}/Dropbox/git/configs/source/python/sbia/sitecustomize.py" \
          "${HOME}/.local/lib/python2.7/site-packages"

    # spyder startup
    ln -s "${HOME}/Dropbox/git/configs/source/python/sbia/sitecustomize_spyder.py" \ 
          "${HOME}/anaconda2/lib/python2.7/site-packages/spyderlib/widgets/externalshell/sitecustomize.py"

***************************************
Current content of ``sitecustomize.py``
***************************************
.. code-block:: rst

    .. literalinclude:: sbia/sitecustomize.py
        :language: python

.. literalinclude:: sbia/sitecustomize.py
    :language: python

******************************
what does sitecustomize.py do?
******************************
- http://stackoverflow.com/questions/10693706/creating-a-secondary-site-packages-directory-and-loading-packages-from-pth-fil
- http://masasuzu.hatenablog.jp/entry/20110313/1299997912
- http://nedbatchelder.com/blog/201001/running_code_at_python_startup.html

  - **this one was the most informative**

**********************************************
Current content of ``sitecustomize_spyder.py``
**********************************************
.. code-block:: rst

    .. literalinclude:: sbia/sitecustomize_spyder.py
        :language: diff
        :linenos:
        :diff: sbia/sitecustomize_spyder_original.py

.. literalinclude:: sbia/sitecustomize_spyder.py
    :language: diff
    :linenos:
    :diff: sbia/sitecustomize_spyder_original.py

######################
Changes with _original
######################
Use ``diff`` or better yet, ``colordiff`` to see the changes I made

.. code-block:: diff

    $ colordiff sitecustomize_spyder.py sitecustomize_original.py 
    14,23d13
    < #=============================================================================#
    < # MY SNIPPETS (TAK)
    < #=============================================================================#
    < import sys
    < reload(sys)
    < sys.setdefaultencoding('UTF8')
    < 
    < #-----------------------------------------------------------------------------#
    < # \end tak snippets
    < #-----------------------------------------------------------------------------#