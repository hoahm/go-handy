#!/bin/bash
# Setup Golang and Go workspace on MacOS
# Author: Nobi Hoang

echo "Enter your golang path (Default: $HOME/golang):"
read gopath
if [ "$gopath" == "" ]; then
  gopath="$HOME/golang"
fi


username=""
while [ "$username" == "" ]; do
  echo "Enter your github username (ex: hoahm):"
  read username
done


echo ""
echo "Enter your shell:"
shells=("$HOME/.bashrc" "$HOME/.zshrc" "None")
select shell in "${shells[@]}"
do
    case $shell in
        "$HOME/.bashrc")
            break
            ;;
        "$HOME/.zshrc")
            break
            ;;
        "None")
            break
            ;;
        *) echo Invalid option;;
    esac
done


if [ ! -d "$gopath" ]; then
  echo "Create directory: $gopath"
  mkdir $gopath
fi

if [ ! -d "$gopath/src/github.com/$username" ]; then
  echo "Create directory: $gopath/src/github.com/$username"
  mkdir -p $gopath/src/github.com/$username
fi


if [ -e "$shell" ]; then
    if ! grep -Fq "export GOPATH=" $shell; then
        echo "export GOPATH=$gopath" >> $shell
    fi

    if ! grep -Fq "export GOROOT=" $shell; then
        echo "export GOROOT=/usr/local/opt/go/libexec" >> $shell
    fi

    if ! grep -Fq "export PATH=\$PATH:\$GOPATH/bin" $shell; then
        echo "export PATH=\$PATH:\$GOPATH/bin" >> $shell
    fi

    if ! grep -Fq "export PATH=\$PATH:\$GOROOT/bin" $shell; then
        echo "export PATH=\$PATH:\$GOROOT/bin" >> $shell
    fi
fi


if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating Homebrew"
    brew update
fi


if [[ $(command -v go) == "" ]]; then
    brew install go
else
    echo "Already installed golang"
fi


if [ ! -n "$GOPATH" ]; then
    export GOPATH=$gopath
    export PATH=$PATH:$GOPATH/bin
fi


if [ ! -n "$GOROOT" ]; then
    export GOROOT=/usr/local/opt/go/libexec
    export PATH=$PATH:$GOROOT/bin
fi


printf "\n\n"
echo "-----------------------------------"
echo "Install golang successfully!!!"
echo "Your shell: $shell"
echo "Github username: $username"
echo ""
echo "Go to https://golang.org/doc/code.html for ger started"
echo "Happy coding! (^_^)"
