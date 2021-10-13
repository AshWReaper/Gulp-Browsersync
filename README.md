# Setting up Gulp + Browsersync Project

## Check for node, npm, and npx

node --version
npm --version
npx --version

## Install the gulp command line utility (requires sudo)

sudo npm install --global gulp-cli

## Install Browsersync (requires sudo)

sudo npm install browser-sync gulp --save-dev

## Create a project directory and navigate into it#

npx mkdirp my-project && cd my-project

## Create a package.json file in your project directory

npm init

## Install the gulp package in your devDependencies

npm install --save-dev gulp

## Verify your gulp versions

gulp --version

## For PHP: add gulp-connect-php as a development dependency

npm install --save-dev  gulp-connect-php

## Create a gulpfile

Create a new gulpfile.js file and copy the code from here: https://github.com/AshWReaper/Gulp-Browsersync/blob/main/gulpfile.js

# Start the project

gulp start
