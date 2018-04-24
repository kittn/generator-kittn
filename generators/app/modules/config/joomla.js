const extend = require('deep-extend')

function addJoomlaCofig (files = {}, context) {
  // If Craft
  if (context.props.projectusage === 'joomla') {
    extend(files.pkg, {
      'dist': {
        'img': 'dist/images/',
        'dist': 'dist/',
        'plugins': 'dist/plugins/',
        'base': `dist/templates/${context.props.projectname}/`,
        'markup': `dist/templates/${context.props.projectname}/`,
        'templates': `dist/templates/${context.props.projectname}/`,
        'assets': `dist/templates/${context.props.projectname}/assets/`,
        'browserSyncDir': `dist/templates/${context.props.projectname}/`,
        'css': `dist/templates/${context.props.projectname}/assets/css/`,
        'js': `dist/templates/${context.props.projectname}/assets/js/`,
        'fonts': `dist/templates/${context.props.projectname}/assets/fonts/`,
        'cssimg': `dist/templates/${context.props.projectname}/assets/img/`,
        'bitmaps': `dist/templates/${context.props.projectname}/assets/img/bitmaps/`,
        'vectors': `dist/templates/${context.props.projectname}/assets/img/svgfiles/`,
        'contentimage': `dist/templates/${context.props.projectname}/images/`,
        'webpackassets': `templates/${context.props.projectname}/assets/`,
        'webpackcssassets': `templates/${context.props.projectname}/assets/css/`,
        'webpackpublic': 'dist/'
      },
      'files': {
        'launch': [
          {'src': 'favicons/**', 'dest': `templates/${context.props.projectname}/assets/img/system/`},
          {'src': 'facebook-og-image.jpg', 'dest': `templates/${context.props.projectname}/assets/img/system/`},
          {'src': 'twitter-og-image.jpg', 'dest': `templates/${context.props.projectname}/assets/img/system/`}
        ]
      },
      'joomlafiles': [
        { 'src': 'src/structure/templates/', 'dest': 'dist/templates/' },
        { 'src': 'src/structure/plugins/', 'dest': 'dist/plugins/' },
        { 'src': 'src/structure/modules/', 'dest': 'dist/modules/' },
        { 'src': 'src/structure/administrator/', 'dest': 'dist/administrator/' },
        { 'src': 'src/structure/components/', 'dest': 'dist/components/' },
        { 'src': 'src/structure/media/', 'dest': 'dist/media/' },
        { 'src': 'src/structure/language/', 'dest': 'dist/language/' }
      ],
      'src': {
        'structure': `src/structure/templates/${context.props.projectname}`,
        'templates': `src/structure/templates/${context.props.projectname}/_critical/`
      },
      'minify': {
        'purgeCSS': [
          `src/structure/templates/${context.props.projectname}/**/*.php`,
          'src/js/**/*.vue'
        ]
      }
    })
  }
  if (context.props.projectusage === 'joomla') {
    extend(files.pkg, {
      'cssabove': {
        'width': '1200',
        'height': '1024',
        'minify': true,
        'inline': false,
        'url': context.props.credentialdomain !== 'undefined' ? `http://${context.props.credentialdomain}` : 'http://',
        'cssfile': context.props.projectcssfilename + '.css',
        'include': [
          '.plj .c-progressLoader',
          '.plj .c-progressLoader--complete .c-progressLoader',
          '.plj .o-area__wrapper',
          '.plj .is-livepreview .o-area__wrapper',
          '.plj .c-progressLoader__loader',
          '.plj .c-progressLoader__loader.c-progressLoader--bar--complete'
        ],
        'ignore': [
          '@font-face'
        ],
        'sites': [
          {
            'url': '',
            'template': 'default'
          }
        ]
      }
    })
  }
}

module.exports = addJoomlaCofig
