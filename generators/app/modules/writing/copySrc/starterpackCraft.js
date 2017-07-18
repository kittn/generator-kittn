const starterpackCraft = (context) => {
  return {
    files: [
      {
        conditions: {
          projectusage: 'craftCB',
          projectcredential: true
        },
        src: 'install.sh',
        dest: 'install.sh'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/framework_additions/_normalize.scss',
        dest: 'src/framework/partials/_normalize.scss'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'gulpfile_additions/copy-craftenv.js',
        dest: 'gulpfile/tasks/copy-craftenv.js'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'gulpfile_additions/copy-craftindex.js',
        dest: 'gulpfile/tasks/copy-craftindex.js'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'gulpfile_additions/copy-craftplugins.js',
        dest: 'gulpfile/tasks/copy-craftplugins.js'
      },
      {
        conditions: {
          projectusage: 'craftCB',
          projectcredential: true
        },
        src: 'src/skeletons/craftcms/env.sh',
        dest: 'craftscripts/.env.sh'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/craftcms/env/env.php',
        dest: 'src/.system/env/.env.php'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/craftcms/env/example.env.php',
        dest: 'src/.system/env/example.env.php'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/craftcms/public_additions/_htaccess',
        dest: 'src/.system/public/.htaccess'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/craftcms/public_additions/en/_htaccess',
        dest: 'src/.system/public/en/.htaccess'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'databases/craftCB.sql',
        dest: 'database.sql'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/starterpack/craftcms/contentbuilder.json',
        dest: 'contentbuilder.json'
      }
    ],
    folders: [
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/craftcms/structure',
        dest: 'src/structure/'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/craftcms/craftscripts',
        dest: 'craftscripts/'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/craftcms/public',
        dest: 'src/.system/public/'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/starterpack/craftcms/structure/config/',
        dest: 'src/structure/config/'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/starterpack/craftcms/structure/templates/',
        dest: 'src/structure/templates/'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/starterpack/craftcms/structure/craftplugins/',
        dest: 'src/craftplugins/',
        simplecopy: true
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/starterpack/general/js/',
        dest: 'src/js/partial/'
      },
      {
        conditions: {
          projectusage: 'craftCB'
        },
        src: 'src/skeletons/starterpack/craftcms/style/',
        dest: 'src/style/'
      }
    ]
  }
}

module.exports = starterpackCraft
