#!/bin/bash

temp_dir="/tmp/geturl_temp"
cd $temp_dir
# String formatters (credit to Homebrew installation script)
if [[ -t 1 ]]
then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi
tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"



warn() {
  printf "${tty_red}Warning${tty_reset}: %s\n" "$(chomp "$1")"
}

abort() {
  for MESSAGE in "$@"; do
    echo "$($tty_red) Error: $(tty_reset)$MESSAGE"
  done
  exit 1
}

function is_installed {
    /bin/bash -c "$1 > /dev/null" > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        abort "$1 is not installed" "Please install $1 to use this script"
    fi
}

function is_a_thing {
    if [ -f "$1"]; then
        return 0
    elif [ -d "$1"]; then
        return 0
    else
        return 1
    fi
}
is_installed "python3"
is_installed "curl"

##################################################################################################################### install script
# install requirements
curl https://raw.githubusercontent.com/fel1x0u/geturl/main/requirements.txt > requirements.txt
/usr/bin/env python3 -m pip install -r $temp_dir/requirements.txt 1>/dev/null
# check if $HOME/bin is a thing
is_a_thing "$HOME/bin"
# Get geturl from GitHub (will always be beta version)
curl https://raw.githubusercontent.com/fel1x0u/geturl/main/src/geturl > $HOME/bin/geturl
ln -s $HOME/bin/geturl /usr/local/bin/geturl
# Get the update script
rm -f /tmp/geturl_temp/requirements.txt
echo "export PATH=$PATH:/usr/local/bin" >> $HOME/.bashrc
echo "GetURL version $(curl https://raw.githubusercontent.com/fel1x0u/geturl/main/src/version) has been installed. You can now use it by executing `geturl`."
echo "For more information, refer to the README.md file on the GitHub repo."
echo "If you have any issues, please create an issue on the GitHub repository (fel1x0u/geturl)."
