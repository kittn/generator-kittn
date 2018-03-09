const extend = require('deep-extend')

function addHTMLCofig (files = {}, context) {
  if (context.props.projectusage === 'html' || context.props.projectusage === 'vueapp') {
    extend(files.pkg, {
      'dist': {
        'dist': 'dist/',
        'base': 'dist/',
        'markup': 'dist/',
        'assets': 'dist/assets/',
        'browserSyncDir': 'dist/',
        'css': 'dist/assets/css/',
        'js': 'dist/assets/js/',
        'fonts': 'dist/assets/fonts/',
        'cssimg': 'dist/assets/img/',
        'bitmaps': 'dist/assets/img/bitmaps/',
        'vectors': 'dist/assets/img/svgfiles/',
        'contentimage': 'dist/images/',
        'webpackassets': 'assets/',
        'webpackpublic': 'dist/'
      },
      'files': {
        'launch': [
          {'src': 'favicons/**', 'dest': 'assets/img/system/'},
          {'src': 'facebook-og-image.jpg', 'dest': 'assets/img/system/'},
          {'src': 'twitter-og-image.jpg', 'dest': 'assets/img/system/'},
          {'src': '.htaccess', 'dest': ''},
          {'src': '404.html', 'dest': ''},
          {'src': 'robots.txt', 'dest': ''}
        ]
      }
    })

    if (typeof context.props.projectstructure !== 'undefined' && context.props.projectstructure === 'twig') {
      extend(files.pkg, {
        'template': {
          'compiler': true
        }
      })
    }
  }
}

module.exports = addHTMLCofig
