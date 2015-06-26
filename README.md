# awesome-console
**awesome-console** is a simple bash script designed to deploy tmux with tmuxinator.

## Usage
`git clone https://github.com/64b2b6d12b/awesome-console.git`

`cd awesome-console`

`chmod +x console.sh` 

`./console.sh`

## Tmuxinator Usage
See [Tmuxinator Usage](https://github.com/64b2b6d12b/awesome-console/blob/master/tmuxinator-usage.md)

## Compatability
This script is designed to run on CentOS 6.x. Other distributions/versions have not yet been tested.

## Dependencies
Although the script will automatically install the needed dependencies from yum if not available, the following is required:

* ncurses
* 'development tools' group install

## What the script does

* Installs ncurses and 'development tools' group install if not yet installed
* Compiles tmux from source
* Installs RVM (Ruby Version Manager)
* Installs Ruby Gems
* Installs tmuxinator

## Todo

* Add support for other distributions/versions
* Reduce stdout shown on console

## License
All code is licensed under the GPL, v3 or later. See LICENSE file for details.
