const extend = require('deep-extend')

function addCraftCofig (files = {}, context) {
  // If Craft
  if (context.props.projectusage === 'craft' || context.props.projectusage === 'craftCB') {
    extend(files.pkg, {
      'dist': {
        'dist': 'dist/',
        'base': 'dist/public/',
        'markup': 'dist/craft/',
        'assets': 'dist/public/assets/',
        'browserSyncDir': 'dist/public/',
        'css': 'dist/public/assets/css/',
        'js': 'dist/public/assets/js/',
        'fonts': 'dist/public/assets/fonts/',
        'cssimg': 'dist/public/assets/img/',
        'bitmaps': 'dist/public/assets/img/bitmaps/',
        'vectors': 'dist/public/assets/img/svgfiles/',
        'contentimage': 'dist/public/images/',
        'webpackjsassets': 'assets/'
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
}

module.exports = addCraftCofig
