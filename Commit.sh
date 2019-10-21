#! /bin/bash
################################################################################
#
# Commit.sh $RepoName
#
# Commits the master branch of the specified local to the remote repo
#
# 2019-10-03	Stan Ward		Original release
################################################################################

RepoName=$1

# Remember our roots

CWD=(`pwd`)

cd ~/git/$RepoName
git add -A ./*
git commit -a -m "Commit `/bin/date "+%Y-%m-%d %H:%M"`"
git push $RepoName-Fork master

# Return to whence we came

cd $CWD
