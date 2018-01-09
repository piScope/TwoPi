#/usr/bin/env python

from __future__ import print_function
#from builtins import input
import os
import sys
import subprocess as sp

if "-h" in (sys.argv): 
    print("config_twopi.py  [-d]")
    print("  -d : debug on")
    sys.exit()
debug = True if "-d" in (sys.argv) else False

def run_command(command):
    if debug: print("   [Debug]running command :"+' '.join(command))
    p = sp.Popen(command, stdout=sp.PIPE, stderr = sp.STDOUT)
    return p.communicate()[0]

print("")
print("   Welcome to piScope/PetraM setup   ")
print("")

print("This configuration program setup virtualenv for python, ")
print("and install required pacakges.")
print("")

dest = os.path.join(os.getenv('HOME'), 'twopi')
dest2 = raw_input("Enter install destination ["+dest+"] ")
dest =  dest if dest2=="" else dest2
dest =  os.path.abspath(dest)
print("Entered Destination :"+dest)

if not os.path.exists(dest):
    ans = raw_input("New destinatin is entered. Continue to configure[[y]/n]? ")
    if ans.upper() == "" or ans.upper() == "Y":
        while True:
           itps = raw_input("Enter python (must be verion 2.7) interpreter [" +
                            sys.executable + "] ")
           itps = itps if not itps=='' else sys.executable
           command = [itps, '-c',  'import sys;print sys.version']
           if run_command(command).startswith("2.7"): break
           print("python version must be 2.7")

        command = ["virtualenv", "--python="+itps,
                   "--distribute",
                   "--system-site-packages",
                   "--unzip-setuptools",
                   dest]
        run_command(command)




