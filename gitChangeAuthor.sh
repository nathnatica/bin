#!/bin/sh


# 1. git clone --bare https://github.com/user/repo.git
#    cd repo.git
# 2. run this script
# 3. git push --force --tags origin 'refs/heads/*'
# 4. rm -rf repo.git

git filter-branch --env-filter '
OLD_EMAIL="old@email.com"
CORRECT_NAME="park"
CORRECT_EMAIL="new@email.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags


