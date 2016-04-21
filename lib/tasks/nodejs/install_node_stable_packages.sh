#!/usr/bin/env bash
#
# Node.js functions

install_node_stable_packages () {
  . ~/.nvm/nvm.sh

  nvm use node

  echo "(babel-eslint)" >&3
  npm install -g babel-eslint
  echo "(bower)" >&3
  npm install -g bower
  echo "(cordova)" >&3
  npm install -g cordova
  echo "(diff-so-fancy)" >&3
  npm install -g diff-so-fancy
  echo "(eslint)" >&3
  npm install -g eslint
  echo "(grunt-cli)" >&3
  npm install -g grunt-cli
  echo "(gulp)" >&3
  npm install -g gulp
  echo "(http-server)" >&3
  npm install -g http-server
  echo "(ionic)" >&3
  npm install -g ionic
  echo "(jshint)" >&3
  npm install -g jshint
  echo "(pm2)" >&3
  npm install -g pm2
  echo "(semistandard)" >&3
  npm install -g semistandard
  echo "(semistandard-format)" >&3
  npm install -g semistandard-format

  echo "(done)" >&3
}

install_node_stable_packages