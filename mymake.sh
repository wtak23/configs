#!/usr/bin/env bash
#=============================================================================#
# Ran via sublime bulid-system.
#=============================================================================#
#-------------------------------------------------------------------------#
# when running script from sublime-build, python calls from /usr/bin/python.  
# i want anaconda python to run
#-------------------------------------------------------------------------#
export PATH="$HOME/anaconda2/bin:$PATH" # <- when running script from sublime-build, python calls from /usr/bin/python.  i want anaconda python to run
export PATH="/cygdrive/c/Users/takanori/Anaconda2/Scripts:$PATH" # <- in case i'm on windows
# # which python # <- verify python from anaconda is running


# make clean
# # rm -r ./source/generated*
# # mkdir ./source/generated
# # mkdir ./source/generated/generated
# # cp -r ./source/_templates ./source/generated/
# # cp -r ./source/_templates ./source/generated/generated/
make html

#| not 100% happy with this approach in SO:
#| http://stackoverflow.com/questions/14345922/how-to-do-a-link-to-a-file-in-rst-with-sphinx
#| so i'm just gonna manually copy and paste pdf files to the build directory here
# cp -r ./source/_static/configs.pdf ./build/html/


exit 0
# --- browse result in chrome? --- #
# BROWSE=false
# if [[ ! BROWSE ]]; then exit 0; fi
if [[ $(uname -o) == 'Cygwin' ]]; then
  "/cygdrive/C/Program Files (x86)/Google/Chrome/Application/chrome.exe" \
      $(cygpath -w ${PWD}/build/html/index.html)
else
    google-chrome ./build/html/index.html      
fi
# # rsync -r build/html/ bs4doc/