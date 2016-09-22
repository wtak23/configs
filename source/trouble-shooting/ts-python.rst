ts-python (``ts-python.rst``)
"""""""""""""""""""""""""""""

.. contents:: `Contents`
   :depth: 2
   :local:

#################################
Getting theano to work on Windows
#################################
- https://www.kaggle.com/c/otto-group-product-classification-challenge/forums/t/13973/a-few-tips-to-install-theano-on-windows-64-bits

##############################################
No clue why, but jupyter kernel keeps dying...
##############################################
- https://github.com/ipython/ipython/issues/9656

Somehow, this rollback to older Ipython version solved it....hacky but will go with this for now... 09-19-2016 (23:21)

.. code-block:: python

    # *upgrade* not true, i had ipython 4.5
    pip install --user --upgrade ipython==4.1.1