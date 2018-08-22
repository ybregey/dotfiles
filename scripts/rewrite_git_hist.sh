# https://help.github.com/articles/changing-author-info/
#!/bin/sh

: ${OLD_EMAIL:?"Need to set OLD_EMAIL non-empty"}

# remove backup
rm -f .git/refs/original/refs/heads/master

git filter-branch --env-filter '

CORRECT_NAME="Yurko Bregey"
CORRECT_EMAIL="bregey@gmail.com"
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
