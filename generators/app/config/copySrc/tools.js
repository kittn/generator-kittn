const styles = (context) => {
  return {
    files: [
      {
        conditions: {
          projectastrum: true
        },
        src: 'astrum-config.json',
        dest: 'astrum-config.json'
      },
      {
        conditions: {
          projectsassdocs: true
        },
        src: 'gulpfile_additions/sassdoc-generate.js',
        dest: 'gulpfile/tasks/sassdoc-generate.js'
      }
    ],
    folders: [
      {
        conditions: {
          projectastrum: true
        },
        src: 'pattern-library',
        dest: 'doc/pattern-library/'
      }
    ]
  }
}

module.exports = styles
