const script = (context) => {
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
        src: 'webpack/webpack.config.babel.js',
        dest: 'webpack/webpack.config.babel.js'
      },
      {
        orConditions: {
          projectjsframework: 'vue',
          projectusage: 'vueapp'
        },
        src: 'src/skeletons/vue/app.vue',
        dest: 'src/js/app.vue'
      },
      {
        conditions: {
          projectusage: 'vueapp'
        },
        src: 'webpack/webpack.dev.babel.js',
        dest: 'webpack/webpack.dev.babel.js'
      }
    ],
    folders: [
      {
        orConditions: {
          projectjsframework: 'vue',
          projectusage: 'vueapp'
        },
        src: 'src/skeletons/vue/components',
        dest: 'src/js/components/'
      },
      {
        orConditions: {
          projectjsframework: 'vue',
          projectusage: 'vueapp'
        },
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
          projectusage: 'vueapp'
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
          projectusage: 'vueapp'
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
