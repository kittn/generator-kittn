import kc from '../config.json'

const preCssConf = () => {
  return [
    // Add :matches Selector
    require('postcss-selector-matches'),
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

