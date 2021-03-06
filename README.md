# GitHubTools

## Some bash scripts to manage local Git repos

Put these files in your ~/bin/ directory, and add \~/bin to your path if it isn't already, by adding to **\~/.bashrc**, the line:
```
export PATH="$PATH:~/bin
```
They will automatically move to the local repo to do their work, and will move back to whence they came when finished.
For your own project, the Canonical and the Fork can be the same.
Otherwise, the Canonical is the 'original' on GitHub, and the fork is your copy on GitHub.
A Pull request is required to ask the owner to pull changes from your fork into the Canonical (original owner's copy).
These scripts are hard coded to work only on the master branch.

**BuildLocalRepo.sh**  $GitHubHost  $CanonPath  $ForkPath  $RepoName  $UserID  $eMail

\- *BuildLocalRepo.sh  github.com  /C0missar/  /C0missar/  GitHubTools  C0missar  Stan@StanWard.net*

```
Creates or overwrites ~/git/($RepoName)
Does a git init
Sets up your git credentials
Creates or overwrites your git remote entries
Does an initial git pull from the canonical master branch
Does an initial git commit to the fork master branch
```
You will be prompted once for your GitHub credentials; from then on, they will be autofilled from the credential store.

**Pull.sh**  $RepoName

\- *Pull.sh  GitHubTools*
```
Does a git pull from the canonical master branch
```
**Commit.sh**  $RepoName

\- *Commit.sh*  GitHubTools
```
Does a git add -A ./* (to add any new files)
Does a git commit -a -m (and includes the date in the memo field)
Does a git push to the fork master branch
```
