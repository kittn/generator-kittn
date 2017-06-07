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
      },
      {
        src: '.nvmrc',
        dest: '.nvmrc'
      },
      {
        src: '.editorconfig',
        dest: '.editorconfig'
      },
      {
        src: '.bowerrc',
        dest: '.bowerrc'
      },
      {
        src: 'bower.json',
        dest: 'bower.json'
      },
      {
        src: '_gitignore',
        dest: '.gitignore'
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
