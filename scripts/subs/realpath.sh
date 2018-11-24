SC=$(dirname "$BASH_SOURCE")/ostype.sh
source $SC
function safe_realpath() {
   OSTYPE=$(ostype)  
   if [ -x "$(command -v realpath)" ]; then
      echo "realpath found !"
      realpath $1
      return
   fi
   if [ "$OSTYPE" == "Mac" ]; then
      # we dont try readlink in Mac since it is different 
      # readlink (BSD) used in Linuxxa
      echo "realpath is not avaialbe emulating it with python (Mac)"
      python -c 'import os,sys;print(os.path.realpath("'"$1"'"))'
      exit 0
   fi
   if [ -x "$(command -v readlink)" ]; then
      echo "Using readlink"
      readlink -f $1
      return
   fi
   # I am not sure if it comes to this fallback...
   echo "realpath is not avaialbe emulating it with python"
   python -c 'import os,sys;print(os.path.realpath("'"$1"'"))'
}

   
