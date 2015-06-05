// Gulpfile
// ========

/**
 * CSS Compiler
 *
 * :sass    = ruby-sass
 * :libsass = libsass
 */
var cssCompiler = 'libsass';

/**
 * Use Jade Compiler
 */
var useJade = <% if (projectjade == true ) { %>true;<% } else { %>false<% } %>;

/**
 * Combine CSS Media Queries
 */
var combineMQ = false;

/**
 * Build CSS SourceMaps
 */
var cssSourceMap = true;

/**
 * Autoprefix Browser Config
 */
var prefixConfig = [
  "last 2 version",
  "> 1%",<% if (projectjade == true ) { %>
  "ie 8",<% } else { %>
  "ie 9",<% } %>
  "chrome 30",
  "firefox 24"
]

/**
 * Modernizr Tests
 * @description Add all Modernizr Test that you need
 */
var modernizrTests = [
    'cssanimations',
    'csstransforms',
    'csstransforms3d',
    'csstransitions',
    'backgroundblendmode',
    'bgsizecover',
    'preserve3d',
    'flexbox',
    'touch',
    'svg',
    'inlinesvg',
    'respond',
    'hsla',
    'rgba',
    'webgl'
]

/**
 * Browser Sync can open your Browser
 */
var browserSyncOpen = true;

/**
 * Browser Sync Proxy
 * @description When your Project use a Vhost Domain, enter
 * the domain. This will deactivate the BrowserSync Server
 */
var browserSyncProxy = false;

/**
 * Sources
 * @description Setup what for JS Files you want to only copy
 * it into dist/, * and what for js files need to combined
 * into scripts.js.
 */
var sources = {
  // Copy Single JS Files not combined
  copyjs: [<% if (projectiecompatible == true ) { %>
    {src:'src/stash/bower/selectivizr/selectivizr.js'},<% } %>
    {src:''}
  ],

  // Copy and Combine JS Files
  combinejs: [<% if (projectjquery == true ) { %>
    'src/stash/bower/jquery/dist/jquery.js',<% } else { %>
    'src/stash/bower/jquery/jquery.js'<% } %>
  ],

  conditionizr: [ // Conditionizr and the Testfiles
    'src/stash/bower/conditionizr/dist/conditionizr.js',
    // Testfiles --------------------
    'src/stash/bower/conditionizr/detects/chrome.js',
    'src/stash/bower/conditionizr/detects/safari.js',
    'src/stash/bower/conditionizr/detects/firefox.js',
    'src/stash/bower/conditionizr/detects/ie11.js',
    'src/stash/bower/conditionizr/detects/ie10.js',
    'src/stash/bower/conditionizr/detects/ie9.js',<% if (projectiecompatible == true ) { %>
    'src/stash/bower/conditionizr/detects/ie8.js',<% } else { %>
    // 'src/stash/bower/conditionizr/detects/ie8.js',<% } %>
    // 'src/stash/bower/conditionizr/detects/mac.js',
    // 'src/stash/bower/conditionizr/detects/windows.js',
    // 'src/stash/bower/conditionizr/detects/linux.js',
    // 'src/stash/bower/conditionizr/detects/localhost.js'
  ]
};

/**
 * Font Files
 * @description Place any font files into src/stash/fonts/ -
 * Task must manually activated with $ gulp move-fonts
 * the files would be copied to the dist directory
 */
var fonts = {
  files: [
    {src: ''}
  ]
};

// DO NOT MODIFY BELOW THIS LINE ! ===============================================

// Set the Task Variables
var gulp             = require('gulp'),
    sass             = require('gulp-ruby-sass'),
    jade             = require('gulp-jade'),
    libsass          = require('gulp-sass'),
    csso             = require('gulp-csso'),
    gutil            = require('gulp-util'),
    path             = require('path'),
    prettify         = require('gulp-prettify'),
    sourcemaps       = require('gulp-sourcemaps'),
    browserSync      = require('browser-sync').create(),
    htmlInjector     = require('bs-html-injector'),
    concat           = require('gulp-concat'),
    uglify           = require('gulp-uglify'),
    imagemin         = require('gulp-imagemin'),
    plumber          = require('gulp-plumber'),
    gulpif           = require('gulp-if'),
    header           = require('gulp-header'),
    notify           = require('gulp-notify'),
    jshint           = require('gulp-jshint'),
    stylish          = require('jshint-stylish'),
    bump             = require('gulp-bump'),
    changed          = require('gulp-changed'),
    sequence         = require('run-sequence'),
    modernizr        = require('gulp-modernizr'),
    cmq              = require('gulp-combine-media-queries'),
    svgSprite        = require('gulp-svg-sprite'),
    spritesmith      = require('gulp.spritesmith'),
    pngquant         = require('imagemin-pngquant'),
    args             = require('yargs').argv,
    styleguide       = require('sc5-styleguide'),

    // Post CSS
    postcss     = require('gulp-postcss'),
      assets        = require('postcss-assets'),
      prefix        = require('autoprefixer-core');

// Get Data from Package File
var pkg = require('./package.json');
var config = {
  gitURL: pkg.repository.url,
  gitBranch: 'master',
  gitVersion: pkg.version
};

// Directory Routing
var targetDirBase    = pkg.directory.base;
var targetDirCSS     = pkg.directory.base+pkg.directory.css;
var targetDirJS      = pkg.directory.base+pkg.directory.js;
var targetDirMarkup  = pkg.directory.base+pkg.directory.markup;
var targetDirCSSImg  = pkg.directory.base+pkg.directory.cssimg;
var targetDirHTMLImg = pkg.directory.base+pkg.directory.htmlimg;
var targetDirFonts   = pkg.directory.base+pkg.directory.fonts;
var CSSImgOnly       = pkg.directory.cssimg;
var projectName      = pkg.name;
var cssFileName      = pkg.cssFileName;

/**
 * Banner
 * @description Define the Header that be integrated in the published
 * CSS and JS Files
 */
var banner = ['/**',
  ' * <%%= pkg.name %> - <%%= pkg.description %>',
  ' * @version <%= pkg.version %>',
  ' * @link <%%= pkg.homepage %>',
  ' * @license <%%= pkg.license %>',
  ' * ----------------------------',
  ' * Based on <%= pkg.name %> v<%= pkg.version %>',
  ' * Link <%= pkg.homepage %>',
  ' * ----------------------------**/',
  ''].join('\n');

/**
 * Build
 * @description Define the Base Static Files and the Target
 */
var build = {
  files: [
    {src:'src/stash/.system/.htaccess'  , dest: ''},
    {src:'src/stash/.system/404.html'   , dest: ''},
    {src:'src/stash/.system/robots.txt' , dest: ''},
    {src:'src/stash/.system/favicon.png', dest: 'assets/img/system/'},
    {src:'src/stash/.system/spinner.gif', dest: 'assets/img/system/'}
  ]
};

// --- Task Config --------------

/**
 * LibSass Compiler
 * @description This task use the faster Libsass Compiler.
 */
gulp.task('libsass', function () {
  gulp.src('src/sass/**/*.scss')
    .pipe(cssSourceMap ? sourcemaps.init() : gutil.noop())
    .pipe(libsass.sync()
      .on('error', libsass.logError)
      .on("error", notify.onError("Sass Compile Error!"))
    )
    .pipe(postcss([
      assets( // Include Assets
        options = {
          basePath: targetDirBase,
          loadPaths: [
            CSSImgOnly
          ]
      }),
      prefix( // Prefixer
        {
          browsers: prefixConfig,
          cascade: false
        }
      ),
    ]))
    .pipe(combineMQ ? cmq({ // Combine Media Queries
      log: true
    }) : gutil.noop())
    .pipe(cssSourceMap ? sourcemaps.write('.') : gutil.noop())
    .pipe(gulp.dest(targetDirCSS));
});

/**
 * Ruby-Sass Compiler
 * @description On Compile Issues with Libsass switch to this Compiler.
 * Is the native Ruby Sass Compiler.
 */
gulp.task('ruby-sass', function () {
  return sass('src/sass/', { sourcemap: cssSourceMap })
  .on("error", notify.onError("Sass Compile Error!"))
  .on('error', function (err) { console.log(err.message); })
  .pipe(postcss([
    assets( // Include Assets
      options = {
        basePath: targetDirBase,
        loadPaths: [
          CSSImgOnly
        ]
    }),
    prefix( // Prefixer
      {
        browsers: prefixConfig,
        cascade: false
      }
    ),
  ]))
  .pipe(combineMQ ? cmq({ // Combine Media Queries
    log: true
  }) : gutil.noop())
  .pipe(cssSourceMap ? sourcemaps.write('.') : gutil.noop())
  .pipe(gulp.dest(targetDirCSS));
});

/**
 * Jade
 * @description Compile Jade to HTML. Used allways for Init to generate a HTML File.
 */
gulp.task('jade', function(){
  gulp.src(['src/jade/*.jade','!src/jade/_*.jade'])
    .pipe(changed(targetDirMarkup, { extension: '.html' }))
    .pipe(plumber())
    .pipe(jade({
        pretty: true,
        locals: {
          siteTitle: pkg.name,
          assetsCss: pkg.directory.css,
          assetsCssImg: pkg.directory.cssimg,
          assetsJs: pkg.directory.js,
          assetsImg: pkg.directory.htmlimg,
          cssName: cssFileName
        }
      }))
    .on("error", notify.onError(function (error) {
      return "JADE Compile Error!!";
    }))
    .on('error', function(err) {
      console.log(err);
    })
    .pipe(prettify({
      'indent_size': 2
    }))
    .pipe(gulp.dest(targetDirMarkup));
});

/**
 * Build-Js
 * @description Watch the JS Files in the Single JS Directory
 * Use JSHint to display Error and copy it to the Distribution Folder
 */
// Check written JS and move it into tmp
gulp.task('build-js', function() {
  gulp.src(['src/js/*.js','!src/js/_*.js'])
    .pipe(changed(targetDirJS, { extension: '.js' }))
    .pipe(plumber())
    .pipe(jshint())
    .pipe(jshint.reporter(stylish))
    .pipe(gulp.dest(targetDirJS));
});

// Browser Sync Task

/**
 * Browser Sync
 * @description Refresh the Browser on File Change. Insert HTML and CSS
 */
gulp.task('browser-sync', function() {
  browserSync.use(htmlInjector, {
    files: targetDirBase+'*.html'
  });

  if(browserSyncProxy) {
    browserSync.init([
      targetDirCSS +'**/*.css',
      // targetDirBase + '**/*.{html,php}',
      targetDirCSSImg + '**/*.{jpg,gif,png,svg}',
      targetDirJS + '**/*.js'],
    { options: {
        debugInfo: true,
        watchTask: true,
        proxy: ''+browserSyncProxy+'',
        ghostMode: {
          clicks : true,
          scroll : true,
          links  : true,
          forms  : true }
      },
      open: browserSyncOpen
    });

  } else {
    browserSync.init([
      targetDirCSS +'**/*.css',
      // targetDirBase + '**/*.{html,php}',
      targetDirCSSImg + '**/*.{jpg,gif,png,svg}',
      targetDirJS + '**/*.js'],
    { options: {
        debugInfo: true,
        watchTask: true,
        ghostMode: {
          clicks : true,
          scroll : true,
          links  : true,
          forms  : true }
      },
      server: {
        baseDir  : targetDirBase
      },
      open: browserSyncOpen
    });
  }

});

/**
 * Jade Rebuild
 * @description Rebuild all Jade Files. The normal Jade Task rebuild only the working File
 * otherwise is to much Reload on the default Gulp task. When you need to rebuild the other
 * Changes use this Task.
 */
gulp.task('rebuild-jade', function(){
  gulp.src(['src/jade/*.jade','!src/jade/_*.jade'])
    .pipe(plumber())
    .pipe(jade({
        pretty: true,
        locals: {
          siteTitle: pkg.name,
          assetsCss: pkg.directory.css,
          assetsCssImg: pkg.directory.cssimg,
          assetsJs: pkg.directory.js,
          assetsImg: pkg.directory.htmlimg,
          cssName: cssFileName
        }
      }))
    .on("error", notify.onError(function (error) {
      return "JADE Compile Error!!";
    }))
    .on('error', function(err) {
      console.log(err);
    })
    .pipe(prettify({
      'indent_size': 2
    }))
    .pipe(gulp.dest(targetDirMarkup))
    .pipe(notify({message: 'Jade Files rebuilded'}));
});

/**
 * Build Bitmap Sprite
 * @description Build the Bitmap Sprite File and the SCSS Map
 */
gulp.task('build-bitmap-sprite', function () {
  gulp.src('src/stash/images/sprite-assets/**/*.png')
    .pipe(gulpif('*.png',
      spritesmith({
        imgName: 'sprite.png',
        cssName: '_sprite-bitmap.scss',
        imgPath: '/'+CSSImgOnly+'sprite.png',
        cssTemplate: 'src/stash/.system/tpl_bitmapsprite.scss'
      })
    ))
    .pipe(gulpif('*.png',gulp.dest(targetDirCSSImg),gulp.dest('src/sass/maps/')))
 });


/**
 * Build SVG Sprite File
 * @description Build an SVG Vector Sprite and a Map file
 */
gulp.task('build-svg-sprite', function() {
  gulp.src('src/stash/images/svg-assets/**/*.svg')
    .pipe(svgSprite(
      config = {
        shape: {
          dimension : {  // Set maximum dimensions
            maxWidth : 30,
            maxHeight : 30
          },
          spacing : { // Add padding
            padding : 0
          },
          dest : CSSImgOnly+'svgfiles/'
        },
        mode: {
          view: {  // Activate the «view» mode
            sprite: CSSImgOnly+'vector-sprite.svg',
            dest: '.',
            bust : false,
            prefix: '%%svg',
            render : {
              scss : {
                template: 'src/stash/.system/tpl_svgsprite.scss',
                dest: '../src/sass/maps/_sprite-svg.scss'
              }
            }
          },
          symbol : {
            sprite: 'symbol-sprite.svg',
            dest: CSSImgOnly
          }
        }
      }
    ))
    .pipe(gulp.dest('dist/'));
});

// --- Copy Tasks --------------

/**
 * Move JS
 * @description Copy Bower Files to 'dist/assets/javascripts/'.
 * Its a temporaly directory, the final JS files comes
 * later in the 'js' directory
 */
gulp.task('move-js', function () {
  sources.copyjs.forEach(function(item) {
    gulp.src(item.src)
      .pipe(gulp.dest(targetDirJS));
  });
});

/**
 * Move First
 * @description Copy the Default Build Files to distribution
 */
gulp.task('move-first', function () {
  build.files.forEach(function(item) {
    gulp.src(item.src)
      .pipe(gulp.dest(targetDirBase + item.dest));
  });
});

/**
 * Move Fonts
 * @description Copy the Font Fils to distribution
 */
gulp.task('move-fonts', function () {
  fonts.files.forEach(function(item) {
    gulp.src(item.src)
      .pipe(gulp.dest(targetDirFonts));
  });
});

/**
 * Move Bitmaps
 * @description Move all Bitmap Images (from bitmap-assets) to the .dist Folder
 */
gulp.task('move-bitmaps', function() {
  gulp.src('src/stash/images/bitmaps-assets/**/*.{png,jpeg,jpg,gif,webp}')
    .pipe(gulp.dest(targetDirCSSImg+'bitmaps/'))
});

/**
 * Move SVG Images
 * @description Move all SVG Images (from /svgsingle) to the .dist Folder
 */
gulp.task('move-svg', function() {
  gulp.src('src/stash/images/svgsingle/**/*.svg')
    .pipe(gulp.dest(targetDirCSSImg+'svgfiles/'))
});

/**
 * Move Image Files
 * @description Combine Move-Bitmaps and Move SVG
 */
gulp.task('move-images', [
  'move-svg',
  'move-bitmaps'
]);

/**
 * Combine Javascript
 * @description Combine Scripts from Browser to script.js
 */
gulp.task('combine-js', function() {
  gulp.src(sources.combinejs)
    .pipe(concat('scripts.js'))
    .pipe(gulp.dest(targetDirJS));
});

/**
 * Modernizr
 * @description Build a customized Modernizr File
 */
gulp.task('modernizr-build', function() {
  gulp.src('node_modules/gulp-modernizr/build/modernizr-custom.js')
    .pipe(modernizr({
      crawl: false,
      options : [
        'setClasses',
        'addTest',
        'html5printshiv',
        'testAllProps',
        'fnBind'
      ],
      tests: modernizrTests
    }))
    .pipe(gulp.dest(targetDirJS))
});

/**
 * Conditionizr
 * @description Task for Combine and Generate Conditionizr Test File
 */
gulp.task('conditionizr-tests', function() {
  gulp.src(sources.conditionizr)
    .pipe(concat('conditionizr.js'))
    .pipe(gulp.dest(targetDirJS));
});

/**
 * Javascript Code Quality
 * @description Check the JS Code Quality
 */
gulp.task('js-quality', function() {
  gulp.src([targetDirJS + '*.js'])
    .pipe(jshint())
    .pipe(jshint.reporter(stylish));
});

// ---- PUBLISHING TASKS ----------------

/**
 * Compress Images
 * @description Compress all Images in distribution
 * Inline Images (SVG, PNG, JPG, GIF)
 */
gulp.task('compress-images', function () {
  gulp.src(targetDirCSSImg + '/**/*')
    .pipe(imagemin({
      optimizationLevel: 3,
      use: [
        pngquant({
          quality: '65-87',
          speed: 4
      })],
      svgoPlugins: [{
        removeViewBox: false,
        removeDesc: true,
        cleanupIDs: false
      }],
      progressive: true,
      interlaced: true
    }))
    .pipe(gulp.dest(targetDirCSSImg));
});

/**
 * Compress Javascript
 * @description Compress all Javascript Files in distribution
 */
gulp.task('compress-js', function() {
  gulp.src([targetDirJS + '*.js'])
    .pipe(uglify({
      mangle: false
    }))
    .pipe(header(banner, { pkg : pkg } ))
    .pipe(gulp.dest(targetDirJS));
});

/**
 * Compress CSS Files
 * @description Compress CSS Files in distribution
 */
gulp.task('compress-css', function() {
  return gulp.src(targetDirCSS + '*.css')
    .pipe(csso())
    .pipe(gulp.dest(targetDirCSS));
});

/**
 * Banner CSS
 * @description Add Header to the CSS Files
 */
gulp.task('banner-css', function(){
  gulp.src(targetDirCSS + '*.css')
  .pipe(header(banner, { pkg : pkg } ))
    .pipe(gulp.dest(targetDirCSS));
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
// Update bower, component, npm at once:
gulp.task('bump', function(){
  var type = args.type || 'patch';
  var version = args.version;
  var options = {};

  if (version) {
    options.version = version;

  } else {
    options.type = type;
  }

  return gulp.src(['./bower.json', './package.json'])
  .pipe(bump(options))
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
    return gulp.src(targetDirCSS+cssFileName+'.css')
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
gulp.task('rebuild-images', [
  'build-bitmap-sprite',
  'build-svg-sprite',
  'move-images'
]);

/**
 * Rebuild all JS Files
 * Copy to distribution
 */
gulp.task('rebuild-js', [
  'modernizr-build',
  'move-js',
  'build-js',
  'combine-js',
  'conditionizr-tests'
]);

/**
 * Starting Task for the first Build off the Project Structure
 */
gulp.task('init',[
  'move-first',
  'move-fonts',
  'rebuild-js',
  'rebuild-images',
  cssCompiler,
  'jade'
]);

/**
 * Default Task - start the Watch Tasks for SASS,
 * JADE, JS and activate the Browser Watch
 */
gulp.task('watch-bin', function() {

  // Watch the SCSS Folder for changes - compile CSS
  gulp.watch(['src/sass/**/*.scss','src/sass/**/*.sass'], [cssCompiler]);

  if (useJade) {
    // Watch the JADE Folder for changes - compile HTML
    gulp.watch(['src/jade/**/*.jade', 'src/markdown/**/*.md'], ['jade']);
  }

  // Watch the JS SRC Folder for Changes - Lint JS and copy it to tmp
  gulp.watch('src/js/**/*.js', ['build-js']);
});

/**
 * Default gulp Task 'gulp'
 * watch the working dirs - activates the compilers and refresh the browser
 */
gulp.task('default', ['browser-sync', 'watch-bin']);

//----------------- PUBLISHING --------------------------

/**
 * Publish
 * @description Publish all Files in distribution
 * Add a new Versionnumber to Package and Bower
 * Compress Files
 */
gulp.task('publish', function(callback) {
  sequence(
    'bump',
    cssCompiler,
    'styleguide',
    [
      'compress-css',
      'banner-css',
      'js-quality',
      'compress-js',
      'compress-images',
    ],
    callback
  );
});
