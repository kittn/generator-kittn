'use strict';
var util = require('util');
var path = require('path');
var yosay = require('yosay');
var chalk = require('chalk');
var yeoman = require('yeoman-generator');
var mkdirp = require('mkdirp');
var clear = require("clear-terminal");

var KittnGenerator = yeoman.Base.extend({
  init: function () {
    this.pkg = require('../package.json');
  },
  askFor: function () {
    var done = this.async();
    // Custom Greeting
    var welcome =
          '\n ' + chalk.styles.cyan.open +
          '\n        ___                      ___         ___            ___      ' +
          '\n       /\\__\\          ___       /\\  \\       /\\  \\          /\\__\\     ' +
          '\n      /:/  /         /\\  \\      \\:\\  \\      \\:\\  \\        /::|  |    ' +
          '\n     /:/__/          \\:\\  \\      \\:\\  \\      \\:\\  \\      /:|:|  |    ' +
          '\n    /::\\__\\____      /::\\__\\     /::\\  \\     /::\\  \\    /:/|:|  |__  ' +
          '\n   /:/\\:::::\\__\\  __/:/\\/__/    /:/\\:\\__\\   /:/\\:\\__\\  /:/ |:| /\\__\\ ' +
          '\n   \\/_|:|~~|~    /\\/:/  /      /:/  \\/__/  /:/  \\/__/  \\/__|:|/:/  / ' +
          '\n      |:|  |     \\::/__/      /:/  /      /:/  /           |:/:/  /  ' +
          '\n      |:|  |      \\:\\__\\      \\/__/       \\/__/            |::/  /   ' +
          '\n      |:|  |       \\/__/                                   /:/  /    ' +
          '\n       \\|__|                                               \\/__/     ' +
          '\n  ' + chalk.styles.cyan.close +
          '\n                                                       V.' + chalk.bold(this.pkg.version) +
          '\n  ' +
          '\n   Authors: Sascha Fuchs (@gisugosu) ' +
          '\n   URL    : http://kittn.de   ' +
          '\n ';
    clear();
    console.log(welcome);

    // Ask something to setup the project skeleton
    return this.prompt([
      {
        type: 'input',
        name: 'projectname',
        message: 'Please give the project a name (without Spaces)',
        default: 'kittn'
      },{
        type: 'input',
        name: 'projectdescription',
        message: 'Description of the project',
        default: 'undefinied'
      },{
        type: 'input',
        name: 'projectcssfilename',
        message: 'CSS Filename (only the name without .css or .scss)',
        default: 'style'
      },
      {
        type: 'confirm',
        name: 'projecttypescript',
        message: 'Would you like javascript to be processed with Typescript instead of Babel?',
        default: false
      },
      {
        type: 'confirm',
        name: 'projectyarn',
        message: 'As an alternative to NPM, YARN can also be used to reduce installation time.\n\xa0 Yarn must be installed (https://yarnpkg.com/)',
        default: false
      },
      {
        type: 'list',
        name: 'projectstylecompiler',
        message: 'If you want to use Sass in combination with PostCSS,\n\xa0 or you only want to use PostCSS (which allows you all CSS level 4 features).  \n\xa0 PostCSS only is without the Kittn CSS Framework',
        choices: [
          'Sass with PostCSS',
          'PostCSS Only'
        ]
      },
      {
        when: function(props) {
          return props.projectstylecompiler === 'Sass with PostCSS';
        },
        type: 'list',
        name: 'projectstylesasscompiler',
        message: 'Do you want to use *.sass or *.scss?',
        choices: [
          'SCSS',
          'Sass'
        ]
      },
      {
        type: 'list',
        name: 'projectcssstructure',
        message: 'CSS Writing Methodologies',
        choices: [
          'Own Structure',
          'Atomic Design',
          'ITCSS',
          'OOCSS'
        ]
      },
      {
        type: 'list',
        name: 'projectUsage',
        message: 'For what do you want to use Kittn. The generator can then prepare the project accordingly.',
        choices: [
          'Building HTML Prototypes',
          'Integrate in CraftCMS',
          'Integrate in Wordpress'
        ]
      },
      {
        when: function(props) {
          return props.projectUsage === 'Building HTML Prototypes';
        },
        type: 'list',
        name: 'projectstructure',
        message: 'If you want to generate your HTML with Twig or do not use a compiler \n\xa0 (files like html, php, txt, etc. are only copied when the process is running)?',
        choices: [
          'Twig Template',
          'Uncompiled'
        ]
      },
      {
        when: function(props) {
          return props.projectUsage === 'Integrate in Wordpress';
        },
        type: 'confirm',
        name: 'projectwpcli',
        message: 'Do you have installed WP-CLI? (https://github.com/wp-cli/wp-cli)',
        default: false
      },
      {
        when: function(props) {
          return props.projectUsage === 'Integrate in CraftCMS';
        },
        type: 'confirm',
        name: 'projectcraftcli',
        message: 'Do you have installed Craft-CLI? (https://github.com/rsanchez/craft-cli)',
        default: false
      },
      {
        when: function(props) {
          return props.projectUsage !== 'Building HTML Prototypes';
        },
        type: 'confirm',
        name: 'projectcredential',
        message: 'Want to enter your URL and Database Credentials for your local Environment?',
        default: false
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'list',
        name: 'credentialprotocol',
        message: 'HTTP or HTTPS?',
        choices: [
          'http',
          'https'
        ]
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdomain',
        message: 'Domain without HTTP or HTTPS',
        default: 'localhost'
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbserver',
        message: 'Database Server Host without ending slash',
        default: 'localhost'
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbuser',
        message: 'Database User',
        default: 'root'
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbpass',
        message: 'Database Password',
        default: 'root'
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbdatabase',
        message: 'Database Name',
        default: ''
      },
      {
        type: 'confirm',
        name: 'projectiecompatible',
        message: 'IE8 compatibility needed?',
        default: false
      },
      {
        type: 'list',
        name: 'projectquery',
        message: 'In addition to the media queries, Element Queries (https://github.com/marcj/css-element-queries) \n\xa0 or Container Queries (https://github.com/ausi/cq-prolyfill) can be integrated.',
        choices: [
          'Native MediaQuery',
          'ContainerQuery',
          'ElementQuery'
        ]
      },{
        type: 'confirm',
        name: 'projectjquery',
        message: 'Want to use jQuery?',
        default: false
      },{
        type: 'confirm',
        name: 'projectvue',
        message: 'Want to use Vue.js?',
        default: false
      },
      {
        when: function(props) {
          return props.projectvue === true;
        },
        type: 'list',
        name: 'projectvueversion',
        message: 'Vue Version. When you only use .vue Files Runtime is perfect,\n\xa0 if you need parsing from .html Files you need the Standalone Version.',
        choices: [
          'Runtime-Only',
          'Standalone'
        ]
      },
      {
        type: 'input',
        name: 'projectversion',
        message: 'The Version Number',
        default: '0.0.1'
      },{
        type: 'input',
        name: 'projectauthor',
        message: 'Project Author Name or Company',
        default: 'undefinied'
      },{
        type: 'input',
        name: 'projectmail',
        message: 'Mailadress from the Author',
        default: 'undefined'
      },{
        type: 'input',
        name: 'projecturl',
        message: 'Author URL',
        default: 'http://........'
      },{
        type: 'input',
        name: 'projectrepo',
        message: 'URL to the Git-Repo',
        default: 'http://........'
      }
    ]).then(function (props) {
      function checkAnswer(prop) {
        if (prop) {
          return prop
        } else {
          return false
        }
      }

      this.projectname          = props.projectname;
      this.projectdescription   = props.projectdescription;
      this.projectversion       = props.projectversion;
      this.projectauthor        = props.projectauthor;
      this.projectmail          = props.projectmail;
      this.projecturl           = props.projecturl;
      this.projectissues        = props.projectissues;
      this.projectrepo          = props.projectrepo;
      this.projectcssfilename   = props.projectcssfilename;
      this.projectiecompatible  = props.projectiecompatible;
      this.projectstructure     = checkAnswer(props.projectstructure);
      this.projectUsage         = props.projectUsage;
      this.projectquery         = props.projectquery;
      this.projectjquery        = props.projectjquery;
      this.projectvue           = props.projectvue;
      this.projectcssstructure  = props.projectcssstructure;
      this.projectvueversion    = checkAnswer(props.projectvueversion);
      this.projectyarn          = props.projectyarn;
      this.projectwpcli         = props.projectwpcli;
      this.projectcraftcli      = props.projectcraftcli;
      this.projectcredential    = props.projectcredential;
      this.credentialprotocol   = props.credentialprotocol;
      this.credentialdomain     = props.credentialdomain;
      this.credentialdbserver   = props.credentialdbserver;
      this.credentialdbuser     = props.credentialdbuser;
      this.credentialdbpass     = props.credentialdbpass;
      this.credentialdbdatabase = props.credentialdbdatabase;
      this.projectstylecompiler = props.projectstylecompiler;
      this.projectstylesasscompiler = props.projectstylesasscompiler;
      this.projecttypescript    = props.projecttypescript;

      done();
    }.bind(this));
  },

  app: function () {

    // Add the Template Vars for the Process
    var templateParams = {
      projectname          : this.projectname,
      projectdescription   : this.projectdescription,
      projectversion       : this.projectversion,
      projectauthor        : this.projectauthor,
      projectmail          : this.projectmail,
      projecturl           : this.projecturl,
      projectissues        : this.projectissues,
      projectrepo          : this.projectrepo,
      projectcssfilename   : this.projectcssfilename,
      projectiecompatible  : this.projectiecompatible,
      projectstructure     : this.projectstructure,
      projectUsage         : this.projectUsage,
      projectquery         : this.projectquery,
      projectjquery        : this.projectjquery,
      projectvue           : this.projectvue,
      projectcssstructure  : this.projectcssstructure,
      projectvueversion    : this.projectvueversion,
      projectyarn          : this.projectyarn,
      projectcraftcli      : this.projectcraftcli,
      projectwpcli         : this.projectwpcli,
      projectcredential    : this.projectcredential,
      credentialprotocol   : this.credentialprotocol,
      credentialdomain     : this.credentialdomain,
      credentialdbserver   : this.credentialdbserver,
      credentialdbuser     : this.credentialdbuser,
      credentialdbpass     : this.credentialdbpass,
      credentialdbdatabase : this.credentialdbdatabase,
      projectstylecompiler : this.projectstylecompiler,
      projectstylesasscompiler : this.projectstylesasscompiler,
      projecttypescript    : this.projecttypescript,
      pkg: this.pkg
    };

    // Move the SRC Folder
    mkdirp.sync('dist/');
    this.directory('src/js/', 'src/js/');
    this.directory('src/fonts/', 'src/fonts/');
    this.directory('src/images/', 'src/images/');
    this.directory('src/scripts/', 'src/scripts/');
    this.directory('src/.system/', 'src/.system/');
    this.directory('src/gulpfile/', 'gulpfile/');

    // Copy the CSS Structure
    switch(this.projectcssstructure) {
      case 'Atomic Design':
        this.directory('src/skeletons/css/atomic', 'src/style/application/');

        if ( this.projectstylesasscompiler === 'SCSS') {
          this.template('src/skeletons/css/_application_atomic.scss', 'src/style/application/_application.scss', templateParams);
        } else {
          this.template('src/skeletons/css/_application_atomic.scss', 'src/style/application/_application.sass', templateParams);
        }

        if ( this.projectstylecompiler === 'PostCSS Only' ) {
          this.fs.copyTpl(
            this.templatePath('_postcss-elements.css'),
            this.destinationPath('src/style/application/utilities/_elements.css'),
            templateParams
          );
        }
        break

      case 'ITCSS':
        this.directory('src/skeletons/css/itcss', 'src/style/application/')

        if ( this.projectstylesasscompiler === 'SCSS') {
          this.template('src/skeletons/css/_application_itcss.scss', 'src/style/application/_application.scss', templateParams);
        } else {
          this.template('src/skeletons/css/_application_itcss.scss', 'src/style/application/_application.sass', templateParams);
        }

        if ( this.projectstylecompiler === 'PostCSS Only' ) {
          this.fs.copyTpl(
            this.templatePath('_postcss-elements.css'),
            this.destinationPath('src/style/application/generic/_elements.css'),
            templateParams
          );
        }

        break

      case 'OOCSS':
        this.directory('src/skeletons/css/oocss', 'src/style/application/')

        if ( this.projectstylesasscompiler === 'SCSS') {
          this.template('src/skeletons/css/_application_oocss.scss', 'src/style/application/_application.scss', templateParams);
        } else {
          this.template('src/skeletons/css/_application_oocss.scss', 'src/style/application/_application.sass', templateParams);
        }

        if ( this.projectstylecompiler === 'PostCSS Only' ) {
          this.fs.copyTpl(
            this.templatePath('_postcss-elements.css'),
            this.destinationPath('src/style/application/utilities/_elements.css'),
            templateParams
          );
        }
        break

      default:
        this.directory('src/skeletons/css/own', 'src/style/application/')

        if ( this.projectstylesasscompiler === 'SCSS') {
          this.template('src/skeletons/css/_application_own.scss', 'src/style/application/_application.scss', templateParams);
        } else {
          this.template('src/skeletons/css/_application_own.scss', 'src/style/application/_application.sass', templateParams);
        }

        if ( this.projectstylecompiler === 'PostCSS Only' ) {
          this.fs.copyTpl(
            this.templatePath('_postcss-elements.css'),
            this.destinationPath('src/style/application/_elements.css'),
            templateParams
          );
        }
        break
    }

    // Delete _application.scss from Structure dir, if PostCSS is active
    if ( this.projectstylecompiler === 'PostCSS Only' ) {
      this.fs.delete('src/style/application/_application.scss')
    }

    if ( this.projectstylecompiler === 'Sass with PostCSS' ) {
      this.directory('src/framework/', 'src/framework/');

      if ( this.projectstylesasscompiler === 'SCSS') {
        this.directory('src/scssstyle/', 'src/style/');
      } else {
        this.directory('src/sassstyle/', 'src/style/');
      }

      // Copy Gulp Task for Sprite Building
      this.fs.copyTpl(
        this.templatePath('_sass-build-bitmapsprite.js'),
        this.destinationPath('gulpfile/tasks/build-bitmapsprite.js'),
        templateParams
      );

      // Copy the Style Generator Task
      this.fs.copyTpl(
        this.templatePath('_sass-compile-css.js'),
        this.destinationPath('gulpfile/tasks/compile-css.js'),
        templateParams
      );


      // Check CSS Filename
      var cssFileName = this.projectcssfilename;
      if (this.projectUsage === 'Integrate in Wordpress' && this.projectcssfilename === 'style') {
        cssFileName = 'wp-style';
      }

      if ( this.projectstylesasscompiler === 'SCSS') {
        // Add SCSS Files with the desired Filename
        this.fs.copyTpl(
          this.templatePath('_style.scss'),
          this.destinationPath('src/style/'+cssFileName+'.scss'),
          templateParams
        );
      } else {
        // Add Sass Files with the desired Filename
        this.fs.copyTpl(
          this.templatePath('_style.sass'),
          this.destinationPath('src/style/'+cssFileName+'.sass'),
          templateParams
        );
      }

      // IE8 get his own CSS File for Fallbacks
      if (this.projectiecompatible === true ) {
        if ( this.projectstylesasscompiler === 'SCSS') {
          this.fs.copyTpl(
            this.templatePath('_style-ie8.scss'),
            this.destinationPath('src/style/'+cssFileName+'-ie8.scss'),
            templateParams
          );
        } else {
          this.fs.copyTpl(
            this.templatePath('_style-ie8.sass'),
            this.destinationPath('src/style/'+cssFileName+'-ie8.sass'),
            templateParams
          );
        }
      }

    } else {
      this.directory('src/postcssstyle/', 'src/style/');

      // Copy Gulp Task for Sprite Building
      this.fs.copyTpl(
        this.templatePath('_postcss-build-bitmapsprite.js'),
        this.destinationPath('gulpfile/tasks/build-bitmapsprite.js'),
        templateParams
      );

      // Copy the Style Generator Task
      this.fs.copyTpl(
        this.templatePath('_sass-compile-postcss.js'),
        this.destinationPath('gulpfile/tasks/compile-css.js'),
        templateParams
      );

      // Add SCSS Files with the desired Filename
      this.fs.copyTpl(
        this.templatePath('_style-postcss.css'),
        this.destinationPath('src/style/'+this.projectcssfilename+'.css'),
        templateParams
      );

      // IE8 get his own CSS File for Fallbacks
      if (this.projectiecompatible === true ) {
        this.fs.copyTpl(
          this.templatePath('_style-postcss-ie8.css'),
          this.destinationPath('src/style/'+this.projectcssfilename+'-ie8.css'),
          templateParams
        );
      }
    }

    // Put Craft Base Files in Structure or simple Structure Files
    if ( this.projectUsage === 'Integrate in CraftCMS' ) {
      this.directory('src/skeletons/craftcms/', 'src/structure/');

      // Add Server Credentials
      if ( this.projectcredential ) {
        this.fs.copyTpl(
          this.templatePath('_craft-db.php'),
          this.destinationPath('src/structure/config/db.php'),
          templateParams
        );

        this.fs.copyTpl(
          this.templatePath('_craft-general.php'),
          this.destinationPath('src/structure/config/general.php'),
          templateParams
        );
      }

    } else if ( this.projectUsage === 'Integrate in Wordpress' ) {
      this.directory('src/skeletons/wordpress/', 'src/structure/');

      // Add Server Credentials
      if ( this.projectcredential ) {
        this.fs.copyTpl(
          this.templatePath('_wp-db--local.php'),
          this.destinationPath('src/structure/config/wp-config/wp-db--local.php'),
          templateParams
        );
        this.fs.copyTpl(
          this.templatePath('_wp-config-sample.php'),
          this.destinationPath('src/structure/config/wp-config-sample.php'),
          templateParams
        );
      }

    } else {
      this.directory('src/skeletons/simplestructure', 'src/structure/');
    }

    // Include the Twig Working Dir
    if ( this.projectstructure === 'Twig Template' ) {
      this.directory('src/skeletons/twig/', 'src/template/');
    }

    if ( this.projectvue === true ) {
      this.directory('src/skeletons/vue/components/', 'src/js/components/');
      this.directory('src/skeletons/vue/vuex/', 'src/js/store/');
      this.directory('src/build/', 'build/');

      this.fs.copyTpl(
        this.templatePath('_app.vue'),
        this.destinationPath('src/js/app.vue'),
        templateParams
      );
    }

    // Copy Typescript Starter File
    if (this.projecttypescript) {
      this.fs.copyTpl(
        this.templatePath('_app.ts'),
        this.destinationPath('src/js/app.ts'),
        templateParams
      );
    }

    // Include some other important files
    this.fs.copyTpl(
      this.templatePath('_package.json'),
      this.destinationPath('package.json'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_config.json'),
      this.destinationPath('config.json'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_bower.json'),
      this.destinationPath('bower.json'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_gulpfile.babel.js'),
      this.destinationPath('gulpfile.babel.js'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_readme.md'),
      this.destinationPath('readme.md'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_gitignore'),
      this.destinationPath('.gitignore'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('bowerrc'),
      this.destinationPath('.bowerrc'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('editorconfig'),
      this.destinationPath('.editorconfig'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('nvmrc'),
      this.destinationPath('.nvmrc'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('babelrc'),
      this.destinationPath('.babelrc'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('eslintrc'),
      this.destinationPath('.eslintrc'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_webpack.config.babel.js'),
      this.destinationPath('webpack.config.babel.js'),
      templateParams
    );
  },

  install: function () {
    if (this.projectyarn) {
      var done = this.async();
      this.spawnCommand('yarn').on('close', done);
    } else {
      this.installDependencies({
        bower: false,
        npm: true
      });
    }

    // Put Craft Base Files in Structure or simple Structure Files
    if ( this.projectUsage === 'Integrate in CraftCMS' ) {
      if ( this.projectcraftcli ) {
        var done = this.async();
        this.spawnCommand('craft', ['install', './dist/']).on('close', done);
      }
    } else if ( this.projectUsage === 'Integrate in Wordpress' ) {
      if ( this.projectwpcli ) {
        var done = this.async();
        this.spawnCommand('wp', ['core', 'download', '--path=dist', '--locale=de_DE']).on('close', done);

      }
    }
  }
});

module.exports = KittnGenerator;
