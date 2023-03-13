# ----------------------------------------------------------------------------------------------------
# Module Name: Import Requirements Module
# Module Description: This module contains all the shell script execution to download the required 
# libraries and creates a virtual environment to function with the required libraries
# ----------------------------------------------------------------------------------------------------

# Import Python Libraries
import subprocess
import os
import sys

# Declare Local Variables
f = str('/requirements.txt')

# First, get the current directory
currentDir = os.getcwd()
path = currentDir + f
pyVersionFile = currentDir + '/Python-3.11.2'

if sys.platform.startswith('darwin'):
    # Check if the file exists
    if not os.path.exists(pyVersionFile):
        # Second, install python3 version 3.11.2
        subprocess.run("cd ~", shell=True)
        subprocess.run("mkdir tmp", shell=True)
        subprocess.run("cd tmp", shell=True)
        subprocess.run("wget https://www.python.org/ftp/python/3.11.2/Python-3.11.2.tgz", shell=True)
        subprocess.run("tar zxvf Python-3.11.2.tgz", shell=True)

    # Check if virtualenv is installed, if not install it. 
    if not os.path.exists('/usr/bin/virtualenv'): 
        subprocess.call([sys.executable, '-m', 'pip', 'install', 'virtualenv']) 

    # Create the virtual environment 
    subprocess.call([sys.executable, '-m', 'virtualenv', '--python=python3.11.2', 'venv']) 

    # Activate the virtual environment 
    subprocess.call(['./venv/bin/activate'], shell=True)

    # Executing the command 
    subprocess.run("python3 -m pip install --upgrade -r %s"%(path), shell=True) 

elif sys.platform.startswith('win32'):
    # Check if the file exists
    if not os.path.exists(pyVersionFile):
        # Second, install python3 version 3.11.2
        subprocess.run("cd ~", shell=True)
        subprocess.run("mkdir tmp", shell=True)
        subprocess.run("cd tmp", shell=True)
        subprocess.run("wget https://www.python.org/ftp/python/3.11.2/Python-3.11.2.tgz", shell=True)
        subprocess.run("tar zxvf Python-3.11.2.tgz", shell=True)

    # Check if virtualenv is installed, if not install it. 
    if not os.path.exists('/usr/Scripts/virtualenv'): 
        subprocess.call([sys.executable, '-m', 'pip', 'install', 'virtualenv']) 

    # Create the virtual environment 
    subprocess.call([sys.executable, '-m', 'virtualenv', '--python=python3.11.2', 'venv']) 

    # Activate the virtual environment 
    subprocess.call(['./venv/Scripts/activate'], shell=True)

    # Executing the command 
    subprocess.run("py -m pip install --upgrade -r %s"%(path), shell=True)     