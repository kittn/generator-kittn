'use strict';
var util = require('util');
var path = require('path');
var yosay = require('yosay');
var chalk = require('chalk');
var yeoman = require('yeoman-generator');

var KittnGenerator = yeoman.Base.extend({
  init: function () {
    this.pkg = require('../package.json');
  },

  askFor: function () {
    var done = this.async();

    // Custom Greeting
    var welcome =
      '\n ' +
      '\n    /\\___/\\       '+
      '\n    )      (       '+
      '\n   =\\     /=      .--------------------------.'+
      '\n     )   (        |   Kitty, Kitty, Kitty !  |'+
      '\n    /     \\       | ------------------------ |'+
      '\n    )     (       | Welcome to the marvelous |'+
      '\n   /       \\      |     Kittn generator!     |'+
      '\n   \\       /      |_________________________/'+
      '\n    \\__ __/'+
      '\n       ))'+
      '\n      //'+
      '\n     (('+
      '\n      \\) '+
      '\n ';
    console.log(welcome);

    // Ask something to setup the project skeleton
    var prompts = [
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
      },{
        type: 'confirm',
        name: 'projectiecompatible',
        message: 'IE8 compatibility needed?',
        default: false
      },{
        type: 'list',
        name: 'projectstructure',
        message: 'How do you want to compile your Structure with Jade or Twig? Otherwise you can use the Copy Task to move Files from src to your dist dir.',
        choices: [
          'Twig Template',
          'Jade Template',
          'Uncompiled'
        ]
      },{
        type: 'list',
        name: 'projectUsage',
        message: 'How do you want to use Kittn? Yeoman can integrate the Toolkit for you (setting Path etc.)',
        choices: [
          'Building HTML Prototypes',
          'Integrate in CraftCMS',
          'Integrate in Wordpress',
          'Integrate in KirbyCMS'
        ]
      },{
        type: 'list',
        name: 'projectquery',
        message: 'Outside from MediaQueries you can use ElementQueries or ContainerQueries',
        choices: [
          'ContainerQuery',
          'ElementQuery'
        ]
      },{
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
    ];

    // Get Data from prompts
    this.prompt(prompts, function (props) {
      this.projectname = props.projectname;
      this.projectdescription = props.projectdescription;
      this.projectversion = props.projectversion;
      this.projectauthor = props.projectauthor;
      this.projectmail = props.projectmail;
      this.projecturl = props.projecturl;
      this.projectissues = props.projectissues;
      this.projectrepo = props.projectrepo;
      this.projectcssfilename = props.projectcssfilename;
      this.projectiecompatible = props.projectiecompatible;
      this.projectstructure = props.projectstructure;
      this.projectUsage = props.projectUsage;
      this.projectquery = props.projectquery;
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
      pkg: this.pkg
    };

    // Move the SRC Folder
    this.directory('src/js/', 'src/js/');
    this.directory('src/style/', 'src/style/');
    this.directory('src/fonts/', 'src/fonts/');
    this.directory('src/images/', 'src/images/');
    this.directory('src/scripts/', 'src/scripts/');
    this.directory('src/.system/', 'src/.system/');
    this.directory('src/framework/', 'src/framework/');
    this.directory('src/gulpfile/', 'gulpfile/');

    // As Alternative build a Uncompiled Folder - good for work on native
    // templates with PHP
    this.directory('src/structure/', 'src/structure/');

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

    // Include the Jade Working Dir
    if ( this.projectstructure === 'Jade Template' ) {
      this.directory('src/jade/', 'src/template/');

      // Add the Template Header
      this.fs.copyTpl(
        this.templatePath('_site-header.jade'),
        this.destinationPath('src/template/parts/_site-header.jade'),
        templateParams
      );

      // Add the Template Footer (Script Files)
      this.fs.copyTpl(
        this.templatePath('_site-scripts.jade'),
        this.destinationPath('src/template/parts/_site-scripts.jade'),
        templateParams
      );

    // Include the Twig Working Dir
    } else if ( this.projectstructure === 'Twig Template' ) {
      this.directory('src/twig/', 'src/template/');

      // Add the Template Header
      this.fs.copyTpl(
        this.templatePath('_site-header.twig'),
        this.destinationPath('src/template/parts/site-header.twig'),
        templateParams
      );

      // Add the Template Footer (Script Files)
      this.fs.copyTpl(
        this.templatePath('_site-scripts.twig'),
        this.destinationPath('src/template/parts/site-scripts.twig'),
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
      this.templatePath('jshintrc'),
      this.destinationPath('.jshintrc'),
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
  },

  install: function () {
    this.installDependencies();
  }
});

module.exports = KittnGenerator;
