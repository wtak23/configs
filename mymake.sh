#!/usr/bin/env bash
#=============================================================================#
# Ran via sublime bulid-system.
#=============================================================================#
export PATH="$HOME/anaconda2/bin:$PATH" # <- when running script from sublime-build, python calls from /usr/bin/python.  i want anaconda python to run
export PATH="/cygdrive/c/Users/takanori/Anaconda2/Scripts:$PATH" # <- in case i'm on windows
# # which python # <- verify python from anaconda is running
make clean
# # rm -r ./source/generated*
# # mkdir ./source/generated
# # mkdir ./source/generated/generated
# # cp -r ./source/_templates ./source/generated/
# # cp -r ./source/_templates ./source/generated/generated/
make html

BROWSE=true

if [[ ! BROWSE ]]; then exit 0; fi

if [[ $(uname -o) == 'Cygwin' ]]; then
  "/cygdrive/C/Program Files (x86)/Google/Chrome/Application/chrome.exe" \
      $(cygpath -w ${PWD}/build/html/index.html)
else
    google-chrome ./build/html/index.html      
fi
# # rsync -r build/html/ bs4doc/