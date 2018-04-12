const extend = require('deep-extend')

function addBaseDependencies (files = {}, context) {
  extend(files.pkg, {
    scripts: {
      build: 'cross-env NODE_ENV=production npm run subtask:bundlewebpack',
      deploy: 'npm run build',
      dev: 'cross-env NODE_ENV=development gulp',
      init: 'npm run build'
    },
    devDependencies: {
      '@babel/cli': '^7.0.0-beta.44',
      '@babel/core': '^7.0.0-beta.44',
      'cross-env': '^5.1.4'
    }
  })

  if (context.props.projectusage !== 'webpackApp') {
    extend(files.pkg, {
      scripts: {
        'subtask:buildgulp': 'gulp build --env=production',
        assets: 'gulp copy:assets --env=init',
        build: 'cross-env NODE_ENV=production npm run subtask:buildgulp && cross-env NODE_ENV=production npm run subtask:bundlewebpack',
        deploy: 'npm run build',
        dev: 'cross-env NODE_ENV=development gulp',
        favicon: 'gulp build:favicon --env=init',
        htmlassets: 'gulp copy:contentimages --env=init',
        init: 'cross-env NODE_ENV=production gulp init --env=init && cross-env NODE_ENV=production  npm run subtask:bundlewebpack',
        template: 'gulp compiler:html --env=init',
        uiimages: 'gulp rebuild:images --env=init',
        fonts: 'gulp copy:fonts --env=init'
      },
      devDependencies: {
        'ansi-html': '^0.0.7',
        'browser-sync': '^2.23.6',
        'gulp': '^3.9.1',
        'gulp-bump': '^3.1.0',
        'gulp-changed': '^3.2.0',
        'gulp-cheerio': '^0.6.3',
        'gulp-concat': '^2.6.1',
        'gulp-favicons': '^2.2.7',
        'gulp-html-prettify': '^0.0.1',
        'gulp-if': '^2.0.2',
        'gulp-imagemin': '^4.1.0',
        'gulp-modernizr': '1.0.0-alpha',
        'gulp-notify': '^3.2.0',
        'gulp-plumber': '^1.2.0',
        'gulp.spritesmith': '^6.9.0',
        'gulp-svg-sprite': '^1.4.0',
        'gulp-twig': '^1.2.0',
        'gulp-uglify': '^3.0.0',
        'gulp-watch': '^5.0.0',
        'imagemin-jpeg-recompress': '^5.1.0',
        'imagemin-pngquant': '^5.1.0',
        'imagemin-svgo': '^6.0.0',
        'require-dir': '^0.3.2',
        'run-sequence': '^2.2.1'
      }
    })
  }

  if (context.props.projectprettier === true) {
    extend(files.pkg, {
      scripts: {
        prettify: 'prettier prettier --loglevel=warn --write "{webpack,src}/**/*.{js,scss}"'
      },
      devDependencies: {
        'eslint-config-prettier': '^2.9.0',
        'eslint-plugin-prettier': '^2.6.0',
        'prettier': '^1.11.1'
      }
    })
  }
}

module.exports = addBaseDependencies
