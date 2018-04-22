const base = context => {
  return {
    files: [
      {
        src: 'gulpfile.babel.js',
        dest: 'gulpfile.babel.js'
      },
      {
        src: '_browserslistrc',
        dest: '.browserslistrc'
      },
      {
        src: '_nvmrc',
        dest: '.nvmrc'
      },
      {
        src: '_editorconfig',
        dest: '.editorconfig'
      },
      {
        src: '_gitignore',
        dest: '.gitignore'
      },
      {
        notConditions: {
          projectusage: 'webpackApp'
        },
        src: 'src/.system_additions/htaccess',
        dest: 'src/.system/.htaccess'
      },
      {
        notConditions: {
          projectusage: 'webpackApp'
        },
        src: 'src/.system_additions/facebook-og-image.jpg',
        dest: 'src/.system/facebook-og-image.jpg',
        simplecopy: true
      },
      {
        notConditions: {
          projectusage: 'webpackApp'
        },
        src: 'src/.system_additions/favicon.png',
        dest: 'src/.system/favicon.png',
        simplecopy: true
      },
      {
        notConditions: {
          projectusage: 'webpackApp'
        },
        src: 'src/.system_additions/placeholder.png',
        dest: 'src/.system/placeholder.png',
        simplecopy: true
      },
      {
        notConditions: {
          projectusage: 'webpackApp'
        },
        src: 'src/.system_additions/twitter-og-image.jpg',
        dest: 'src/.system/twitter-og-image.jpg',
        simplecopy: true
      },
      {
        conditions: {
          projectprettier: true
        },
        src: '_prettierignore',
        dest: '.prettierignore'
      },
      {
        conditions: {
          projectprettier: true
        },
        src: 'prettier.config.js',
        dest: 'prettier.config.js',
        simplecopy: true
      },
      {
        conditions: {
          projecttestinge2e: true
        },
        src: 'cypress.json',
        dest: 'cypress.json',
        simplecopy: true
      },
      {
        conditions: {
          projecttestingunit: true
        },
        src: 'jest.config.js',
        dest: 'jest.config.js',
        simplecopy: true
      },
      {
        conditions: {
          projecttestingwallaby: true
        },
        src: 'wallaby.config.js',
        dest: 'wallaby.config.js',
        simplecopy: true
      },
      {
        src: 'README.md',
        dest: 'README.md'
      },
      {
        conditions: {
          projecttailwind: 'hybrid'
        },
        src: 'purgecss.pattern.js',
        dest: 'purgecss.pattern.js',
        simplecopy: true
      },
      {
        conditions: {
          projecttailwind: 'hybrid'
        },
        src: 'tailwind.js',
        dest: 'tailwind.js',
        simplecopy: true
      }
    ],
    folders: [
      {
        notConditions: {
          projectusage: 'webpackApp'
        },
        src: 'gulpfile',
        dest: 'gulpfile/'
      },
      {
        notConditions: {
          projectusage: 'webpackApp'
        },
        src: 'src/.system',
        dest: 'src/.system/'
      },
      {
        notConditions: {
          projectusage: 'webpackApp'
        },
        src: 'src/images',
        dest: 'src/images/'
      },
      {
        conditions: {
          projectusage: 'webpackApp'
        },
        src: 'src/images_webpackApp',
        dest: 'src/images/'
      },
      {
        src: 'src/scripts',
        dest: 'src/scripts/'
      },
      {
        src: 'src/fonts',
        dest: 'src/fonts/'
      },
      {
        conditions: {
          projecttailwind: 'hybrid'
        },
        src: 'tailwind',
        dest: 'tailwind/'
      },
      {
        conditions: {
          projecttestinge2e: true
        },
        src: 'tests/e2e',
        dest: 'tests/e2e/'
      },
      {
        conditions: {
          projecttestingunit: true
        },
        src: 'tests/unit',
        dest: 'tests/unit/'
      }
    ]
  }
};

module.exports = base
