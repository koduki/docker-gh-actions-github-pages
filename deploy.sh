#!/bin/bash

#GIT_ID=koduki
#SRC_DIR=_book
#DEPLOY_DIR=docs/book-introduction-of-jfr/site/
REMOTE_REPOS="https://x-access-token:${PERSONAL_TOKEN}@github.com/${GIT_ID}/${GIT_ID}.github.io.git"

COMMIT_MSG="Publish site"

echo "Clone ${GIT_ID}.github.io"
rm -rf ${GIT_ID}.github.io
git clone ${REMOTE_REPOS}

echo "Deploy ${SRC_DIR} to ${DEPLOY_DIR}"
rm -rf ${GIT_ID}.github.io/${DEPLOY_DIR}
mv ${SRC_DIR} ${GIT_ID}.github.io/${DEPLOY_DIR}

echo "Push"
cd ${GIT_ID}.github.io/
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

git add *
git commit -m "${COMMIT_MSG}" -a
git push

echo "Finished"
