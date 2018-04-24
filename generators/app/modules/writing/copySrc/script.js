const script = context => {
  return {
    files: [
      {
        src: '_eslintrc.js',
        dest: '.eslintrc.js'
      },
      {
        src: '_eslintrc-dev.js',
        dest: '.eslintrc-dev.js'
      },
      {
        src: '_babelrc',
        dest: '.babelrc'
      },
      {
        src: 'webpack/webpack.config.base.babel.js',
        dest: 'webpack/webpack.config.base.babel.js'
      },
      {
        src: 'webpack/webpack.dev.babel.js',
        dest: 'webpack/webpack.dev.babel.js'
      },
      {
        src: 'webpack/webpack.prod.babel.js',
        dest: 'webpack/webpack.prod.babel.js'
      },
      {
        src: 'webpack/utils.js',
        dest: 'webpack/utils.js'
      },
      {
        orConditions: [
          {
            projectjsframework: 'vue'
          },
          {
            projectusage: 'webpackApp'
          }
        ],
        src: 'src/skeletons/vue/app.vue',
        dest: 'src/js/app.vue'
      },
      {
        orConditions: [
          {
            projectjsframework: 'vue'
          },
          {
            projectusage: 'webpackApp'
          }
        ],
        src: 'src/skeletons/vue/vue-app.js',
        dest: 'src/js/vue-app.js'
      },
      {
        conditions: {
          projectusage: 'webpackApp'
        },
        src: 'webpack/webpack.dev.babel.js',
        dest: 'webpack/webpack.dev.babel.js'
      },
      {
        conditions: {
          projecttypescript: true
        },
        src: 'tsconfig.json',
        dest: 'tsconfig.json'
      }
    ],
    folders: [
      {
        orConditions: [
          {
            projectjsframework: 'vue'
          },
          {
            projectusage: 'webpackApp'
          }
        ],
        src: 'src/skeletons/vue/components',
        dest: 'src/js/components/'
      },
      {
        orConditions: [
          {
            projectjsframework: 'vue'
          },
          {
            projectusage: 'webpackApp'
          }
        ],
        src: 'src/skeletons/vue/shared',
        dest: 'src/js/shared/'
      },
      {
        conditions: {
          projectjsframework: 'vue',
          projectvueplugins: true
        },
        src: 'src/skeletons/vue/store',
        dest: 'src/js/store/'
      },
      {
        conditions: {
          projectusage: 'webpackApp'
        },
        src: 'src/skeletons/vue/store',
        dest: 'src/js/store/'
      },
      {
        conditions: {
          projectjsframework: 'vue',
          projectvueplugins: true
        },
        src: 'src/skeletons/vue/router',
        dest: 'src/js/router/'
      },
      {
        conditions: {
          projectusage: 'webpackApp'
        },
        src: 'src/skeletons/vue/router',
        dest: 'src/js/router/'
      },
      {
        src: 'src/js',
        dest: 'src/js/'
      }
    ]
  }
}

module.exports = script
