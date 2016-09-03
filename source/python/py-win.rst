Windows machine (``py-win.rst``)
""""""""""""""""""""""""""""""""
.. note:: (from old notes)

    .. code:: bash
        
        # mklink syntax is reverse of ln -s
        mklink "C:\Users\takanori\.spyder2\template.py" "C:\Users\takanori\Dropbox\git\configs_master\sbia-pc125-cinn\python\template.py"
        mklink "C:\Users\takanori\Anaconda2\lib\site-packages\matplotlib\mpl-data\matplotlibrc" "C:\Users\takanori\Dropbox\git\configs_master\sbia-pc125-cinn\python\matplotlibrc"

############
pip installs
############
Below may be incomplete...

.. code-block:: bash

    pip install bctpy --user
    pip install nimfa --user
    pip install nilearn --user
    pip install seaborn --user
    pip install numpydoc --user
    pip install sphinx_rtd_theme --user

################################
Rollback Sphinx to Version 1.3.5
################################
To get ``copybutton.js`` working, among bunch of other things.

Below ran in cygwin

.. code-block:: bash

    git clone https://github.com/sphinx-doc/sphinx
    cd sphinx
    git checkout tags/1.3.5
    python setup.py install --user