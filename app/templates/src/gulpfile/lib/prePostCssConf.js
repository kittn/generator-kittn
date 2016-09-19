import kc from '../../config.json'

const preCssConf = () => {
  return [
    // CSS Level 4 Stuff
    require('postcss-custom-selectors'),
    require('postcss-custom-media'),
    require('postcss-pseudo-class-any-link'),
    require('postcss-custom-properties'),
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
    // Inline SVG Images
    require('postcss-svg')({
      defaults: '[fill]:#444',
      paths: [kc.dist.vectors]
    }),
    // Include the LostGrid System
    require('lost')({}),
    // Include Size Short hands
    require('postcss-short-size'),
    // Fix some Flexbox Bugs
    require('postcss-flexbugs-fixes')
  ]
}

module.exports = preCssConf

