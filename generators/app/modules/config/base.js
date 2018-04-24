const extend = require('deep-extend')

function addBaseCofig (files = {}, context) {
  extend(files.pkg, {
    dist: {
      img: 'dist/assets/img/'
    },
    template: {
      globalTitle: context.props.projectname,
      compiler: false
    },
    browsersync: {
      openbrowser: false,
      port: 3000
    },
    minify: {
      images: {
        svgoPlugins: [
          { cleanupIDs: false },
          { removeComments: true },
          { removeViewBox: false },
          { removeDesc: true },
          { removeUselessDefs: false },
          { removeDoctype: true },
          { removeEmptyText: true },
          { removeUnknownsAndDefaults: true },
          { removeEmptyContainers: true },
          { collapseGroups: true },
          { removeUselessStrokeAndFill: true },
          { convertStyleToAttrs: true }
        ]
      }
    },
    src: {
      baseconf: {
        type: context.props.projectusage,
        methodology: context.props.projectcssstructure
          ? context.props.projectcssstructure
          : 'sassITCSS',
        structure: context.props.projectstructure
          ? context.props.projectstructure
          : 'uncompiled',
        themeColor: context.props.projectthemecolor
      },
      base: 'src/',
      style: 'src/style/',
      template: 'src/template/',
      js: 'src/js/',
      scripts: 'src/scripts',
      structure: 'src/structure/',
      fonts: 'src/fonts/',
      images: {
        base: 'src/images/',
        bitmapSprite: {
          files: 'src/images/bitmapSprite-assets/',
          name: 'sprite.png'
        },
        vectorSprite: {
          files: 'src/images/vectorSprite-assets/',
          name: 'vector-sprite.svg',
          symbolName: 'symbol-sprite.svg',
          maxHeight: 30,
          maxWidth: 30,
          padding: 0
        },
        bitmaps: 'src/images/bitmapSingle-assets/',
        vectors: 'src/images/vectorSingle-assets/'
      },
      contentimage: 'src/images/htmlimages/',
      system: 'src/.system/',
      jsEntryPoints: {
        main: './src/js/main.js'
      }
    }
  })

  if (context.props.projectusage !== 'webpackApp') {
    extend(files.pkg, {
      dist: {
        cssimgRoot: '/assets/img/'
      },
      templatePath: {
        root: './',
        css: 'assets/css/',
        js: 'assets/js/',
        fonts: 'assets/fonts/',
        cssimage: 'assets/img/',
        contentimage: 'images/'
      },
      css: {
        spacer: '20px',
        baseFontSize: '16px'
      },
      browsersync: {
        https: false,
        proxy: false
      },
      files: {
        jsCopy: [],
        jsCombine: {
          files: [],
          filename: 'scripts.js'
        },
        fonts: ['src/fonts/**'],
        launch: [
          { src: 'favicons/**', dest: 'assets/img/system/' },
          { src: 'facebook-og-image.jpg', dest: 'assets/img/system/' },
          { src: 'twitter-og-image.jpg', dest: 'assets/img/system/' }
        ]
      },
      minify: {
        images: {
          optimizationLevel: 3,
          pngquant: {
            quality: '75-88',
            speed: 4
          },
          progressive: true,
          interlaced: true
        },
        javascript: {
          options: {
            mangle: false
          }
        }
      }
    })
  }

  if (
    typeof context.props.projectcredential !== 'undefined' &&
    context.props.projectcredential
  ) {
    let prefix = ''

    if (!context.props.credentialdomain.startsWith('http')) {
      prefix = 'http://'
    }
    extend(files.pkg, {
      browsersync: {
        proxy: prefix + context.props.credentialdomain
      }
    })
  }
  if (
    context.props.projectcritical !== 'undefined' &&
    context.props.projectcritical === true
  ) {
    extend(files.pkg, {
      cssabove: {
        width: '1024',
        height: '768',
        minify: true,
        inline: false,
        sources: ['index.html']
      }
    })
    if (context.props.projectcriticalinline === 'inline') {
      extend(files.pkg, {
        cssabove: {
          inline: true
        }
      })
    } else {
      extend(files.pkg, {
        cssabove: {
          destFilename: 'critical.css'
        }
      })
    }
  }
}

module.exports = addBaseCofig
