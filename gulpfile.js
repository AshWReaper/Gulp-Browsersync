/**
* SET UP CONSTANTS
**/
const LOCAL_BASEURL = "https://localhost:3000/"
const { watch, series } = require('gulp'); // get watch and series from gulp
const browsersync = require('browser-sync').create(); // get browsersync
const php = require('gulp-connect-php'); // get gulp php connect 

/**
 * DEFAULT TASK
 */
function defaultTask(cb) {
    // place code for your default task here
    cb();
}

/**
 * BUILD TASK
 */
function buildTask(cb)
{
    process.stdout.write("baseURL: " + LOCAL_BASEURL + "\n");

    // call back function
    cb();
}

/**
 * CLEAN TASK
 */
function cleanTask(cb)
{
    process.stdout.write("Cleaning up...\n");

    // call back function
    cb();
}

/**
 * PHP UPDATE TASK
 */
function phpUpdateTask(cb)
{
    process.stdout.write("Handling PHP changes...\n");

    // call back function
    cb()
    {
	process.stdout.write("PHP change detected...\n");
    };
}

/**
 * WATCH FILES TASK
 */
function watchFilesTask(cb)
{
    process.stdout.write("Watching files for changes...\n");

    watch('php/*.php', phpUpdateTask).on('change', browsersync.reload);

    // call back function
    cb();
}

/**
* STATIC SERVER TASK
 **/
function browsersyncTask(cb)
{
    browsersync.init(
	{
	    proxy:"http://127.0.0.1:8000/",
            baseDir: "./php/",
            open:true,
            notify:false
	},
	phpServerTask()
	
    )
    // call back function
    cb();
}

/**
* SETUP PHP SERVER
 **/
function phpServerTask(cb)
{
    php.server(
	{
	    base: './php/',
	    port: 8000,
	    keepalive: true
	}
    );
}

exports.default = defaultTask; // gulp
exports.build = buildTask; // gulp build
exports.start = series(watchFilesTask, browsersyncTask); // gulp start
