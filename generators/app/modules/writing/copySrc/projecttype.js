const projecttype = context => {
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
        src: 'contentBuilder_stuff/databases/craft.sql',
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
        src: 'contentBuilder_stuff/databases/wordpress.sql',
        dest: 'database.sql'
      },
      {
        conditions: {
          projectusage: 'joomla',
          projectcredential: true
        },
        src: 'install.sh',
        dest: 'install.sh'
      },
      {
        conditions: {
          projectusage: 'joomla'
        },
        src: 'gulpfile_additions/copy-joomlafiles.js',
        dest: 'gulpfile/tasks/copy-joomlafiles.js'
      },
      {
        conditions: {
          projectusage: 'joomla'
        },
        src: 'src/skeletons/joomla/_htaccess',
        dest: 'dist/.htaccess'
      },
      {
        conditions: {
          projectusage: 'joomla',
          projectcredential: true
        },
        src: 'src/skeletons/joomla/configuration-sample.php',
        dest: 'dist/configuration.php'
      },
      {
        conditions: {
          projectusage: 'joomla'
        },
        src: 'src/skeletons/joomla/template_additions/language/de-DE/de-DE.tpl_projectname.ini',
        dest: `src/structure/templates/${context.props.projectname}/language/de-DE/de-DE.tpl_${context.props.projectname}.ini`,
      },
      {
        conditions: {
          projectusage: 'joomla'
        },
        src: 'src/skeletons/joomla/template_additions/language/de-DE/de-DE.tpl_projectname.sys.ini',
        dest: `src/structure/templates/${context.props.projectname}/language/de-DE/de-DE.tpl_${context.props.projectname}.sys.ini`,
      },
      {
        conditions: {
          projectusage: 'joomla'
        },
        src: 'src/skeletons/joomla/template_additions/language/en-GB/en-GB.tpl_projectname.ini',
        dest: `src/structure/templates/${context.props.projectname}/language/en-GB/en-GB.tpl_${context.props.projectname}.ini`,
      },
      {
        conditions: {
          projectusage: 'joomla'
        },
        src: 'src/skeletons/joomla/template_additions/language/en-GB/en-GB.tpl_projectname.sys.ini',
        dest: `src/structure/templates/${context.props.projectname}/language/en-GB/en-GB.tpl_${context.props.projectname}.sys.ini`,
      },
      {
        conditions: {
          projectusage: 'joomla'
        },
        src: 'contentBuilder_stuff/databases/joomla.sql',
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
          projectusage: 'joomla'
        },
        src: 'src/skeletons/joomla/structure/templates',
        dest: `src/structure/templates/${context.props.projectname}/`
      },
      {
        conditions: {
          projectusage: 'joomla'
        },
        src: 'src/skeletons/joomla/structure/plugins',
        dest: 'src/structure/plugins/'
      },
      {
        orConditions: [
          {
            projectstructure: 'uncompiled'
          },
          {
            projectusage: 'webpackApp'
          }
        ],
        src: 'src/skeletons/simplestructure',
        dest: 'src/structure/'
      }
    ]
  }
};

module.exports = projecttype
