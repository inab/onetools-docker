#!/bin/sh

# This fetches, builds and installs OpenNebula command line one tools
RELVER=5.8.5

if [ $# -gt 0 ] ; then
	RELVER="$1"
fi

set -e

apt-get update
apt-get -y install libxml-xpath-perl
apt-get clean autoclean
apt-get autoremove --yes
rm -rf /var/lib/apt/lists/*

cd /tmp
BUILDDIR="$(mktemp -d)"
cd "$BUILDDIR"

git clone -b release-"${RELVER}" https://github.com/OpenNebula/one.git
cd one
./install.sh -c cli
gem install nokogiri
cd /
rm -rf "$BUILDDIR"
