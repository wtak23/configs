ts-R (``ts-R.rst``)
"""""""""""""""""""

.. contents:: `Contents`
   :depth: 2
   :local:

#############################
ggplot2 load error on windows
#############################
http://stackoverflow.com/questions/31717850/error-package-or-namespace-load-failed-for-ggplot2-and-for-data-table

.. code-block:: R

    remove.packages(c("ggplot2", "data.table"))
    install.packages('Rcpp', dependencies = TRUE)
    install.packages('ggplot2', dependencies = TRUE)
    install.packages('data.table', dependencies = TRUE)