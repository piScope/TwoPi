function clone_or_pull() {
    GITREPO=$1
    REPO=$2    
    SRCDIR=$3


    GIT=$(command -v git)
    
    mkdir -p $SRCDIR
    if [ ! -d $REPO ]; then
        cd $SRCDIR
        $GIT clone $GITREPO $REPO    
        cd $SRCDIR/$REPO
    else
        cd $SRCDIR/$REPO	
        $GIT pull origin master
    fi
}
