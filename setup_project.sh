#!/bin/bash

##################################
## CREATE DIRECTORIES AND FILES ##
##################################

## get project name from user
read -p "What should this project be called? " PROJECT_NAME;

## check to see if Materialize CSS is needed
read -p "Would you like to use the Materialize CSS library? (y/n)" MATERIALIZE_CSS_LIBRARY;

## check to see if Bootstrap is needed
if [ $MATERIALIZE_CSS_LIBRARY = "n" ]; then
    read -p "Would you like to use the Bootstrap library? (y/n)" BOOTSTRAP_LIBRARY;
fi

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

######################
# Create Asset Files #
######################

## create header.php file
echo '<head>' > dev/inc/php/header.php;
if [ $MATERIALIZE_CSS_LIBRARY = 'y' ]; then
    echo '<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">' >> dev/inc/php/header.php;
fi
if [ $BOOTSTRAP_LIBRARY = 'y' ]; then
    echo '<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">' >> dev/inc/php/header.php;
fi
echo '<link rel="stylesheet" href="./inc/css/styles.css" />' >> dev/inc/php/header.php;
echo '</head>' >> dev/inc/php/header.php;
echo '<body>' >> dev/inc/php/header.php;

## create footer.php file
echo '<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>' > dev/inc/php/footer.php;
if [ $MATERIALIZE_CSS_LIBRARY = 'y' ]; then
    echo '<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>' >> dev/inc/php/footer.php;
fi
if [ $BOOTSTRAP_LIBRARY = 'y' ]; then
    echo '<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>' >> dev/inc/php/footer.php;
fi
echo '<script type="text/javascript" src="./inc/js/scripts.js"></script>' >> dev/inc/php/footer.php;
echo '</body>' >> dev/inc/php/footer.php;

## create css file
echo '/*styles go here*/' > dev/inc/css/styles.css;

## create js file
echo '// scripts go here' > dev/inc/js/scripts.js;

################
# Create Pages #
################

## create index.php file
echo '<?php echo "<h1>PHP is working</h1>"; ?>' >> dev/index.php;
echo '<h1>HTML looks okay too...</h1>' >> dev/index.php;

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
