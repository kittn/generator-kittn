module.exports = ({ file, options, env }) => ({
  parser: 'postcss-scss',
  plugins: {<% if (typeof projectnormalize !== 'undefined' && projectnormalize === 'regular') { %>
    'postcss-normalize': options && options.normalize !== false ? {} : false,<% } %><% if (typeof projecttailwind !== 'undefined' && projecttailwind == 'hybrid') { %>
    'tailwindcss': './tailwind.js',<% } %>
    'postcss-custom-selectors': {},
    'postcss-custom-media': {},
    'postcss-pseudo-class-any-link': {},
    'postcss-custom-properties': {
      warnings: false
    },
    'postcss-calc': {},
    'postcss-aspect-ratio': {},
    'postcss-easings': {},
    'postcss-assets': {
      basePath: './',
      loadPaths: [<% if (projectusage == 'html') { %>'dist/assets/img/'<% } if (projectusage == 'wordpress' || projectusage == 'wordpressCB') { %>'dist/wp-content/themes/<%= projectname %>/assets/img/'<% } if (projectusage == 'joomla' || projectusage == 'joomlaCB') { %>'dist/templates/<%= projectname %>/assets/img/'<% } if (projectusage == 'craft' || projectusage == 'craftCB') { %>'dist/public/assets/img/'<% } %>]
    },
    'autoprefixer': {
      cascade: false,
      grid: false
    },
    'postcss-svg': {},
    'postcss-short-size': {},
    'postcss-flexbugs-fixes': {},
    'cssnano': env !== 'production' ? false : {
      discardComments: { removeAll: true },
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
