function send_log() {
    REPO=$1
    ACTION=$2   # install, clean
    OPTS=$3
    H1="'Content-Type: application/json'"
    ADDRESS="https://www-internal.psfc.mit.edu/~shiraiwa/petram_test/git_request.php"

    DATA="'{\"repo\" : \""${REPO}"\", \"action\" : \""${ACTION}"\", \"opts\" : \""${OPTS}"\"}'"
    #
    # make a command like this...
    # wget -S --header=$H1  --post-data="{\"repo\" : \"PetraM_RF\"}" $ADDRESS
    #
    # verbose version
    #  COMMAND="wget -S --header=${H1}  --post-data=${DATA}  ${ADDRESS}"
    # silent version
    COMMAND="wget --spider --header=${H1}  --post-data=${DATA}  ${ADDRESS} &> /dev/null"
    echo "Note: sending build option info, if you don't want to send it, comment out line 19 in git_access.sh"
    #echo $COMMAND
    eval $COMMAND
}

function git_clone_or_pull() {
    GITREPO=$1
    REPO=$2    
    SRCDIR=$3

    GIT=$(command -v git)
    mkdir -p $SRCDIR
    cd $SRCDIR

#    send_log $REPO
    
    if [ ! -d $REPO ]; then
        $GIT clone $GITREPO $REPO    
        cd $SRCDIR/$REPO
    else
        cd $REPO	

        BRANCH=$($GIT rev-parse --abbrev-ref HEAD)
        echo ${BRANCH}
        # if it is detached head, road master (mfem repo could be in this case)
        if [ "$BRANCH" == "HEAD" ]; then
            BRANCH="master"
        fi

        echo "pulling branch = "${BRANCH}
        $GIT pull origin ${BRANCH}
    fi
}
