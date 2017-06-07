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
      },
      {
        conditions: {
          projectusage: 'wordpress'
        },
        src: 'gulpfile_additions/copy-wpconfig.js',
        dest: 'gulpfile/tasks/copy-wpconfig.js'
      },
      {
        conditions: {
          projectusage: 'wordpress'
        },
        src: 'gulpfile_additions/copy-wpplugins.js',
        dest: 'gulpfile/tasks/copy-wpplugins.js'
      },
      {
        conditions: {
          projectusage: 'wordpress',
          projectcredential: true
        },
        src: 'src/skeletons/wordpress/wp-db--local.php',
        dest: 'src/structure/config/wp-config/wp-db--local.php'
      },
      {
        conditions: {
          projectusage: 'wordpress',
          projectcredential: true
        },
        src: 'src/skeletons/wordpress/wp-config-sample.php',
        dest: 'src/structure/config/wp-config.php'
      }
    ],
    folders: [
      {
        conditions: {
          projectusage: 'html'
        },
        src: 'src/skeletons/twig',
        dest: 'src/template/'
      },
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
      },
      {
        conditions: {
          projectusage: 'wordpress'
        },
        src: 'src/skeletons/wordpress/structure',
        dest: 'src/structure/'
      },
      {
        conditions: {
          projectstructure: 'uncompiled'
        },
        src: 'src/skeletons/simplestructure',
        dest: 'src/structure/'
      }
    ]
  }
}

module.exports = projecttype
