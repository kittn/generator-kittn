import kc from '../../config.json'

const preCssConf = () => {
  return [
    function(css) { // Spacer Function
      css.walkDecls(function (decl) {
        if (decl.value.match(/spacer/)) {
          const SPACER = parseInt(kc.css.spacer, 10)
          decl.value = SPACER * parseFloat(decl.value) + 'px'
        }
        if (decl.value.match(/pxrem/)) {
          const BASE = parseInt(kc.css.baseFontSize, 10)
          decl.value = parseFloat(decl.value) / BASE + 'rem'
        }
      })
    },
    // CSS Level 4 Stuff
    require('postcss-custom-selectors'),
    require('postcss-custom-media'),
    require('postcss-pseudo-class-any-link'),
    require('postcss-custom-properties'),
    require('postcss-calc'),
    require('postcss-aspect-ratio'),
    require('postcss-easings'),
    // Include Assets
    require('postcss-assets')({
      basePath: kc.templatePath.root,
      loadPaths: [kc.dist.cssimg]
    }),
    // Prefixer
    require('autoprefixer')({
      browsers: kc.css.prefix,
      cascade: false
    }),
    require('postcss-svg-fragments'),
    // Include the LostGrid System
    require('lost')({}),
    // Include Size Short hands
    require('postcss-short-size'),
    // Fix some Flexbox Bugs
    require('postcss-flexbugs-fixes'),
    // RucksackCSS for CSS Superpowers
    require('rucksack-css')({
      autoprefixer: false,
      hexRGBA: false,
      easings: false,
      fontPath: false
    })
  ]
}

module.exports = preCssConf
