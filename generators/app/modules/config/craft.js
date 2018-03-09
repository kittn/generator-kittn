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
        'webpackassets': 'assets/',
        'webpackcssassets': 'assets/css/',
        'webpackpublic': 'dist/public/'
      },
      'src': {
        'plugins': 'src/craftplugins/',
        'templates': 'src/structure/templates/'
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
        'url': context.props.credentialdomain !== 'undefined' ? `http://${context.props.credentialdomain}` : 'http://',
        'cssfile': context.props.projectcssfilename + '.css',
        'include': [
          '.plj',
          '.c-progressLoader'
        ],
        'ignore': [
          'font-face'
        ],
        'sites': [
          {
            'url': '',
            'template': 'index'
          },
          {
            'url': '/blog/hello-world',
            'template': 'general/entry'
          },
          {
            'url': '/blog',
            'template': 'general/index'
          },
          {
            'url': '/404',
            'template': '404'
          }
        ]
      }
    })
  }
}

module.exports = addCraftCofig
