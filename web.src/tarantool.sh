#!/bin/bash
set -o nounset
set -o errexit

curl http://download.tarantool.org/tarantool/1.7/gpgkey | sudo apt-key add -release=`lsb_release -c -s`

# install https download transport for APT
sudo apt-get -y install apt-transport-https

# append two lines to a list of source repositories
sudo rm -f /etc/apt/sources.list.d/*tarantool*.list
sudo tee /etc/apt/sources.list.d/tarantool_1_7.list <<- EOF
deb http://download.tarantool.org/tarantool/1.7/debian/ $release main
deb-src http://download.tarantool.org/tarantool/1.7/debian/ $release main
EOF

# install
sudo apt-get update
sudo apt-get -y install tarantool
