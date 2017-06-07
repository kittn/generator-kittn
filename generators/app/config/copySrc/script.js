const script = (context) => {
  return {
    files: [
      {
        src: '.eslintrc',
        dest: '.eslintrc'
      },
      {
        src: '.eslintrc-dev',
        dest: '.eslintrc-dev'
      },
      {
        src: '.babelrc',
        dest: '.babelrc'
      },
      {
        src: '.babelrc',
        dest: '.babelrc'
      },
      {
        src: 'webpack.config.babel.js',
        dest: 'webpack.config.babel.js'
      },
      {
        src: 'webpack.dev.config.babel.js',
        dest: 'webpack.dev.config.babel.js'
      },
      {
        conditions: {
          projectjsframework: 'vue'
        },
        src: 'src/skeletons/vue/app.vue',
        dest: 'src/js/app.vue'
      }
    ],
    folders: [
      {
        conditions: {
          projectjsframework: 'vue'
        },
        src: 'build',
        dest: 'build/'
      },
      {
        conditions: {
          projectjsframework: 'vue'
        },
        src: 'src/skeletons/vue/components',
        dest: 'src/js/components/'
      },
      {
        conditions: {
          projectjsframework: 'vue'
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
          projectjsframework: 'vue',
          projectvueplugins: true
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
