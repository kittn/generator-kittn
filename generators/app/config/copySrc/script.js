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
