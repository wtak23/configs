sbia-pc125 workstation
""""""""""""""""""""""
Python setup - sbia-pc125 workstation

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
    ln -s "${SOURCE}/matplotlibrc" "${MPL_TARGET}/"

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
