const extend = require('deep-extend')

function addWordpressCofig (files = {}, context) {
  // If Wordpress
  if (context.props.projectusage === 'wordpress' || context.props.projectusage === 'wordpressCB') {
    extend(files.pkg, {
      'dist': {
        'dist': 'dist/',
        'base': `dist/wp-content/themes/${context.props.projectname}/`,
        'markup': `dist/wp-content/themes/${context.props.projectname}/`,
        'templates': `dist/wp-content/themes/${context.props.projectname}/`,
        'assets': `dist/wp-content/themes/${context.props.projectname}/assets/`,
        'browserSyncDir': `dist/wp-content/themes/${context.props.projectname}/`,
        'css': `dist/wp-content/themes/${context.props.projectname}/assets/css/`,
        'js': `dist/wp-content/themes/${context.props.projectname}/assets/js/`,
        'fonts': `dist/wp-content/themes/${context.props.projectname}/assets/fonts/`,
        'cssimg': `dist/wp-content/themes/${context.props.projectname}/assets/img/`,
        'bitmaps': `dist/wp-content/themes/${context.props.projectname}/assets/img/bitmaps/`,
        'vectors': `dist/wp-content/themes/${context.props.projectname}/assets/img/svgfiles/`,
        'contentimage': `dist/wp-content/themes/${context.props.projectname}/images/`,
        'webpackassets': `wp-content/themes/${context.props.projectname}/assets/`,
        'webpackcssassets': `wp-content/themes/${context.props.projectname}/assets/css/`,
        'webpackpublic': 'dist/'
      },
      'src': {
        'structure': 'src/structure/templates/',
        'config': 'src/structure/config/',
        'plugins': 'src/wpplugins/'
      },
      'minify': {
        'purgeCSS': [
          'src/structure/templates/**/*.php',
          'src/js/**/*.vue'
        ]
      },
      files: {
        launch: [
          { src: '.htaccess', dest: '../../../' },
          { src: 'favicons/**', dest: 'assets/img/system/' },
          { src: 'facebook-og-image.jpg', dest: 'assets/img/system/' },
          { src: 'twitter-og-image.jpg', dest: 'assets/img/system/' }
        ]
      }
    })
  }
}

module.exports = addWordpressCofig
