/**
 * SET UP CONSTANTS
 **/
const LOCAL_BASEURL = "https://localhost:3000/"
const LOCALHOST_PROXY = "http://127.0.0.1:8000/"
const { watch, series } = require('gulp'); // get watch and series from gulp
const browsersync = require('browser-sync').create(); // get browsersync
const php = require('gulp-connect-php'); // get gulp php connect
const vftp = require("vinyl-ftp"); // require the vinyl-ftp plugin

const PROJECT_BASE_DIR = "/dev/";
const SERVER_BASE_DIR = "./dev/";
const SERVER_PORT = "8000";

const FTP_USER = "gottsmann";
const FTP_PASS = "uzLWtiR7KEB1s6yqMpr8";
const FTP_SERVER = "";
const FTP_PARALLEL = 1;

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
    watch('couch/*.php', phpUpdateTask).on('change', browsersync.reload);
    watch('*.php', phpUpdateTask).on('change', browsersync.reload);

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
	    proxy: LOCALHOST_PROXY,
            baseDir: PROJECT_BASE_DIR,
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
	    base: SERVER_BASE_DIR,
	    port: SERVER_PORT,
	    keepalive: true
	}
    );
}

/**
 * FTP CONNECTION
 **/
var ftpTask = function() 
{
    var conn = vftp.create(
	{
	    host: FTP_SERVER,
	    user: FTP_USER,
	    pass: FTP_PASS,
	    parallel: FTP_PARALLEL,
	    log: util.log
	}
    );
    return gulp.src(
	[PROJECT_BASE_DIR + "**"],
	{
	    base:"build",
	    dot:true
	}
    ).pipe(
	conn.newer("/")
    ).pipe(
	conn.dest("/")
    );
};

exports.default = defaultTask; // gulp
exports.build = buildTask; // gulp build
exports.start = series(watchFilesTask, browsersyncTask, ftpTask); // gulp start
