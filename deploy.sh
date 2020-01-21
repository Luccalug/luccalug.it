#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

echo ">> Genero il sito <<"
hugo
echo "Commenta la modifica e premi [ENTER]: "
read comment
git add --all && git commit -m $comment
cd public && git add --all && git commit -m $comment && cd ..
echo "Fatto ... bye!"
