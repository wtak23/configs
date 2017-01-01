#=============================================================================#
# http://www.statmethods.net/interface/customizing.html
# Sample Rprofile.site file
#=============================================================================#
# Things you might want to change
# options(papersize="a4")
# options(editor="notepad")
# options(pager="internal")

# R interactive prompt
# options(prompt="> ")
# options(continue="+ ")

# to prefer Compiled HTML
# help options(chmhelp=TRUE)
# to prefer HTML help
# options(htmlhelp=TRUE)

# General options
# options(tab.width = 2)
# options(width = 130)
# options(graphics.record=TRUE)



#-----------------------------------------------------------------------------#
# After updating Rstudio to 1.0.44, begain to get error below
# > lattice::splom(pca5,group=pca5$site,alpha=0.2)
# Warning message:
# In grid.Call.graphics(L_points, x$x, x$y, x$pch, x$size) :
#   semi-transparency is not supported on this device: reported only once per page
#
# So i did this: http://tinyheero.github.io/2015/09/15/semi-transparency-r.html
#-----------------------------------------------------------------------------#
#http://tinyheero.github.io/2015/09/15/semi-transparency-r.html
# setHook(packageEvent("grDevices", "onLoad"),
# function(...) grDevices::X11.options(type='cairo'))
# options(device='x11')
options(bitmapType="cairo")

.First <- function(){
 # library(Hmisc)
 # library(R2HTML)
 cat("\nWelcome at", date(), "\n")
}

.Last <- function(){
 cat("\nGoodbye at ", date(), "\n")
}