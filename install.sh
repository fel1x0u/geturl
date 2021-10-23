#!/bin/bash

# https://raw.githubusercontent.com/fel1x0u/geturl/main/src/geturl

curl https://raw.githubusercontent.com/fel1x0u/geturl/main/requirements.txt > /tmp/requirements.txt
/usr/bin/env python3 -m pip install -r /tmp/requirements.txt 1>/dev/null
if [! -d $HOME/bin]; then
    mkdir $HOME/bin
fi
curl https://raw.githubusercontent.com/fel1x0u/geturl/main/src/geturl > $HOME/bin/geturl
ln -s $HOME/bin/geturl /usr/local/bin/geturl
rm -f /tmp/requirements.txt
echo "export PATH=$PATH:/usr/local/bin" >> $HOME/.bashrc
echo "GetURL has been installed. You can now use it by executing `geturl`. For more information, refer to the README.md file on the GitHub repo."
