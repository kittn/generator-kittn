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
        src: 'src/js',
        dest: 'src/js/'
      }
    ]
  }
}

module.exports = script
