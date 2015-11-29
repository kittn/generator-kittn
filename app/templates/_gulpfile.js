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
    stylish      = require('jshint-stylish'),
    strip        = require('gulp-strip-banner'),
    pngquant     = require('imagemin-pngquant'),
    assets       = require('postcss-assets'),
    postcssSVG   = require('postcss-svg'),
    prefix       = require('autoprefixer'),
    styleguide   = require('sc5-styleguide'),
    sassdoc      = require('sassdoc');

    // Define the Template Files
var templateFiles, globalJSMinify, globalCSSMinify, globalImageMinify;

if(kittn.template.compiler) {<% if ( projectstructure == 'Twig Template' ) { %>
  templateFiles = kittn.src.template + '**/*.twig';<% } else if ( projectstructure == 'Jade Template' ) { %>
  templateFiles = kittn.src.template + '**/*.jade';<% } %>
} else {
  templateFiles = kittn.src.structure + '**/**';
}

// Global Minifier - will be activated on the Publish Task. Only active when the regular minfier is deactivated
if(kittn.minify.automatic.jsFiles == false && kittn.minify.automatic.jsCombine == false && kittn.minify.automatic.jsCopy == false && kittn.minify.automatic.jsModernizr == false && kittn.minify.automatic.jsConditionizr == false) {
  globalJSMinify = true;
} else {
  globalJSMinify = false;
}

if(kittn.minify.automatic.jsFiles == false) {
  globalCSSMinify = true;
} else {
  globalCSSMinify = false;
}

if(kittn.minify.automatic.vector == false && kittn.minify.automatic.bitmaps == false && kittn.minify.automatic.vectorSprite == false && kittn.minify.automatic.bitmapSprite == false) {
  globalImageMinify = true;
} else {
  globalImageMinify = false;
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
    bsServer = { baseDir : kittn.dist.browserSyncDir};
  }

  // Browser Sync
  browserSync.init([
      kittn.dist.base + '**/*.{php,html}',
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
      notify: {
        styles: [
          'padding: 10px 20px;',
          'position: fixed;',
          'font-size: 14px;',
          'font-weight: bold',
          'z-index: 9999;',
          'top: inherit',
          'border-radius: 0',
          'right: 0;',
          'bottom: 0;',
          'color: #f4f8f9;',
          'background-color: #026277;',
          'text-transform: uppercase'
        ]
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
    }),
    // Inline SVG Images
    postcssSVG({
      defaults: '[fill]:#444',
      paths: [kittn.dist.vectors]
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
      // Minify CSS
      .pipe(kittn.minify.automatic.css ? $.csso() : gutil.noop())
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
      // Minify CSS
      .pipe(kittn.minify.automatic.css ? $.csso() : gutil.noop())
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
    assetsImg: kittn.templatePath.contentimage,
    assetsJs: kittn.templatePath.js,
    assetsCssImg: kittn.templatePath.cssimage
  };

  // Twig Compiler
  if(kittn.template.compiler) {<% if ( projectstructure == 'Twig Template' ) { %>
    // TWIG
    return gulp.src(kittn.src.template + '*.twig')
      .pipe($.changed(kittn.dist.markup, {extension: '.html'}))
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
    gulp.src(kittn.src.structure + '**/**')
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
    .pipe(kittn.minify.automatic.jsCombine ? $.uglify(kittn.minify.javascript.options) : gutil.noop())
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
    .pipe(kittn.minify.automatic.jsFiles ? $.uglify(kittn.minify.javascript.options) : gutil.noop())
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
      .pipe(kittn.minify.automatic.jsCopy ? $.uglify(kittn.minify.javascript.options) : gutil.noop())
      .pipe(gulp.dest(kittn.dist.js));
  });
});

/**
 * Copy Bitmaps
 * @description Move all Bitmap Images (from bitmapSingle-assets) to the .dist Folder
 */
gulp.task('copy:bitmaps', function() {
  gulp.src(kittn.src.images.bitmaps + '**/*.{png,jpeg,jpg,gif,webp}')
    .pipe($.changed(kittn.dist.bitmaps))
    .pipe(kittn.minify.automatic.bitmaps ? $.imagemin({
      optimizationLevel: kittn.minify.images.optimizationLevel,
      use: [
        pngquant(kittn.minify.images.pngquant)],
      progressive: kittn.minify.images.progressive,
      interlaced: kittn.minify.images.interlaced
    }) : gutil.noop()
  )
    .pipe(gulp.dest(kittn.dist.bitmaps));
});

/**
 * Copy SVG Images
 * @description Move all SVG Images (from vectorSingle-assets) to the .dist Folder
 */
gulp.task('copy:vectors', function() {
  gulp.src(kittn.src.images.vectors + '**/*.svg')
    .pipe($.changed(kittn.src.images.vectors))
    .pipe(kittn.minify.automatic.vector ? $.imagemin({
      svgoPlugins: kittn.minify.images.svgoPlugins
    }) : gutil.noop()
  )
    .pipe(gulp.dest(kittn.dist.vectors));
});

/**
 * Build Conditionizr
 * @description Task for Combine and Generate Conditionizr Test File
 */
gulp.task('build:conditionizr', function() {
  gulp.src(kittn.conditionizr.files)
    .pipe($.concat(kittn.conditionizr.filename))
    .pipe(kittn.minify.automatic.jsConditionizr ? $.uglify(kittn.minify.javascript.options) : gutil.noop())
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
    .pipe(kittn.minify.automatic.jsModernizr ? $.uglify(kittn.minify.javascript.options) : gutil.noop())
    .pipe(gulp.dest(kittn.dist.js));
});

/**
 * Build Bitmap Sprite
 * @description Build the Bitmap Sprite File and the SCSS Map
 */
gulp.task('build:bitmapSprite', function () {
  gulp.src(kittn.src.images.bitmapSprite.files + '**/*.png')
    .pipe($.if('*.png',
      kittn.minify.automatic.bitmapSprite ? $.imagemin({
        optimizationLevel: kittn.minify.images.optimizationLevel,
        use: [
          pngquant(kittn.minify.images.pngquant)]
      }) : gutil.noop()

    ))
    .pipe($.if('*.png',
      $.spritesmith({
        imgName: kittn.src.images.bitmapSprite.name,
        cssName: '_sprite-bitmap.scss',
        imgPath: kittn.dist.cssimgRoot + kittn.src.images.bitmapSprite.name,
        cssTemplate: kittn.src.system + 'tpl_bitmapsprite.scss'
      })
    ))
    .pipe($.if('*.png',gulp.dest(kittn.dist.cssimg),gulp.dest(kittn.src.style + 'maps/')));
});

/**
 * Build SVG Sprite File
 * @description Build an SVG Vector Sprite and a Map file
 */
gulp.task('build:vectorSprite', function() {
  gulp.src(kittn.src.images.vectorSprite.files + '**/*.svg')
    .pipe(
    kittn.minify.automatic.vectorSprite ? $.imagemin({
      svgoPlugins: kittn.minify.images.svgoPlugins
    }) : gutil.noop()

  )
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
 * SymbolCleanup
 * @description Remove FillColor from SVG Symbols
 */
gulp.task('build:symbolCleanup', function(){
  return gulp.src(kittn.dist.cssimg + kittn.src.images.vectorSprite.symbolName)
    .pipe($.cheerio({
      run: function ($) {
        $('[fill]').removeAttr('fill');
        $('[fill-rule]').removeAttr('fill-rule');
      },
      parserOptions: { xmlMode: true }
    }))
    .pipe(gulp.dest(kittn.dist.cssimg));
});

/**
 * Minfiy Images
 * @description Compress all Images in distribution
 * Inline Images (SVG, PNG, JPG, GIF)
 */
gulp.task('minify:images', function () {
  gulp.src(kittn.dist.cssimg + '/**/*')
    .pipe($.if(globalImageMinify == true,
      $.imagemin({
        optimizationLevel: kittn.minify.images.optimizationLevel,
        use: [
          pngquant(kittn.minify.images.pngquant)],
        svgoPlugins: kittn.minify.images.svgoPlugins,
        progressive: kittn.minify.images.progressive,
        interlaced: kittn.minify.images.interlaced
      })
    ))
    .pipe(gulp.dest(kittn.dist.cssimg));
});

/**
 * Minify Javascript
 * @description Compress all Javascript Files in the dist folder
 */
gulp.task('minify:js', function() {
  gulp.src([kittn.dist.js + '*.js'])
    .pipe($.if(globalJSMinify == true,
      $.uglify(kittn.minify.javascript.options)
    ))
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
    .pipe(strip())
    .pipe($.header(banner, { pkg : pkg } ))
    .pipe(gulp.dest(kittn.dist.css));
});

/**
 * Header JS
 * @description Add Header to JS Files
 */
gulp.task('header:js', function(){
  gulp.src(kittn.dist.js + '*.js')
    .pipe(strip())
    .pipe($.header(banner, { pkg : pkg } ))
    .pipe(gulp.dest(kittn.dist.js));
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
 * Build the CSS Framework Documentation
 */
gulp.task('sassdoc', function () {
  return gulp.src('src/framework/**/*.scss')
    .pipe(sassdoc());
});

/**
 * Styleguide Generate
 * @description Read out CSS File to Generate the Styleguide
 */
gulp.task('styleguide:generate', function() {
  return gulp.src(kittn.dist.css + pkg.cssFileName + '.css')
    .pipe(styleguide.generate({
      title: 'Styleguide for: '+pkg.name+' (v.'+pkg.version+')',
      server: false,
      rootPath: kittn.styleguide.rootPath,
      appRoot: kittn.styleguide.appRoot,
      overviewPath: kittn.styleguide.overviewPath,
      disableHtml5Mode: kittn.styleguide.disableHtml5Mode,
      disableEncapsulation: kittn.styleguide.disableEncapsulation,
      extraHead: kittn.styleguide.extraHead
    }))
    .pipe(styleguide.applyStyles())
    .pipe(gulp.dest(kittn.styleguide.rootPath));
});

/**
 * Styleguide Assets
 * @description Copy all Assets to Styleguide
 */
gulp.task('styleguide:assets', function(){
  // Copy Fonts
  gulp.src(kittn.dist.fonts + '**/*')
    .pipe(gulp.dest(kittn.styleguide.rootPath + '/fonts'));

  // Copy Images
  gulp
    .src(kittn.dist.cssimg + '**/*')
    .pipe(gulp.dest(kittn.styleguide.rootPath + '/assets/img'));

  // Copy JS
  gulp
    .src(kittn.dist.js + '**/*')
    .pipe(gulp.dest(kittn.styleguide.rootPath + '/assets/js'));
});

/**
 * Styleguide
 * @description Build the Styleguide
 * --guide=no will disable the Building on the Publish Task
 */
gulp.task('styleguide', function(callback) {
  // Default Build Variable
  var guide = args.guide || 'yes';

  // Overwrite Kittn CSS Minification
  kittn.minify.automatic.css = false;

  if (guide == 'yes') {
    runSequence(
      [
        'compiler:css'
      ],
      [
        'styleguide:generate',
        'styleguide:assets'
      ],
      callback);
  }
});

/**
 * Styleguide View
 * @description Use the BrowserSync Server for Display the Styleguide
 */
gulp.task('styleguide:view', function() {
  // Browser Sync
  browserSync.init([],
    { options: {
      debugInfo: true,
      watchTask: false,
      ghostMode: false
    },
      server: kittn.styleguide.rootPath,
      open: true
    });
});

// MAIN TASK BLOCK ------------------------------------------------------

/**
 * Rebuild all Images
 * Copy to distribution, build Sprites
 */
gulp.task('rebuild:images', function(callback) {
  runSequence(
    [
      'copy:bitmaps',
      'copy:vectors',
      'build:bitmapSprite',
      'build:vectorSprite'
    ],
    [
      'build:symbolCleanup'
    ],
    callback);
});

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
gulp.task('init', function(callback) {
  runSequence(
    [
      'sassdoc'
    ],
    [
      'copy:launch',
      'copy:fonts',
      'rebuild:js',
      'rebuild:images'
    ],
    [
      'compiler:css',
      'compiler:template'
    ],
    callback);
});

/**
 * Default Task - start the Watch Tasks for SASS,
 * JADE, JS and activate the Browser Watch
 */
gulp.task('watch', function() {

  // Watch the SCSS Folder for changes - compile CSS
  gulp.watch([kittn.src.style + '**/*.scss'], ['compiler:css']);

  // Watch the Structure
  gulp.watch([templateFiles], ['compiler:template']);

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
  // Temporary overwrite Minify CSS
  kittn.minify.automatic.css = false;

  runSequence(
    [
      'version:bump',
    ],
    [
      'styleguide'
    ],
    [
      'minify:css',
      'minify:js',
      'minify:images'
    ],
    [
      'header:css',
      'header:js'
    ],
    callback);
});


/**
 * Automatic Deploy
 *
 * @description: Deploy Task for an automated Build Process
 */
gulp.task('deploy', function(callback) {
  runSequence(
    'init',
    [
      'minify:js',
      'minify:images',
      'minify:css'
    ],
    callback);
});
