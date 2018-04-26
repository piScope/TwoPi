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
        $GIT pull origin master
    fi
}
