# Scripts

## <b>create.sh</b>
This script is used to create a github repo and set a workspace locally for the repo from the command line. I developed this script to shorten the process of setting up a new flutter project. 
### <b>Usage</b>
Basic Repo creation</b>
```bash
./create.sh my_repo
```
Create repo and tag with portfolio topic
```bash
./create.sh my_repo -p
```
Create repo and setup flutter project
```bash
./create.sh my_repo -f
```
<br>
On my personal machine, I store the script at location:<br>
<b>~/bin/create.sh</b><br>
I then entered the following line inside of my .bashrc file<br>
<b>alias create='. ~/bin/create.sh'</b><br>
I then sourced the .bashrc file<br>
<b>source ~/.bashrc</b><br>

Now, the script can be executed from any directory on the machine by using the alias
```bash
create my_repo -f -p
```