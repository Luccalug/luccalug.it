#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo ">> Genero il sito <<"
hugo
echo "Commenta la modifica e premi [ENTER]: "
read comment

#master
git add --all && git commit -m $comment
git push
#gh-pages
cd public && git add --all && git commit -m $comment 
git push

cd ..
echo "Fatto ... bye!"
