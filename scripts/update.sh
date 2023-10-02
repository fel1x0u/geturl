#!/usr/bin/env bash


temp_dir = "/tmp/geturl_update"
cd "$HOME/bin"

git &2>/dev/null
if [ $? -eq 0 ]; then
    git pull
    git push
else
    echo "git not found"
fi


if [! -d "$temp_dir" ]; then
    mkdir "$temp_dir"
fi

if [ ! -f $HOME/bin/geturl] ; then
    echo "Please install GetURL first"
    exit 1
fi

curl https://raw.githubusercontent.com/fel1x0u/geturl/master/src/geturl -o "$temp_dir/geturl"
curl https://raw.githubusercontent.com/fel1x0u/geturl/master/version -o "$temp_dir/version"
if [ $($HOME/bin/geturl --version) -eq $(cat $temp_dir/version) ]; then
    echo "You have the latest version"
    rm -rf $temp_dir
    exit 0
else
    echo "Updating..."
    mv $HOME/bin/geturl $HOME/bin/geturl.old
    mv $temp_dir/geturl $HOME/bin/geturl
    chmod +x $HOME/bin/geturl
    echo "Update complete"
    echo "Cleaning up..."
    rm -rf $temp_dir
    echo "Done"
    echo "GetURL $($HOME/bin/geturl --version) is now installed"
fi