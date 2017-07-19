const starterpackWordpress = (context) => {
  return {
    files: [
      {
        conditions: {
          projectusage: 'wordpressCB',
        },
        src: '_stylelintrcCB',
        dest: '.stylelintrc'
      },
      {
        conditions: {
          projectusage: 'wordpressCB',
          projectcredential: true
        },
        src: 'install.sh',
        dest: 'install.sh'
      },
      {
        conditions: {
          projectusage: 'wordpressCB'
        },
        src: 'src/framework_additions/_normalize.scss',
        dest: 'src/framework/partials/_normalize.scss'
      },
      {
        conditions: {
          projectusage: 'wordpressCB',
        },
        src: 'databases/wordpressCB.sql',
        dest: 'database.sql'
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
          projectusage: 'wordpressCB'
        },
        src: 'gulpfile_additions/copy-wpconfig.js',
        dest: 'gulpfile/tasks/copy-wpconfig.js'
      },
      {
        conditions: {
          projectusage: 'wordpressCB'
        },
        src: 'gulpfile_additions/copy-wpplugins.js',
        dest: 'gulpfile/tasks/copy-wpplugins.js'
      },
      {
        conditions: {
          projectusage: 'wordpressCB',
          projectcredential: true
        },
        src: 'src/skeletons/wordpress/wp-db--local.php',
        dest: 'src/structure/config/wp-config/wp-db--local.php'
      },
      {
        conditions: {
          projectusage: 'wordpressCB',
          projectcredential: true
        },
        src: 'src/skeletons/wordpress/wp-config-sample.php',
        dest: 'src/structure/config/wp-config.php'
      },
      {
        conditions: {
          projectusage: 'wordpressCB',
          projectcredential: true
        },
        src: 'src/skeletons/wordpress/screenshot.png',
        dest: 'src/structure/screenshot.png',
        simplecopy: true
      },
      {
        conditions: {
          projectusage: 'wordpressCB'
        },
        src: 'src/skeletons/starterpack/wordpress/contentbuilder.json',
        dest: 'acf-contentbuilder.json'
      },
      {
        conditions: {
          projectusage: 'wordpressCB'
        },
        src: 'src/skeletons/starterpack/wordpress/adminimize-settings.json',
        dest: 'adminimize-settings.json'
      }
    ],
    folders: [
      {
        conditions: {
          projectusage: 'wordpress'
        },
        src: 'src/skeletons/wordpress/structure/config',
        dest: 'src/structure/config/'
      },
      {
        conditions: {
          projectusage: 'wordpressCB'
        },
        src: 'src/skeletons/starterpack/wordpress/structure/templates',
        dest: 'src/structure/templates/'
      },
      {
        conditions: {
          projectusage: 'wordpressCB'
        },
        src: 'src/skeletons/starterpack/wordpress/structure/plugins',
        dest: 'src/structure/plugins/',
        simplecopy: true
      },
      {
        conditions: {
          projectusage: 'wordpressCB'
        },
        src: 'src/skeletons/starterpack/general/js/',
        dest: 'src/js/partial/'
      },
      {
        conditions: {
          projectusage: 'wordpressCB'
        },
        src: 'src/skeletons/starterpack/wordpress/style/',
        dest: 'src/style/'
      }
    ]
  }
}

module.exports = starterpackWordpress
