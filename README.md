### geturl


Hi! This is geturl. I must address some things in this README before I begin.

- The `$` symbol indicates a UNIX/bash shell prompt. (Remove this from your command.)
- The `#` symbol indicates that root access is required.
- You do need to have python3 and to execute `$ pip install -r requirements.txt --user` before you begin.
- For the commands prefixed with a `#`, sudo can also be used.

Now, we can begin!


### Installation

# Mac / Linux
**Please make sure to have wget and curl installed on your system. This usually goes down to **`# apt install wget curl`** or **`# yum install wget curl`**.**


Paste the following into your `bash` prompt:

	
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/fel1x0u/geturl/main/install/install.sh)"

and bam, the software is installed!

You can now execute it by doing `$ geturl` and the help screen will show up.

# Windows
Open Powershell as administrator, and paste in the following:


	Invoke-WebRequest -Uri https://raw.githubusercontent.com/fel1x0u/geturl/main/install/install.ps1

# Usage

You get a file by executing:

	$ geturl -u url -o output_file
where url is your URL and output_file is where you want the contents to go.

You can get all of the options by running

	$ geturl --help

The version is shown by executing:

	$ geturl --version


### Uninstallation


# Mac / Linux
It's very easy, just a simple


	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent/fel1x0u/geturl/main/uninstall.sh)"


