ts-bash (``ts-bash.rst``)
"""""""""""""""""""""""""
.. contents:: `Contents`
   :depth: 2
   :local:

###############################
Getting mysql to work on cygwin
###############################
- mysqlserver: http://dev.mysql.com/downloads/mysql/

Installed ``mysql-installer-community-5.7.15.0.msi``

.. code-block:: bash

    apt-cyg install mysql
    apt-cyg install mysqlclient

This thread helped: http://stackoverflow.com/questions/329866/connecting-to-mysql-from-cygwin

*********
conf file
*********
``C:\cygwin64\etc\my.cnf``

Auto completion

http://stackoverflow.com/questions/8332338/autocompletion-in-the-mysql-command-line-client

.. code-block:: bash

    [client]
    host=127.0.0.1
    prompt="mysql> "

    [mysql]
    auto-rehash
******************************
pip install mysql doesn't work
******************************
so do this

http://stackoverflow.com/questions/26866147/mysql-python-install-fatal-error


**********************************
cygwin apt-cyg didn't work well...
**********************************
.. important:: Ignore all this!

    Just kept it for my personal record...

https://www.tutorialspoint.com/mysql/mysql-installation.htm



.. code-block:: bash

    apt-cyg install mysql
    apt-cyg install mysqld

- http://stackoverflow.com/questions/5376427/cant-connect-to-local-mysql-server-through-socket-var-mysql-mysql-sock-38
- http://stackoverflow.com/questions/5376427/cant-connect-to-local-mysql-server-through-socket-var-mysql-mysql-sock-38
- https://www.percona.com/blog/2014/08/26/mysqld_multi-how-to-run-multiple-instances-of-mysql/
- http://stackoverflow.com/questions/11893887/cygwin-connecting-to-mysql-cant-connect-to-local-mysql-server-through-socket

****************************
apt-cyg install md5sum error
****************************
- http://superuser.com/questions/894696/apt-cyg-install-return-md5sum-error

    To resolve the issue change the md5sum in line 323 and 326 of the file "apt-cyg" with sha512sum. It should work.

So I went to ``C:\cygwin64\bin\apt-cyg``, and changed md5sum with sha512sum as instructed, and everything worked again.

######################################
Old-notes from old config_master repos
######################################
.. note:: imported this from my old config notes. content may be obsolete 09-01-2016 (16:23)



*************
Color in less
*************
.. code:: bash

    # on my sbia computer
    ln -s ~/Dropbox/git/configs_master/sbia-pc125-cinn/.lessfilter ~/.lessfilter

Content of ``.lessfilter``

.. code-block:: bash
    :linenos:

    #!/bin/sh

    #=========================================================================#
    # to colorize ``less`` command
    # 06-15-2016 (18:54)
    #-----------------------------------------------------------------------------#
    # http://superuser.com/questions/117841/get-colors-in-less-command
    # http://pygments.org/docs/cmdline/
    # (note: i had to manually change color in the terminal so that text looks good; 
    # (eg: dark text on black bg looks horrendous)
    #=========================================================================#
    case "$1" in
        *.awk|*.groff|*.java|*.js|*.m4|*.php|*.pl|*.pm|*.pod|*.sh|\
        *.ad[asb]|*.asm|*.inc|*.[ch]|*.[ch]pp|*.[ch]xx|*.cc|*.hh|\
        *.lsp|*.l|*.pas|*.p|*.xml|*.xps|*.xsl|*.axp|*.ppd|*.pov|\
        *.diff|*.patch|*.py|*.rb|*.sql|*.ebuild|*.eclass)
            pygmentize "$1";;
        .bashrc|.bash_aliases|.bash_environment)
            pygmentize -l sh "$1"
            ;;
        *)
            grep "#\!/bin/bash" "$1" > /dev/null
            if [ "$?" -eq "0" ]; then
                pygmentize -l sh "$1"
            else
                exit 1
            fi
    esac

    exit 0


.. rubric:: Reference

- for cygwin (haven't tried yet)
    
  - http://unix.stackexchange.com/questions/19317/can-less-retain-colored-output
- for grep: http://superuser.com/questions/36022/less-and-grep-getting-colored-results-when-using-a-pipe-from-grep-to-less?rq=1

**********************************
Latex installer 06-15-2016 (21:48)
**********************************
I had to do this to get ``make latex`` to work on Sphinx

http://tex.stackexchange.com/questions/39771/finding-a-ubuntu-package-for-a-sty-file

.. code-block:: bash

    sudo apt-get install texlive-latex-extra

    # to solve error kpathsea: Running mktexmf ecrm1000 ! I can't find file `ecrm1000'.
    #http://tex.stackexchange.com/questions/116332/latex-compilation-of-simple-document-fails
    sudo apt-get install texlive-fonts-recommended