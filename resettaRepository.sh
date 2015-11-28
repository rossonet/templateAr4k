#!/bin/bash
# Salva il contenuto del repository in git
#unset DISPLAY
unset SSH_ASKPASS
echo "elimina la directory GIT"
rm -rf .git
echo "git init"
git init
echo "git add ."
git add .
echo "git commit -a -m \"$1\""
git commit -a -m "$1"
echo "Aggiunge il repository remoto"
git remote add origin https://github.com/rossonet/templateAr4k.git
echo "git push --force"
git push --force

exit 0
