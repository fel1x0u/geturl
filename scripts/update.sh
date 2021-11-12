#!/usr/bin/env bash



cd "$(locate geturl | head -n 1"

git &2>/dev/null
if [ $? -eq 0 ]; then
    git pull
    git push
else
    echo "git not found"
fi
