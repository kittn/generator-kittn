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
      },
      {
        conditions: {
          projectastrum: true
        },
        src: 'pattern-library/data.json',
        dest: 'doc/pattern-library/data.json'
      }
    ],
    folders: [
      {
        conditions: {
          projectastrum: true
        },
        src: 'pattern-library/data',
        dest: 'doc/pattern-library/',
        simplecopy: true
      }
    ]
  }
}

module.exports = styles
