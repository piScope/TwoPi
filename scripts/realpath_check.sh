SC=$(dirname "$0")/subs/realpath.sh
echo "BASH_SOURCE" $BASH_SOURCE

source ${SC}

safe_realpath $1