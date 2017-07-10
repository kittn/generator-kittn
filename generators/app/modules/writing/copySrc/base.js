const base = (context) => {
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
        src: '_bowerrc',
        dest: '.bowerrc'
      },
      {
        src: 'bower.json',
        dest: 'bower.json'
      },
      {
        src: '_gitignore',
        dest: '.gitignore'
      },
      {
        src: 'src/.system_additions/htaccess',
        dest: 'src/.system/.htaccess'
      },
      {
        src: 'README.md',
        dest: 'README.md'
      }
    ],
    folders: [
      {
        src: 'gulpfile',
        dest: 'gulpfile/'
      },
      {
        src: 'src/.system',
        dest: 'src/.system/'
      },
      {
        src: 'src/images',
        dest: 'src/images/'
      },
      {
        src: 'src/scripts',
        dest: 'src/scripts/'
      },
      {
        src: 'src/fonts',
        dest: 'src/fonts/'
      }
    ]
  }
}

module.exports = base
