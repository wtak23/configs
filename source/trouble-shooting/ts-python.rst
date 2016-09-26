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

##############################
pip install mysql doesn't work
##############################

******
cygwin
******

For windows, do this (ref: http://stackoverflow.com/questions/26866147/mysql-python-install-fatal-error)

.. code-block:: bash

    pip install MySQL_python-1.2.5-cp27-none-win_amd64.whl --user

*******************
Linux (ubutu 14.04)
*******************
On linux, do this (ref: http://stackoverflow.com/questions/5178292/pip-install-mysql-python-fails-with-environmenterror-mysql-config-not-found)

.. code-block:: bash

    $ sudo apt-get install libmysqlclient-dev

Now everything is in business

.. code-block:: bash

    $ pip install mysql --user
    Collecting mysql
      Using cached mysql-0.0.1.tar.gz
    Collecting MySQL-python (from mysql)
      Using cached MySQL-python-1.2.5.zip
    Building wheels for collected packages: mysql, MySQL-python
      Running setup.py bdist_wheel for mysql ... done
      Stored in directory: /home/takanori/.cache/pip/wheels/3a/83/02/e5a659e28b517bff04eee83a5fed1f36761afe8d591835cd29
      Running setup.py bdist_wheel for MySQL-python ... done
      Stored in directory: /home/takanori/.cache/pip/wheels/38/a3/89/ec87e092cfb38450fc91a62562055231deb0049a029054dc62
    Successfully built mysql MySQL-python
    Installing collected packages: MySQL-python, mysql
    Successfully installed MySQL-python-1.2.5 mysql-0.0.1


##################################
pip install psycopg2 for postgreql
##################################
http://stackoverflow.com/questions/11618898/pg-config-executable-not-found

.. code-block:: bash

    $ sudo apt-get install libpq-dev
    $ pip install psycopg2 --user
    Collecting psycopg2
      Using cached psycopg2-2.6.2.tar.gz
    Building wheels for collected packages: psycopg2
      Running setup.py bdist_wheel for psycopg2 ... done
      Stored in directory: /home/takanori/.cache/pip/wheels/49/47/2a/5c3f874990ce267228c2dfe7a0589f3b0651aa590e329ad382
    Successfully built psycopg2
    Installing collected packages: psycopg2
    Successfully installed psycopg2-2.6.2

