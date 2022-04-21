#!/bin/sh -e

echo "#################################################"
echo "Now deploying to GitHub Pages..."
REMOTE_REPO="https://${GH_PAT}@github.com/${GITHUB_REPOSITORY}.git" && \
REPONAME="$(echo $GITHUB_REPOSITORY| cut -d'/' -f 2)" && \
OWNER="$(echo $GITHUB_REPOSITORY| cut -d'/' -f 1)" && \
GHIO="${OWNER}.github.io" && \
if [[ "$REPONAME" == "$GHIO" ]]; then
  REMOTE_BRANCH="main"
else
  REMOTE_BRANCH="gh-pages"
fi && \
echo - git config && \
git config --global user.name "${GITHUB_ACTOR}" && \
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com" && \
git config --global --add safe.directory "*" && \
echo - git init && \
git init --initial-branch main "$BUILD_DIR" && \
cd "$BUILD_DIR" && \
echo - git add && \
git add . && \
echo - git commit && \
git commit -m 'Deploy to GitHub Pages' && \
echo - git push && \
git push --force $REMOTE_REPO main:$REMOTE_BRANCH && \
rm -fr .git && \
cd $GITHUB_WORKSPACE && \
echo "Content of $BUILD_DIR has been deployed to GitHub Pages."
