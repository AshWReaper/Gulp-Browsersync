#!/bin/bash

## get project name from user
read -p "What should this project be called?" PROJECT_NAME;

## check node version
NODE_VERSION=`node --version npm --version npx --version`;
echo "Node version: " $NODE_VERSION;

## Install the gulp command line utility (requires sudo)
echo "Installing Gulp CLI";
sudo npm install --global gulp-cli;

## Install Browsersync (requires sudo)
echo "Installing Browsersync"
sudo npm install browser-sync gulp --save-dev;

## Create a project directory and navigate into it
echo "Creating a project directory";
npx mkdirp $PROJECT_NAME && cd $PROJECT_NAME;

## create dev/production directories
echo "Creating dev directory";
mkdir dev;
echo "Creating production directory";
mkdir production;

## create index.php file in dev directory
echo '<?php echo "<h1>Hello, World!</h1>"; ?>' >> dev/index.php;

## Create a package.json file in your project directory
echo "Creating packacge.json file";
npm init;

## Install the gulp package in your devDependencies
echo "installing gulp package dependencies";
npm install --save-dev gulp;

## Verify your gulp versions
echo "Verifying Fulp versions";
GULP_VERSION=`gulp --version`;
echo "Gulp version: " $GULP_VERSION

## For PHP: add gulp-connect-php as a development dependency
echo "Installing gulp-coonnect-php dependency";
npm install --save-dev gulp-connect-php;

## Create a gulpfile
echo "copy the code from here: https://github.com/AshWReaper/Gulp-Browsersync/blob/main/gulpfile.js" >> gulpfile.js;
echo "A gulpfile.js file was created; Replace the text inside with code from: https://github.com/AshWReaper/Gulp-Browsersync/blob/main/gulpfile.js";

## Prompt to exit
read -p "Press enter to exit this program and start Gulp";

gulp start;
