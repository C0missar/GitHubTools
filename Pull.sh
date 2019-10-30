#! /bin/bash
################################################################################
#
# Pull.sh $RepoName
#
# Pulls the master branch of the specified upstream (canonical) to the local
#
# 2019-10-03	Stan Ward		Original release
################################################################################

RepoName=$1

# Remember our roots

CWD=(`pwd`)

cd ~/git/$RepoName
git pull $RepoName-Canon master

# Return to whence we came

cd $CWD
