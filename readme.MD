# shell script #

**steps**
* created repo in console
* clone the repo
* add the files to temp area
'''
git add <file-name>
'''
* commit the changes
'''
git commit -m "message"
'''
* push the changes to GITHUB/central repo
'''
git push -u origin main
'''

## GIT AUTHENTICAION: ##

### cloning repo ###
-------------------
* created repo in console
* clone the repo
* git add . --> ad code to temp area
* git commit -m "message" --> commit the code to local area
* git push --> push the code to central/remote repo

### existing repos to GITHUB: ###
----------------------------
* git init --> local to repo 
* git branch -M <branch-name> --> to change branch
* create repository in github
* git remote add origin <URL>
* git push -u origin main

### SSH Autentication: ###
---------------------
* create .ssh folder in git bash
* ssh-keygen -f <key> --> generate public/private key 
* keep public key in server
* keep private key with us
* create .ssh folder
* inside .ssh folder create config file without any extension
* inside cinfig file
Host github.com
	HostName github.com
	User git
	IdentityFile ~/.ssh/<private-key>