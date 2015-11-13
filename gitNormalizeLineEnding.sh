
### Refreshing Line Ending
git add . -u
git commit -m "Saving files before refreshing line endings"
# remove every file from git's index
git rm --cached -r .
# rewrite the git index to pick up all the new line endings
git reset --hard
# add all changes files
git add .
# commit
git commit -m "Normalize all the line endings"


