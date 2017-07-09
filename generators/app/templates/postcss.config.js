module.exports = (ctx) => ({
  parser: 'postcss-scss',
  plugins: {<% if (typeof projectnormalize !== 'undefined' && projectnormalize === 'regular') { %>
    'postcss-normalize': {},<% } %>
    'postcss-custom-selectors': {},
    'postcss-custom-media': {},
    'postcss-pseudo-class-any-link': {},
    'postcss-custom-properties': {},
    'postcss-calc': {},
    'postcss-aspect-ratio': {},
    'postcss-easings': {},
    'postcss-assets': {
      basePath: './',
      loadPaths: [<% if (projectusage == 'html') { %>'dist/assets/img/'<% } if (projectusage == 'wordpress' || projectusage == 'wordpressCB') { %>'dist/wp-content/themes/<%= projectname %>/assets/img/'<% } if (projectusage == 'craft' || projectusage == 'craftCB') { %>'dist/public/assets/img/'<% } %>]
    },
    'autoprefixer': {
      cascade: false
    },
    'postcss-svg': {},
    'postcss-short-size': {},
    'postcss-flexbugs-fixes': {},
    'cssnano': ctx.env !== 'production' ? false : {
      zindex: false,
      discardUnused: false,
      reduceIdents: false,
      mergeIdents: false
    },
    'rucksack-css': {
      autoprefixer: false,
      hexRGBA: false,
      easings: false,
      fontPath: false
    }
  }
})
