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
          '\n    \\__ __/                          v3.80.10' +
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
          'Integrate in Wordpress',
          'Integrate in KirbyCMS'
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

      this.projectname         = props.projectname;
      this.projectdescription  = props.projectdescription;
      this.projectversion      = props.projectversion;
      this.projectauthor       = props.projectauthor;
      this.projectmail         = props.projectmail;
      this.projecturl          = props.projecturl;
      this.projectissues       = props.projectissues;
      this.projectrepo         = props.projectrepo;
      this.projectcssfilename  = props.projectcssfilename;
      this.projectiecompatible = props.projectiecompatible;
      this.projectstructure    = checkAnswer(props.projectstructure);
      this.projectUsage        = props.projectUsage;
      this.projectquery        = props.projectquery;
      this.projectjquery       = props.projectjquery;
      this.projectvue          = props.projectvue;
      this.projectcssstructure = props.projectcssstructure;
      this.projectvueversion   = props.projectvueversion;
      this.projectyarn         = props.projectyarn;
      done();
    }.bind(this));
  },

  app: function () {

    // Add the Template Vars for the Process
    var templateParams = {
      projectname : this.projectname,
      projectdescription : this.projectdescription,
      projectversion : this.projectversion,
      projectauthor : this.projectauthor,
      projectmail : this.projectmail,
      projecturl : this.projecturl,
      projectissues : this.projectissues,
      projectrepo : this.projectrepo,
      projectcssfilename : this.projectcssfilename,
      projectiecompatible : this.projectiecompatible,
      projectstructure : this.projectstructure,
      projectUsage : this.projectUsage,
      projectquery : this.projectquery,
      projectjquery : this.projectjquery,
      projectvue : this.projectvue,
      projectcssstructure: this.projectcssstructure,
      projectvueversion: this.projectvueversion,
      projectyarn: this.projectyarn,
      pkg: this.pkg
    };

    // Move the SRC Folder
    mkdirp.sync('dist/');
    this.directory('src/js/', 'src/js/');
    this.directory('src/style/', 'src/style/');
    this.directory('src/fonts/', 'src/fonts/');
    this.directory('src/images/', 'src/images/');
    this.directory('src/scripts/', 'src/scripts/');
    this.directory('src/.system/', 'src/.system/');
    this.directory('src/framework/', 'src/framework/');
    this.directory('src/gulpfile/', 'gulpfile/');

    // Put Craft Base Files in Structure or simple Structure Files
    if ( this.projectUsage === 'Integrate in CraftCMS' ) {
      this.directory('src/craftstructure/', 'src/structure/');
    } else if ( this.projectUsage === 'Integrate in Wordpress' ) {
      this.directory('src/wpstructure/', 'src/.system/wordpress/');
    } else {
      this.directory('src/structure/', 'src/structure/');
    }

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

    // Copy the CSS Structure
    switch(this.projectcssstructure) {
      case 'Atomic Design':
        this.directory('src/cssstructures/atomic', 'src/style/application/')
        break

      case 'ITCSS':
        this.directory('src/cssstructures/itcss', 'src/style/application/')
        break

      case 'OOCSS':
        this.directory('src/cssstructures/oocss', 'src/style/application/')
        break

      default:
        this.directory('src/cssstructures/own', 'src/style/application/')
        break
    }

    // Include the Twig Working Dir
    if ( this.projectstructure === 'Twig Template' ) {
      this.directory('src/twig/', 'src/template/');

      // Add the Template Header
      this.fs.copyTpl(
        this.templatePath('_site-header.twig'),
        this.destinationPath('src/template/parts/_site-header.twig'),
        templateParams
      );

      // Add the Template Footer (Script Files)
      this.fs.copyTpl(
        this.templatePath('_site-scripts.twig'),
        this.destinationPath('src/template/parts/_site-scripts.twig'),
        templateParams
      );
    }


    if ( this.projectUsage === 'Integrate in CraftCMS' ) {
      this.fs.copyTpl(
        this.templatePath('_document-header.html'),
        this.destinationPath('src/structure/templates/_parts/document-header.html'),
        templateParams
      );
    }

    if ( this.projectvue === true ) {
      this.directory('src/vue-components/', 'src/js/components/');
      this.directory('src/vuex/', 'src/js/store/');

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
      this.templatePath('_defaults.scss'),
      this.destinationPath('src/framework/_defaults.scss'),
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
      this.templatePath('_templateFiles.js'),
      this.destinationPath('gulpfile/lib/templateFiles.js'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_compile-html.js'),
      this.destinationPath('gulpfile/tasks/compile-html.js'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_app.js'),
      this.destinationPath('src/js/app.js'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_browsersync.js'),
      this.destinationPath('gulpfile/tasks/browsersync.js'),
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
      this.spawnCommand('yarn');
    } else {
      this.installDependencies({
        bower: false,
        npm: true
      });
    }
  }
});

module.exports = KittnGenerator;
