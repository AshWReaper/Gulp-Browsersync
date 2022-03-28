#!/bin/bash

##################################
## CREATE DIRECTORIES AND FILES ##
##################################

## get project name from user
read -p "What should this project be called? " PROJECT_NAME;

## Create a project directory and navigate into it
echo "Creating a project directory";
npx mkdirp $PROJECT_NAME && cd $PROJECT_NAME;

## create dev/production directories
echo "Creating dev directorys";
mkdir dev;
mkdir dev/inc;
mkdir dev/inc/php;
mkdir dev/inc/css;
mkdir dev/inc/js;
echo "Creating production directorys";
mkdir production;
mkdir production/inc;
mkdir production/inc/php;
mkdir production/inc/css;
mkdir production/inc/js;

## create index.php file in dev directory
echo '<head></head>' > dev/index.php;
echo '<body>' >> dev/index.php;
echo '<?php echo "<h1>Hello, World!</h1>"; ?>' >> dev/index.php;
echo '</body>' >> dev/index.php;

## create css file
echo '/*styles go here*/' >> dev/inc/css/styles.css;

## create js file
echo '// scripts go here' >> dev/inc/js/scripts.css;

## Create a package.json file in your project (DEV) directory
echo "Init NPM & Creating packacge.json file";
cd dev;
npm init;

#############################
## CHECK SOFTWARE VERSIONS ##
#############################

## check node version
NODE_VERSION=`node --version`;
echo "Node version: " $NODE_VERSION;

## check npm version
NPM_VERSION=`npm --version`;

## check NPX version:
NPM_VERSION=`npx --version`;
echo "NPX version: " $NPX_VERSION;

###############################
## INSTALL SOFTWARE PACKAGES ##
###############################

## Install the gulp command line utility (requires sudo)
echo "Installing Gulp CLI";
sudo npm install --global gulp-cli;

## Install Browsersync (requires sudo)
echo "Installing Browsersync"
sudo npm install browser-sync gulp --save-dev;

## Install the gulp package in your devDependencies
echo "installing gulp package dependencies";
sudo npm install --save-dev gulp;

## Verify your gulp versions
echo "Verifying Fulp versions";
GULP_VERSION=`gulp --version`;
echo "Gulp version: " $GULP_VERSION

## For PHP: add gulp-connect-php as a development dependency
echo "Installing gulp-coonnect-php dependency";
sudo npm install --save-dev gulp-connect-php;

## For FTP: install the vinyl-ftp plugin using NPM
echo "Installing vinyl-ftp plugin";
sudo npm install --save-dev vinyl-ftp;

######################
## CREATE GULP FILE ##
######################
cd..;
## Create a gulpfile
echo "copy the code from here: https://github.com/AshWReaper/Gulp-Browsersync/blob/main/gulpfile.js" >> gulpfile.js;
echo "A gulpfile.js file was created; Replace the text inside with code from: https://github.com/AshWReaper/Gulp-Browsersync/blob/main/gulpfile.js";

################################################
## PROMPT & EXIT PROGRAM (START GULP ON EXIT) ##
################################################

## Prompt to exit
read -p "Once you've copied the contents of the gulp file then press enter to exit this program and start Gulp";

gulp start;
