const projecttype = (context) => {
  return {
    files: [
      {
        conditions: {
          projectusage: 'craft',
          projectcredential: true
        },
        src: 'install.sh',
        dest: 'install.sh'
      },
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
        src: 'src/skeletons/craftcms/env.sh',
        dest: 'craftscripts/.env.sh'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'src/skeletons/craftcms/env/env.php',
        dest: 'src/.system/env/.env.php'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'src/skeletons/craftcms/env/example.env.php',
        dest: 'src/.system/env/example.env.php'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'src/skeletons/craftcms/public_additions/_htaccess',
        dest: 'src/.system/public/.htaccess'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'src/skeletons/craftcms/public_additions/en/_htaccess',
        dest: 'src/.system/public/en/.htaccess'
      },
      {
        conditions: {
          projectusage: 'craft'
        },
        src: 'databases/craft.sql',
        dest: 'database.sql'
      },
      {
        conditions: {
          projectusage: 'wordpress',
          projectcredential: true
        },
        src: 'install.sh',
        dest: 'install.sh'
      },
      {
        conditions: {
          projectusage: 'wordpress'
        },
        src: 'src/skeletons/wordpress/_htaccess',
        dest: 'dist/.htaccess'
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
      },
      {
        conditions: {
          projectusage: 'wordpress',
          projectcredential: true
        },
        src: 'src/skeletons/wordpress/screenshot.png',
        dest: 'src/structure/screenshot.png',
        simplecopy: true
      },
      {
        conditions: {
          projectusage: 'wordpress'
        },
        src: 'databases/wordpress.sql',
        dest: 'database.sql'
      }
    ],
    folders: [
      {
        conditions: {
          projectusage: 'html',
          projectstructure: 'twig'
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
        src: 'src/skeletons/craftcms/public',
        dest: 'src/.system/public/'
      },
      {
        conditions: {
          projectusage: 'wordpress'
        },
        src: 'src/skeletons/wordpress/structure/config',
        dest: 'src/structure/config/'
      },
      {
        conditions: {
          projectusage: 'wordpress'
        },
        src: 'src/skeletons/wordpress/structure/plugins',
        dest: 'src/structure/plugins/'
      },
      {
        conditions: {
          projectusage: 'wordpress'
        },
        src: 'src/skeletons/wordpress/structure/templates',
        dest: 'src/structure/templates/'
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
