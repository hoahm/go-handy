#!/bin/bash
# Setup MongoDB on MacOS
# Author: Nobi Hoang

# Parse file path
function parse_filepath() {
    echo ${1//\//\\\/}
}

echo "======================================="
echo "Installing MongoDB"
echo
echo "Enter your dbPath (Default: /usr/local/var/mongodb):"
read dbPath


# Create directory
if [ ! -d "$dbPath" ]; then
  echo "Create directory: $dbPath"
  sudo mkdir -p $dbPath
fi


# Install homebrew
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi


# Install mongodb
if [[ $(command mongod --version) == "" ]]; then
    brew install mongodb
else
    echo "Already installed mongodb"
fi


# Update dbPath on the configuration file
if [ "$dbPath" != "" ]; then
    dbPath=$(parse_filepath $dbPath)
    cfgPath="/usr/local/etc/mongod.conf"
    echo $(sed "/dbPath/s/[^:]*/ $dbPath/3" $cfgPath) > $cfgPath
fi


printf "\n\n"
echo "-----------------------------------"
echo "Install MongoDB successfully!!!"
echo
echo "New to MongoDB? Go to https://docs.mongodb.com/manual/tutorial/getting-started/#getting-started for ger started."
echo "Compass is a GUI tool for manipulate data on MongoDB, go and install it: https://www.mongodb.com/products/compass"
echo
echo "Happy coding! (^_^)"
