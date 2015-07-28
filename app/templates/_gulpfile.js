// Gulpfile
// ========

// Set the Task Variables
var gulp         = require('gulp'),
    gutil        = require('gulp-util'),
    pkg          = require('./package.json'), // Get Data from Package File
    kittn        = require('./config.json'), // Get the Config Data
    $            = require('gulp-load-plugins')(),
    args         = require('yargs').argv,
    browserSync  = require('browser-sync').create(),
    runSequence  = require('run-sequence'),
    path         = require('path'),
    styleguide   = require('sc5-styleguide'),
    htmlInjector = require('bs-html-injector'),
    stylish      = require('jshint-stylish'),
    pngquant     = require('imagemin-pngquant'),
    assets       = require('postcss-assets'),
    prefix       = require('autoprefixer-core');

// Define the Template Filetype
var templateFileEnding;

if(kittn.template.compiler === 'twig') {
  templateFileEnding = '**/*.twig';
} else if (kittn.template.compiler === 'jade') {
  templateFileEnding = '**/*.jade';
} else {
  templateFileEnding = '**/**';
}

/**
 * Banner
 * @description Define the Header that be integrated in the published
 * CSS and JS Files
 */
var banner = ['/**',
  ' * <%%= pkg.name %> - <%%= pkg.description %>',
  ' * @version <%%= pkg.version %>',
  ' * @link <%%= pkg.homepage %>',
  ' * @license <%%= pkg.license %>',
  ' * ----------------------------',
  ' * Based on <%= pkg.name %> v<%= pkg.version %>',
  ' * Link <%= pkg.homepage %>',
  ' * ----------------------------**/',
  ''].join('\n');

/**
 * Browser Sync
 * @description Refresh the Browser after File Change.
 */
gulp.task('browser-sync', function() {
  // Build a condition when Proxy is active
  var bsProxy, bsServer;

  // Condition for Proxy
  if(kittn.browsersync.proxy) {
    bsProxy = kittn.browsersync.proxy;
    bsServer = false;
  } else {
    bsProxy = false;
    bsServer = { baseDir : kittn.dist.base};
  }

  // Init the HTML Injector
  browserSync.use(htmlInjector, {
    files: kittn.dist.base + '**/*.html'
  });

  // Browser Sync
  browserSync.init([
      kittn.dist.base + '**/*.php',
      kittn.dist.css +'**/*.css' ,
      kittn.dist.cssimg + '**/*.{jpg,gif,png,svg}',
      kittn.dist.js + '**/*.js'],
    { options: {
      debugInfo: true,
      watchTask: true,
      proxy: bsProxy,
      ghostMode: {
        clicks : true,
        scroll : true,
        links  : true,
        forms  : true }
    },
      server: bsServer,
      open: kittn.browsersync.openbrowser
    });
});

/**
 * CSS Compiler
 */
gulp.task('compiler:css', function(){

  // Default Config for PostCSS Plugins
  var cssPostCSS = [
    // Include Assets
    assets(
      options = {
        basePath: kittn.templatePath.root,
        loadPaths: [
          kittn.dist.cssimg
        ]
      }),
    // Prefixer
    prefix({
      browsers: kittn.css.prefix,
      cascade: false
    })
  ];

  // Libsass Compiler
  if(kittn.css.compiler === 'libsass') {
    return gulp.src(kittn.src.style + '**/*.scss')
      // Activate Sourcemaps or not
      .pipe(kittn.css.sourcemap ? $.sourcemaps.init() : gutil.noop())
      // Libsass Task
      .pipe($.sass.sync()
        .on('error', $.sass.logError)
        .on('error', $.notify.onError('Sass Compile Error!')))
      // Stream to PostCSS
      .pipe($.postcss(cssPostCSS))
      // Combine Media Queries
      .pipe(kittn.css.combineMQ ? $.combineMediaQueries({ log: true }) : gutil.noop())
      // Write the SourceMap
      .pipe(kittn.css.sourcemap ? $.sourcemaps.write('.') : gutil.noop())
      .pipe(gulp.dest(kittn.dist.css));

    // Rubysass Compiler
  } else if(kittn.css.compiler === 'rubysass') {
    return $.rubySass(kittn.src.style, { sourcemap: kittn.css.sourcemap })
      .on('error', $.notify.onError('Sass Compile Error!'))
      .on('error', function (err) { console.log(err.message); })
      // Stream to PostCSS
      .pipe($.postcss(cssPostCSS))
      // Combine Media Queries
      .pipe(kittn.css.combineMQ ? $.combineMediaQueries({ log: true }) : gutil.noop())
      // Write the SourceMap
      .pipe(kittn.css.sourcemap ? $.sourcemaps.write('.') : gutil.noop())
      .pipe(gulp.dest(kittn.dist.css));
  }
});

/**
 * Template Compiler
 *
 * @description Compiles with Jade or Twig (the decision too has been taken in the packet generating), also copy only the Files.
 */
gulp.task('compiler:template', function(){

  // Set Base Locals
  var templateLocals = {
    siteTitle: pkg.name,
    cssName: pkg.cssFileName,
    assetsCss: kittn.templatePath.css,
    assetsImg: kittn.templatePath.htmlimg,
    assetsJs: kittn.templatePath.js
  };

  // Twig Compiler
  if(kittn.template.compiler) {<% if ( projectstructure == 'Twig Template' ) { %>
    // TWIG
    return gulp.src(kittn.src.template + '*.twig')
      .pipe($.plumber())
      .pipe($.twig({ data: templateLocals }))
      .on('error', $.notify.onError(function (error) {
        return 'Twig Compile Error!!';
      }))
      .on('error', function(err) {
        console.log(err.message);
      })
      .pipe($.prettify({
        'indent_size': 2
      }))
      .pipe(gulp.dest(kittn.dist.markup));<% } else if ( projectstructure == 'Jade Template' ) { %>
    // JADE
    gulp.src([kittn.src.template + '*.jade',kittn.src.template + '_*.jade'])
      .pipe($.plumber())
      .pipe($.jadeFindAffected())
      .pipe($.jade({
        pretty: true,
        locals: templateLocals
      }))
      .on('error', $.notify.onError(function (error) {
        return 'JADE Compile Error!!';
      }))
      .on('error', function(err) {
        console.log(err);
      })
      .pipe($.prettify({
        'indent_size': 2
      }))
      .pipe(gulp.dest(kittn.dist.markup));<% } %>

  // Simple Copy Files
  } else {
    gulp.src(kittn.src.template + '**/**')
      .pipe($.changed(kittn.dist.markup))
      .pipe(gulp.dest(kittn.dist.markup));
  }
});

/**
 * Combine JS
 * @description Combine Scripts from Browser to script.js
 */
gulp.task('combine:js', function() {
  gulp.src(kittn.files.jsCombine)
    .pipe($.concat(kittn.files.jsCombineFilename))
    .pipe(gulp.dest(kittn.dist.js));
});

/**
 * Compile JS
 * @description Watch the JS Files in the Single JS Directory
 * Use JSHint to display Error and copy it to the Distribution Folder
 */
// Check written JS and move it into tmp
gulp.task('compiler:js', function() {
  gulp.src([kittn.src.js + '*.js','!'+kittn.src.js+'_*.js'])
    .pipe($.changed(kittn.dist.js, { extension: '.js' }))
    .pipe($.plumber())
    .pipe($.include())
    .pipe($.jshint())
    .pipe($.jshint.reporter(stylish))
    .pipe(gulp.dest(kittn.dist.js));
});

/**
 * Copy Launch Files
 * @description Copy the Default Build Files to distribution
 */
gulp.task('copy:launch', function () {
  kittn.files.launch.forEach(function(item) {
    gulp.src(kittn.src.system + item.src)
      .pipe(gulp.dest(kittn.dist.base + item.dest));
  });
});

/**
 * Copy Fonts
 * @description Copy the Font Fils to distribution
 */
gulp.task('copy:fonts', function () {
  kittn.files.fonts.forEach(function(item) {
    gulp.src(item)
      .pipe($.changed(kittn.dist.fonts))
      .pipe(gulp.dest(kittn.dist.fonts));
  });
});

/**
 * Copy JS
 * @description Copy Bower Files to 'dist/'. Use the JSON Array in the config.json [files:jsCopy]]
 */
gulp.task('copy:js', function () {
  kittn.files.jsCopy.forEach(function(item) {
    gulp.src(item)
      .pipe($.changed(kittn.dist.js))
      .pipe(gulp.dest(kittn.dist.js));
  });
});

/**
 * Copy Bitmaps
 * @description Move all Bitmap Images (from bitmapSingle-assets) to the .dist Folder
 */
gulp.task('copy:bitmaps', function() {
  gulp.src(kittn.src.images.bitmaps + '**/*.{png,jpeg,jpg,gif,webp}')
    .pipe(gulp.dest(kittn.dist.bitmaps));
});

/**
 * Copy SVG Images
 * @description Move all SVG Images (from vectorSingle-assets) to the .dist Folder
 */
gulp.task('copy:vectors', function() {
  gulp.src(kittn.src.images.vectors + '**/*.svg')
    .pipe(gulp.dest(kittn.dist.vectors));
});

/**
 * Build Conditionizr
 * @description Task for Combine and Generate Conditionizr Test File
 */
gulp.task('build:conditionizr', function() {
  gulp.src(kittn.conditionizr.files)
    .pipe($.concat(kittn.conditionizr.filename))
    .pipe(gulp.dest(kittn.dist.js));
});

/**
 * Build Modernizr
 * @description Build a customized Modernizr File
 */
gulp.task('build:modernizr', function() {
  gulp.src('node_modules/gulp-modernizr/build/modernizr-custom.js')
    .pipe($.modernizr({
      crawl: false,
      options : kittn.modernizr.options,
      tests: kittn.modernizr.tests
    }))
    .pipe(gulp.dest(kittn.dist.js));
});

/**
 * Build Bitmap Sprite
 * @description Build the Bitmap Sprite File and the SCSS Map
 */
gulp.task('build:bitmapSprite', function () {
  gulp.src(kittn.src.images.bitmapSprite.files + '**/*.png')
    .pipe($.if('*.png',
      $.spritesmith({
        imgName: kittn.src.images.bitmapSprite.name,
        cssName: '_sprite-bitmap.scss',
        imgPath: kittn.dist.cssimgRoot + kittn.src.images.bitmapSprite.name,
        cssTemplate: kittn.src.system + 'tpl_bitmapsprite.scss'
      })
    ))
    .pipe($.if('*.png',gulp.dest(kittn.dist.cssimg),gulp.dest(kittn.src.style + 'maps/')))
});

/**
 * Build SVG Sprite File
 * @description Build an SVG Vector Sprite and a Map file
 */
gulp.task('build:vectorSprite', function() {
  gulp.src(kittn.src.images.vectorSprite.files + '**/*.svg')
    .pipe($.svgSprite(
      config = {
        shape: {
          dimension : {  // Set maximum dimensions
            maxWidth : kittn.src.images.vectorSprite.maxWidth,
            maxHeight : kittn.src.images.vectorSprite.maxHeight
          },
          spacing : { // Add padding
            padding : kittn.src.images.vectorSprite.padding
          },
          dest : kittn.dist.vectors
        },
        mode: {
          view: {  // Activate the «view» mode
            sprite: kittn.dist.cssimg + kittn.src.images.vectorSprite.name,
            dest: '.',
            bust : false,
            prefix: '%%svg',
            render : {
              scss : {
                template: kittn.src.system + 'tpl_svgsprite.scss',
                dest: kittn.src.style +'maps/_sprite-svg.scss'
              }
            }
          },
          symbol : {
            sprite: kittn.src.images.vectorSprite.symbolName,
            dest: kittn.dist.cssimg
          }
        }
      }
    ))
    .pipe(gulp.dest('./'));
});

/**
 * Minfiy Images
 * @description Compress all Images in distribution
 * Inline Images (SVG, PNG, JPG, GIF)
 */
gulp.task('minify:images', function () {
  gulp.src(kittn.dist.cssimg + '/**/*')
    .pipe($.imagemin({
      optimizationLevel: kittn.minify.images.optimizationLevel,
      use: [
        pngquant(kittn.minify.images.pngquant)],
      svgoPlugins: [kittn.minify.images.svgoPlugins],
      progressive: kittn.minify.images.progressive,
      interlaced: kittn.minify.images.interlaced
    }))
    .pipe(gulp.dest(kittn.dist.cssimg));
});

/**
 * Minify Javascript
 * @description Compress all Javascript Files in the dist folder
 */
gulp.task('minify:js', function() {
  gulp.src([kittn.dist.js + '*.js'])
    .pipe($.uglify(kittn.minify.javascript.options))
    .pipe($.header(banner, { pkg : pkg } ))
    .pipe(gulp.dest(kittn.dist.js));
});

/**
 * Minify CSS Files
 * @description Compress CSS Files in distribution
 */
gulp.task('minify:css', function() {
  return gulp.src(kittn.dist.css + '*.css')
    .pipe($.csso())
    .pipe(gulp.dest(kittn.dist.css));
});

/**
 * Javascript Code Quality
 * @description Check the JS Code Quality
 */
gulp.task('codequality:js', function() {
  gulp.src([kittn.dist.js + '*.js'])
    .pipe($.jshint())
    .pipe($.jshint.reporter(stylish));
});

/**
 * Header CSS
 * @description Add Header to the CSS Files
 */
gulp.task('header:css', function(){
  gulp.src(kittn.dist.css + '*.css')
    .pipe($.header(banner, { pkg : pkg } ))
    .pipe(gulp.dest(kittn.dist.css));
});

/**
 * Bump
 * @description Bump the version property within `bower.json` and `package.json`.
 * --type=pre will bump the prerelease version *.*.*-x
 * --type=patch or no flag will bump the patch version *.*.x
 * --type=minor will bump the minor version *.x.*
 * --type=major will bump the major version x.*.*
 * --version=1.2.3 will bump to a specific version and ignore other flags
 */
gulp.task('version:bump', function(){
  var type = args.type || 'patch';
  var version = args.version;
  var options = {};

  if (version) {
    options.version = version;

  } else {
    options.type = type;
  }

  return gulp.src(['./bower.json', './package.json'])
  .pipe($.bump(options))
  .pipe(gulp.dest('./'));
});

/**
 * Styleguide
 * @description Build the Styleguide
 * --guide=no will disable the Building on the Publish Task
 */
gulp.task('styleguide', function() {
  var guide = args.guide || 'yes';

  if (guide == 'yes') {
    return gulp.src(kittn.dist.css + pkg.cssFileName + '.css')
      .pipe(styleguide.generate({
          title: 'Styleguide for: '+pkg.name+' (v.'+pkg.version+')',
          server: false,
          rootPath: 'styleguide/',
          appRoot: '../styleguide',
          overviewPath: 'readme.md'
        }))
      .pipe(styleguide.applyStyles())
      .pipe(gulp.dest('styleguide/'));
  }
});


// MAIN TASK BLOCK ------------------------------------------------------

/**
 * Rebuild all Images
 * Copy to distribution, build Sprites
 */
gulp.task('rebuild:images', [
  'copy:bitmaps',
  'copy:vectors',
  'build:bitmapSprite',
  'build:vectorSprite'
]);

/**
 * Rebuild all JS Files
 * Copy to distribution
 */
gulp.task('rebuild:js', [
  'build:modernizr',
  'copy:js',
  'compiler:js',
  'combine:js',
  'build:conditionizr'
]);

/**
 * Starting Task for the first Build off the Project Structure
 */
gulp.task('init',[
  'copy:launch',
  'copy:fonts',
  'rebuild:js',
  'rebuild:images',
  'compiler:css',
  'compiler:template'
]);

/**
 * Default Task - start the Watch Tasks for SASS,
 * JADE, JS and activate the Browser Watch
 */
gulp.task('watch', function() {

  // Watch the SCSS Folder for changes - compile CSS
  gulp.watch([kittn.src.style + '**/*.scss'], ['compiler:css']);

  // Watch the Structure
   gulp.watch([kittn.src.template + templateFileEnding], ['compiler:template']);

  // Watch the JS SRC Folder for Changes - Lint JS and copy it to tmp
  gulp.watch(kittn.src.js + '**/*.js', ['compiler:js']);

});

/**
 * Default gulp Task 'gulp'
 * watch the working dirs - activates the compilers and refresh the browser
 */
gulp.task('default', ['browser-sync', 'watch']);

//----------------- PUBLISHING --------------------------

/**
 * Publish
 * @description Publish all Files in distribution
 * Add a new Versionnumber to Package and Bower
 * Compress Files
 */
gulp.task('publish', function(callback) {
  runSequence(
    'version:bump',
    [
      'compiler:css',
    ],
    [
      'header:css'
    ],
    [
      'styleguide',
      'codequality:js'
    ],
    callback);
});

/**
 * Manual Deploy
 *
 * @description: Deploy Task for an manual build
 * e.g. manual FTP Upload or simple Deploy
 */
gulp.task('deploy:manual', function(callback) {
  runSequence(
    'publish',
    [
      'minify:js',
      'minify:images',
      'minify:css'
    ],
    callback);
});

/**
 * Automatic Deploy
 *
 * @description: Deploy Task for an automated Build Process
 */
gulp.task('deploy:auto', [
  'minify:js',
  'minify:images',
  'minify:css'
]);
