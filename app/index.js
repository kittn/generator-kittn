'use strict';
var util = require('util');
var path = require('path');
var yosay = require('yosay');
var chalk = require('chalk');
var yeoman = require('yeoman-generator');
var mkdirp = require('mkdirp');

var KittnGenerator = yeoman.Base.extend({
  init: function () {
    this.pkg = require('../package.json');
  },
  askFor: function () {
    var done = this.async();

    // Custom Greeting
    var welcome =
          '\n ' +
          '\n    /\\___/\\       ' +
          '\n    )      (       ' +
          '\n   =\\     /=      .--------------------------.' +
          '\n     )   (        |   Kitty, Kitty, Kitty !  |' +
          '\n    /     \\       | ------------------------ |' +
          '\n    )     (       | Welcome to the marvelous |' +
          '\n   /       \\      |     kittn generator!     |' +
          '\n   \\       /      |_________________________/' +
          '\n    \\__ __/                          v' + this.pkg.version +
          '\n       ))' +
          '\n      //' +
          '\n     ((' +
          '\n      \\) ' +
          '\n ';
    console.log(welcome);

    // Ask something to setup the project skeleton
    return this.prompt([
      {
        type: 'input',
        name: 'projectname',
        message: 'Please give your project a name (without Spaces)',
        default: 'kittn'
      },{
        type: 'input',
        name: 'projectdescription',
        message: 'Project description',
        default: 'undefinied'
      },{
        type: 'input',
        name: 'projectcssfilename',
        message: 'Filename for the CSS File (without fileending)',
        default: 'style'
      },
      {
        type: 'list',
        name: 'projectstylecompiler',
        message: 'Do you want to use Sass and PostCSS in a Mixed Compiler, or do you want to use PostCSS only (for using CSS Level 4 Features). PostCSS only is without the Kittn CSS Framework',
        choices: [
          'Sass with PostCSS',
          'PostCSS Only'
        ]
      },
      {
        type: 'list',
        name: 'projectcssstructure',
        message: 'CSS Style Structure',
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
        message: 'How do you want to use Kittn? Yeoman can integrate the Toolkit for you (setting Path etc.)',
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
        message: 'Do you want to compile your Structure with Twig, or you want to use a vanilla (html, php) Structure Files?',
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
        message: 'Do you have installed WP-CLI? (for automatic install)',
        default: false
      },
      {
        when: function(props) {
          return props.projectUsage === 'Integrate in CraftCMS';
        },
        type: 'confirm',
        name: 'projectcraftcli',
        message: 'Do you have installed Craft-CLI? (for automatic install)',
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
        message: 'HTTP or HTTPS',
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
        message: 'DB Server Host without ending slash',
        default: 'localhost'
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbuser',
        message: 'DB User',
        default: 'root'
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbpass',
        message: 'DB Password',
        default: 'root'
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbdatabase',
        message: 'DB Database',
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
        message: 'Outside from MediaQueries you can use ElementQueries or ContainerQueries',
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
        message: 'Vue Version. When you only use .vue Files Runtime is perfect, if you need parsing from .html Files you need the Standalone Version.',
        choices: [
          'Runtime-Only',
          'Standalone'
        ]
      },
      {
        type: 'confirm',
        name: 'projectyarn',
        message: 'Do you want to use Yarn Package Manager? (https://yarnpkg.com/)',
        default: false
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
        this.directory('src/skeletons/css/atomic', 'src/style/application/')
        break

      case 'ITCSS':
        this.directory('src/skeletons/css/itcss', 'src/style/application/')
        break

      case 'OOCSS':
        this.directory('src/skeletons/css/oocss', 'src/style/application/')
        break

      default:
        this.directory('src/skeletons/css/own', 'src/style/application/')
        break
    }

    // Delete _application.scss from Structure dir, if PostCSS is active
    if ( this.projectstylecompiler === 'PostCSS Only' ) {
      this.fs.delete('src/style/application/_application.scss')
    }

    if ( this.projectstylecompiler === 'Sass with PostCSS' ) {
      this.directory('src/framework/', 'src/framework/');
      this.directory('src/sassstyle/', 'src/style/');

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

      // Add SCSS Files with the desired Filename
      this.fs.copyTpl(
        this.templatePath('_style.scss'),
        this.destinationPath('src/style/'+this.projectcssfilename+'.scss'),
        templateParams
      );

      // IE8 get his own CSS File for Fallbacks
      if (this.projectiecompatible === true ) {
        this.fs.copyTpl(
          this.templatePath('_style-ie8.scss'),
          this.destinationPath('src/style/'+this.projectcssfilename+'-ie8.scss'),
          templateParams
        );
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
      this.directory('src/skeletons/simplesstructure/', 'src/structure/');
    }



    // Include the Twig Working Dir
    if ( this.projectstructure === 'Twig Template' ) {
      this.directory('src/skeletons/twig/', 'src/template/');
    }

    if ( this.projectvue === true ) {
      this.directory('src/skeletons/vue/components/', 'src/js/components/');
      this.directory('src/skeletons/vue/vuex/', 'src/js/store/');

      this.fs.copyTpl(
        this.templatePath('_app.vue'),
        this.destinationPath('src/js/app.vue'),
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
