#! /bin/bash
################################################################################
#
# BuildLocalRepo.sh $GitHubHost $CanonPath $ForkPath $RepoName $UserID $eMail
#
# Creates a local repo ~/git/$RepoName based on an existing Canonical and Fork,
# then does an initial pull and commit
#
# cd ~/git/$RepoName
# git remote -v
# Should result in:
#
# 	$RepoName-Canon https://$UserID@$GitHubHost$CanonPath$RepoName.git
# 	$RepoName-Fork  https://$UserID@$GitHubHost$ForkPath$RepoName.git
#
# 2019-10-17	Stan Ward		Generalized Repo hostname, path, and User info
# 2019-10-03	Stan Ward		Original release
################################################################################

if [ "$6" = "" ]; then 
	echo "Usage: BuildLocalRepo.sh $GitHubHost $CanonPath $ForkPath $RepoName $UserID $eMail - paths should begin and end with '/'";
	exit
fi

GitHubHost=$1		# github.com, github.sherwin.com
CanonPath=$2		# /C0missar/, /Corp-IS-InfoSec/
ForkPath=$3			# /C0missar/, /sxw455/
RepoName=$4			# (My repo)
UserID=$5			# GitHub user name
eMail=$6			# eMail address

# Remember our roots

CWD=(`pwd`)

git --version

mkdir -p ~/git/$RepoName
cd ~/git/$RepoName
git init
git config --global color.ui true
git config --global user.email "$eMail"
git config --global user.name "$UserID"
git config credential.helper store
git remote remove $RepoName-Canon 2>/dev/null
git remote remove $RepoName-Fork 2>/dev/null
git remote add $RepoName-Canon https://$UserID@$GitHubHost$CanonPath$RepoName.git
git remote add $RepoName-Fork https://$UserID@$GitHubHost$ForkPath$RepoName.git

# Do an initial pull (must be inside the local repo directory)

cd ~/git/$RepoName
git pull $RepoName-Canon master

# Do an initial commit (must be inside the local repo directory)

git add -A ./*
git commit -a -m "Commit `/bin/date "+%Y-%m-%d %H:%M"`"
git push $RepoName-Fork master

# Return to whence we came

cd $CWD
