#
#  TwoPi installer using HomeBrew
#
#  this script is meant to be  donwloaded as a stand-alone
#  script
#


#  1) wget ..../twopi4brew_installer.sh
#  2) ./twopi4brew_installer.sh  prefix=${HOME}/TwoPi brewprefix=/usr/local/
echo "piScope/Petra-M installer for HomeBrew"
echo "This script will install packages in "${HOME}/twopi

${BASEDIR}=${HOME}/twopi

export TwoPiDevice=brew
export TwoPiGit=git@github.com:piScope  # repo for piScope/Petra-M modules
export TwoPiRoot=${BASEDIR}             # install location

# add bin and python path
export PATH=$TwoPiRoot/bin:$PATH        
export PYTHONPATH=$TwoPiRoot/lib/python2.7/site-packages:$PYTHONPATH

mkdir -p ${BASEDIR}/src
cd ${BASEDIR}/src
git clone https://github.com/piScope/TwoPi.git
cd ${BASEDIR}/TwoPi
bin/nominal_package_install
