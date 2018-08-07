function git_clone_or_pull() {
    GITREPO=$1
    REPO=$2    
    SRCDIR=$3


    GIT=$(command -v git)
    mkdir -p $SRCDIR
    cd $SRCDIR
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
