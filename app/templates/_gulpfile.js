// Gulpfile
// ========

// Load Pathes
var sassSrc = [
  'src/sass/**/*.scss',
  'src/sass/**/*.sass'
];

// Setup what for JS Files you want to only copy it into dist/,
// and what for js files need to combined into scripts.js.
var sources = {
  copyjs: [
    {src:'src/stash/bower/conditionizr/dist/conditionizr.js'},<% if (projectiecompatible == true ) { %>
    {src:'src/stash/bower/selectivizr/selectivizr.js'},<% } %>
    {src:'src/stash/bower/media-match/media.match.js'},
    {src:'src/stash/bower/eq.js/build/eq.js'}
  ],
  combinejs: [
    'src/stash/bower/jquery/jquery.js'
  ]
};

// Place any font files into src/stash/fonts/ -
// the files would be copied to the dist directory
var fonts = {
  files: [
    {src: ''}
  ]
};

// DO NOT MODIFY BELOW THIS LINE ! ===============================================
//
var cssCompiler = 'rubysass';

// Config File
var pkg = require('./package.json');
var config = {
  gitURL: pkg.repository.url,
  gitBranch: 'master',
  gitVersion: pkg.version
};

// Directory Routing
var targetDirBase    = pkg.directory.base;
var targetDirCSS     = pkg.directory.css;
var targetDirJS      = pkg.directory.js;
var targetDirMarkup  = pkg.directory.markup;
var targetDirCSSImg  = pkg.directory.cssimg;
var targetDirHTMLImg = pkg.directory.htmlimg;

// Define the Header for the Files
var banner = ['/**',
  ' * <%= pkg.name %> - <%= pkg.description %>',
  ' * @version v<%= pkg.version %>',
  ' * @link <%= pkg.homepage %>',
  ' * @license <%= pkg.license %>',
  ' */',
  ''].join('\n');

// Define the Base Static Files and the Target
var build = {
  files: [
    {src:'src/stash/.system/.htaccess'  , dest: ''},
    {src:'src/stash/.system/404.html'   , dest: ''},
    {src:'src/stash/.system/robots.txt' , dest: ''},
    {src:'src/stash/.system/favicon.png', dest: 'assets/img/system/'},
    {src:'src/stash/.system/spinner.gif', dest: 'assets/img/system/'}
  ]
};

// Init grunt
var gulp = require('gulp');
require('gulp-grunt')(gulp);

// Init Gulp-Grunt
var gulp_grunt = require('gulp-grunt');
var tasks = gulp_grunt.tasks({
    base: null,
    prefix: 'grunt-',
    verbose: false
});

// Set the Task Variables
var path        = require('path'),
    jade        = require('gulp-jade'),
    prettify    = require('gulp-prettify'),
    rubysass    = require('gulp-ruby-sass'),
    browserSync = require('browser-sync'),
    concat      = require('gulp-concat'),
    uglify      = require('gulp-uglify'),
    minifyCSS   = require('gulp-minify-css'),
    imagemin    = require('gulp-imagemin'),
    prefix      = require('gulp-autoprefixer'),
    plumber     = require('gulp-plumber'),
    header      = require('gulp-header'),
    notify      = require('gulp-notify'),
    jshint      = require('gulp-jshint'),
    stylish     = require('jshint-stylish'),
    bump        = require('gulp-bump'),
    changed     = require('gulp-changed');

// --- Task Config --------------

// Ruby SASS
gulp.task('rubysass', function () {
  gulp.src(sassSrc)
    .pipe(plumber())
    .pipe(rubysass({
      sourcemap    : false,
      style        : 'nested',
      precision    : 6
    }))
    .on("error", notify.onError("Sass Compile Error!"))
    .pipe(prefix("last 2 version", "> 1%", "ie 9", "chrome 30", "firefox 24"))
    .pipe(gulp.dest(targetDirCSS));
});

// Jade Compile Task only the Components
gulp.task('jade', function(){
  gulp.src(['src/jade/*.jade','!src/jade/_*.jade'])
    .pipe(changed(targetDirMarkup, { extension: '.html' }))
    .pipe(plumber())
    .pipe(jade({
        pretty: true,
        locals: {
          siteTitle: pkg.name
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

// Jade Compile Task for rebuilding all Files
gulp.task('jade-rebuild', function(){
  gulp.src(['src/jade/*.jade','!src/jade/_*.jade'])
    .pipe(plumber())
    .pipe(jade({
        pretty: true,
        locals: {
          siteTitle: pkg.name
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

// Jade Compile Task only the Components
gulp.task('jade-components', function(){
  gulp.src(['src/jade/components/*.jade', 'src/jade/templatepart/*.jade'])
    .pipe(plumber())
    .pipe(jade({
        pretty: true,
        locals: {
          siteTitle: pkg.name
        }
      }))
    .on("error", notify.onError(function (error) {
      return "JADE Compile Error!!";
    }))
    .on('error', function(err) {
      console.log(err);
    })
    .pipe(prettify({
      collapseWhitespace: true,
      'indent_size': 2
    }))
    .pipe(gulp.dest(targetDirMarkup + 'components/'))
    .pipe(notify({message: 'Jade Components generated'}));
});

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
gulp.task('browser-sync', function() {
  browserSync.init([
    targetDirCSS +'**/*.css',
    targetDirBase + '**/*.{html,php}',
    targetDirCSSImg + '**/*.{jpg,gif,png,svg}',
    targetDirJS + '**/*.js'],
  { options: {
      debugInfo: true,
      watchTask: true,
      // proxy: 'domain',
      ghostMode: {
        clicks : true,
        scroll : true,
        links  : true,
        forms  : true }
    },
    server: {
      baseDir  : 'dist/'
    },
    open: true
  });
});

// --- Copy Tasks --------------

// Copy Bower Files to 'dist/assets/javascripts/'.
// Its a temporaly directory, the final JS files comes
// later in the 'js' directory
gulp.task('move-js', function () {
  sources.copyjs.forEach(function(item) {
    gulp.src(item.src)
      .pipe(gulp.dest(targetDirJS));
  });
});

// Copy the Default Build Files to 'tmp'
gulp.task('move-first', function () {
  build.files.forEach(function(item) {
    gulp.src(item.src)
      .pipe(gulp.dest(targetDirBase + item.dest));
  });
});

// Copy Image to the HTML Directory
gulp.task('move-images', function () {
  gulp.src(['src/stash/images/html-images/html-assets/**'])
    .pipe(changed(targetDirHTMLImg))
    .pipe(gulp.dest(targetDirHTMLImg));
});

// Combine Scripts from Browser to script.js
gulp.task('combine-js', function() {
  gulp.src(sources.combinejs)
    .pipe(concat('scripts.js'))
    .pipe(gulp.dest(targetDirJS));
});

// Code Quality
gulp.task('js-quality', function() {
  gulp.src([targetDirJS + '*.js'])
    .pipe(jshint())
    .pipe(jshint.reporter(stylish));
});

// ---- PUBLISHING TASKS ----------------

// Compress CSS included Images and move it from tmp to dist
gulp.task('compress-css-images', function () {
  gulp.src([
    targetDirCSSImg + '**',
    '!' + targetDirCSSImg + 'sprite_2x/',
    '!' + targetDirCSSImg + 'sprite/',
    ])
    .pipe(changed(targetDirCSSImg))
    .pipe(imagemin({
      optimizationLevel: 5,
      pngquant: false,
      progressive: true
    }))
    .pipe(gulp.dest(targetDirCSSImg));
});

// Compress HTML included images and move it from tmp to dist
gulp.task('compress-html-images', function () {
  gulp.src([targetDirHTMLImg + '**'])
    .pipe(changed(targetDirHTMLImg))
    .pipe(imagemin({
      optimizationLevel: 6,
      pngquant: false
    }))
    .pipe(gulp.dest(targetDirHTMLImg));
});

// Comress all JS Files
gulp.task('compress-js', function() {
  gulp.src([targetDirJS + '*.js'])
    .pipe(uglify())
    .pipe(header(banner, { pkg : pkg } ))
    .pipe(gulp.dest(targetDirJS));
});

// Minify CSS and copy it to dist/
gulp.task('minify-css', function() {
  gulp.src(targetDirCSS + '*.css')
    .pipe(minifyCSS({
      keepSpecialComments: true,
      keepBreaks: true,
      removeEmpty: true,
      debug: true
    }))
    .pipe(header(banner, { pkg : pkg } ))
    .pipe(gulp.dest(targetDirCSS));
});

// ---- Version Bumper ---------------

// Update bower, component, npm at once:
gulp.task('bump', function(){
  gulp.src(['bower.json', 'package.json'])
  .pipe(bump({type:'patch'}))
  .pipe(gulp.dest('./'));
});

gulp.task('bump-minor', function(){
  gulp.src(['bower.json', 'package.json'])
  .pipe(bump({type:'minor'}))
  .pipe(gulp.dest('./'));
});

gulp.task('bump-major', function(){
  gulp.src(['bower.json', 'package.json'])
  .pipe(bump({type:'major'}))
  .pipe(gulp.dest('./'));
});

// MAIN TASK BLOCK ------------------------------------------------------

// Starting Task for the first Build off the Project Structure
gulp.task('init', [
    'grunt-modernizr-build',
    'move-first',
    'move-js',
    'move-images',
    'grunt-build-images',
    cssCompiler,
    'jade',
    'build-js',
    'combine-js'
    ]);

gulp.task('rebuild-js', [
    'grunt-modernizr-build',
    'move-js',
    'build-js',
    'combine-js'
  ]);

// Default Task - start the Watch Tasks for SASS,
// JADE, JS and activate the Browser Watch
gulp.task('watch-bin', function() {

  // Watch the SCSS Folder for changes - compile CSS
  gulp.watch(['src/sass/**/*.scss','src/sass/**/*.sass'], [cssCompiler]);

  // Watch the JADE Folder for changes - compile HTML
  <% if (projectjade == true ) { %>
  gulp.watch(['src/jade/**/*.jade', 'src/markdown/**/*.md'], ['jade']);<% } else { %>
  //gulp.watch(['src/jade/**/*.jade', 'src/markdown/**/*.md'], ['jade']);
  <% } %>

  // Watch the JS SRC Folder for Changes - Lint JS and copy it to tmp
  gulp.watch('src/js/**/*.js', ['build-js']);
});

gulp.task('watch-images', function() {

  // Watch SVGOnly Folder for changes - minify SVG and move it into tmp
  gulp.watch('src/stash/images/css-images/svgonly-assets/*.svg', ['grunt-minify-svg']);

  // Watch SVG Folder for changes - build PNG Fallback and write the Imagemap
  gulp.watch('src/stash/images/css-images/svg-assets/*.svg', ['grunt-build-svg']);

  // Watch the Single/Texture Folder - modify the Imagemap and move the Images to tmp folder
  gulp.watch(
    [
      'src/stash/images/css-images/single-assets/*.png',
      'src/stash/images/css-images/single-assets/*.jpg',
      'src/stash/images/css-images/single-assets/*.gif',
      'src/stash/images/css-images/texture-assets/*.png',
      'src/stash/images/css-images/texture-assets/*.jpg',
      'src/stash/images/css-images/texture-assets/*.gif'
    ],
      ['grunt-copy-images']
    );

  // Watch for Sprite Changes - modify the Spritemap and move the images (renamed) to tmp
  gulp.watch('src/stash/images/css-images/sprite-assets/*.png', ['grunt-build-sprite']);
});

// Default gulp Task 'gulp' - watch the Binarys Directory, start the compile and browser-sync
gulp.task('default', ['browser-sync', 'watch-bin']);

// The Extended Watch Task - it watch additional image dirs
gulp.task('extended', ['browser-sync', 'watch-bin', 'watch-images']);

// Testing code quality
gulp.task('code-quality', [
  'js-quality'
]);

// Publish Task
gulp.task('publish',[
    'bump',
    'minify-css',
    'compress-js',
    'compress-css-images',
    'compress-html-images',
    'grunt-documentation'
]);
