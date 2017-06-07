const projecttype = (context) => {
  return {
    files: [
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'gulpfile_additions/copy-craftenv.js',
        dest: 'gulpfile/tasks/copy-craftenv.js'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'gulpfile_additions/copy-craftindex.js',
        dest: 'gulpfile/tasks/copy-craftindex.js'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'gulpfile_additions/copy-craftplugins.js',
        dest: 'gulpfile/tasks/copy-craftplugins.js'
      },
      {
        conditions: {
          projectusage: 'craft',
          projectcredential: true
        },
        src: 'src/skeletons/craftcms/.env.sh',
        dest: 'craftscripts/.env.sh'
      }
    ],
    folders: [
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'src/skeletons/craftcms/structure',
        dest: 'src/structure/'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'src/skeletons/craftcms/craftplugins',
        dest: 'src/craftplugins/'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'src/skeletons/craftcms/craftscripts',
        dest: 'craftscripts/'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'src/skeletons/craftcms/env',
        dest: 'src/.system/env/'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'src/skeletons/craftcms/public',
        dest: 'src/.system/public/'
      }
    ]
  }
}

module.exports = projecttype
