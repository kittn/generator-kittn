const extend = require('deep-extend')

function addCraftCofig (files = {}, context) {
  // If Craft
  if (context.props.projectusage === 'craft' || context.props.projectusage === 'craftCB') {
    extend(files.pkg, {
      'dist': {
        'dist': 'dist/',
        'base': 'dist/public/',
        'markup': 'dist/craft/',
        'templates': 'dist/craft/templates',
        'assets': 'dist/public/assets/',
        'browserSyncDir': 'dist/public/',
        'css': 'dist/public/assets/css/',
        'js': 'dist/public/assets/js/',
        'fonts': 'dist/public/assets/fonts/',
        'cssimg': 'dist/public/assets/img/',
        'bitmaps': 'dist/public/assets/img/bitmaps/',
        'vectors': 'dist/public/assets/img/svgfiles/',
        'contentimage': 'dist/public/images/',
        'webpackjsassets': 'assets/',
        'webpackpublic': 'dist/public/'
      },
      'files': {
        'launch': [
          {'src': 'facebook-og-image.jpg', 'dest': 'assets/img/system/'},
          {'src': 'twitter-og-image.jpg', 'dest': 'assets/img/system/'}
        ]
      },
      'src': {
        'plugins': 'src/craftplugins/'
      }
    })
  }
  if (context.props.projectusage === 'craftCB') {
    extend(files.pkg, {
      'cssabove': {
        'width': '1200',
        'height': '1024',
        'minify': true,
        'inline': false,
        'url': context.props.credentialdomain !== 'undefined' ? context.props.credentialdomain : '',
        'cssfile': context.props.projectcssfilename + '.css',
        'ignore': [
          'font-face'
        ],
        'sites': [
          {
            'url': '',
            'folder': '',
            'template': 'index'
          },
          {
            'url': '/blog/hello-world',
            'folder': 'general/',
            'template': 'general/entry'
          },
          {
            'url': '/blog',
            'folder': 'general/',
            'template': 'general/index'
          },
          {
            'url': '/404',
            'folder': '',
            'template': '404'
          }
        ]
      }
    })
  }
}

module.exports = addCraftCofig
