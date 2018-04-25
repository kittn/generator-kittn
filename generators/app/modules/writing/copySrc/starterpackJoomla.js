const starterpackJoomla = (context) => {
  return {
    files: [
      {
        conditions: {
          projectusage: 'joomlaCB'
        },
        src: 'stylelint.configCB.js',
        dest: 'stylelint.config.js'
      },
      {
        conditions: {
          projectusage: 'joomlaCB',
          projectcredential: true
        },
        src: 'install.sh',
        dest: 'install.sh'
      },
      {
        conditions: {
          projectusage: 'joomlaCB'
        },
        src: 'src/framework_additions/_normalize.scss',
        dest: 'src/framework/partials/_normalize.scss'
      },
      {
        conditions: {
          projectusage: 'joomlaCB'
        },
        src: 'databases/joomlaCB.sql',
        dest: 'database.sql'
      }
    ],
    folders: [
      {
        conditions: {
          projectusage: 'joomlaCB'
        },
        src: 'src/skeletons/starterpack/general/js/',
        dest: 'src/js/partial/'
      }
    ]
  }
}

module.exports = starterpackJoomla
