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
    #COMMAND="wget --timeout=10 --tries=2 --spider --header=${H1}  --post-data=${DATA}  ${ADDRESS}"
    # silent version
    COMMAND="wget --timeout=10 --tries=2 --spider --header=${H1}  --post-data=${DATA}  ${ADDRESS} &> /dev/null"
    echo "Note: sending build option info, if you don't want to send it, comment out line 19 in git_access.sh"
    eval $COMMAND
}

function git_clone_or_pull() {
    GITREPO=$1
    REPO=$2    
    SRCDIR=$3
    shift 
    shift 
    shift 

    GIT=$(command -v git)
    mkdir -p $SRCDIR
    cd $SRCDIR

    DO_CHECKOUT=false
    while [[ $# -gt 0 ]]
    do
        key="$1"
        case $key in
           --checkout)
           DO_CHECKOUT=true
           BRANCH=$2
           shift # past argument
           shift # past param
           ;;
           *)
           echo "Unknown option " $key
           exit 2  #  error_code=2
           ;;
        esac
    done

    
#   send_log $REPO
    
    if [ ! -d $REPO ]; then
        $GIT clone $GITREPO $REPO    
        cd $SRCDIR/$REPO
	if $DO_CHECKOUT ;then
            $GIT checkout $BRANCH
	fi
    else
        cd $REPO
        BRANCH2=$($GIT rev-parse --abbrev-ref HEAD)
	
        # if it is detached head, road master (mfem repo could be in this case)
        if [ "$BRANCH2" == "HEAD" ]; then
            BRANCH2="master"
        fi
	
        echo ${BRANCH2}	
	if $DO_CHECKOUT ;then
	    if [[ "$BRANCH2" != "$BRANCH" ]]; then
		$GIT checkout $BRANCH
	    fi
	    BRANCH2=$BRANCH
	fi

        echo "pulling branch = "${BRANCH2}
        $GIT pull origin ${BRANCH2}
    fi
}
