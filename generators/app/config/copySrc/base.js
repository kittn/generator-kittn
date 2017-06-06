const base = (context) => {
  return {
    files: [
      {
        src: 'gulpfile.babel.js',
        dest: 'gulpfile.babel.js'
      },
      {
        src: 'config.json',
        dest: 'config.json'
      }
    ],
    folders: [
      {
        src: 'gulpfile',
        dest: 'gulpfile/'
      }
    ]
  }
}

module.exports = base
