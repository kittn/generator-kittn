'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var yosay = require('yosay');
var chalk = require('chalk');

var KittnGenerator = yeoman.generators.Base.extend({
  init: function () {
    this.pkg = require('../package.json');

    // this.on('end', function () {
    //   if (!this.options['skip-install']) {
    //     this.installDependencies();
    //   }
    // });
  },

  askFor: function () {
    var done = this.async();

    // Custom Greeting
    var welcome =
      '\n ' +
      '\n    /\\___/\\       '+
      '\n    ) .  . (       '+
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

    // Different Questions
    var prompts = [
      {
        type: 'input',
        name: 'projectname',
        message: 'Please give your project a name (without Spaces)',
        default: 'kittn'
      },{
        type: 'input',
        name: 'projectdescription',
        message: 'A Short description',
        default: 'undefinied'
      },{
        type: 'input',
        name: 'projectcssfilename',
        message: 'CSS Filename',
        default: 'style'
      },{
        type: 'confirm',
        name: 'projectiecompatible',
        message: 'Do you need IE8 compatibility?',
        default: false
      },{
        type: 'confirm',
        name: 'projectjquery',
        message: 'Include new (2.1.4 => y) or Old (1.11.3 => n) jQuery Version?',
        default: true
      },{
        type: 'list',
        name: 'projectstructure',
        message: 'How do you want to compile your Structure with Jade or Twig? Otherwise you can use the Copy Task to move Files from src to your dist dir.',
        choices: [
          "Jade Template",
          "Twig Template",
          "Uncompiled"
        ]
      },{
        type: 'list',
        name: 'projectUsage',
        message: 'How do you want to use Kittn? Yeoman can integrate the Toolkit for you (setting Path etc.)',
        choices: [
          "Building HTML Prototypes",
          "Integrate in CraftCMS",
          "Integrate in Wordpress",
          "Integrate in KirbyCMS"
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
      this.projectjquery = props.projectjquery;
      this.projectstructure = props.projectstructure;
      this.projectUsage = props.projectUsage;
      done();
    }.bind(this));
  },

  app: function () {

    // Move the SRC Folder

    this.directory('src/js/', 'src/js/');
    this.directory('src/style/', 'src/style/');
    this.directory('src/fonts/', 'src/fonts/');
    this.directory('src/images/', 'src/images/');
    this.directory('src/scripts/', 'src/scripts/');
    this.directory('src/.system/', 'src/.system/');
    this.directory('src/framework/', 'src/framework/');

    // Add SCSS Files with the desired Filename
    this.copy('_style.scss', 'src/style/'+this.projectcssfilename+'.scss');

    // IE8 get his own CSS File for Fallbacks
    if (this.projectiecompatible == true ) {
      this.copy('_style-ie8.scss', 'src/style/'+this.projectcssfilename+'-ie8.scss');
    }

    // Include the Jade Working Dir
    if ( this.projectstructure == 'Jade Template' ) {
      this.directory('src/jade/', 'src/template/');
      this.copy('_site-header.jade', 'src/template/parts/_site-header.jade');
      this.copy('_site-scripts.jade', 'src/template/parts/_site-scripts.jade');

    // Include the Twig Working Dir
    } else if ( this.projectstructure == 'Twig Template' ) {
      this.directory('src/twig/', 'src/template/');
      this.copy('_site-header.twig', 'src/template/parts/site-header.twig');
      this.copy('_site-scripts.twig', 'src/template/parts/site-scripts.twig');

    // As Alternative build a Uncompiled Folder - good for work on native
    // templates with PHP
    } else if ( this.projectstructure == 'Uncompiled' ) {
      this.directory('src/template/', 'src/template/');
    }
  },

  projectfiles: function () {
    this.copy('_package.json', 'package.json');
    this.copy('_config.json', 'config.json');
    this.copy('_bower.json', 'bower.json');
    this.copy('_gulpfile.js', 'gulpfile.js');
    this.copy('_defaults.scss', 'src/framework/_defaults.scss');
    this.copy('_readme.md', 'readme.md');
    this.copy('_gitignore', '.gitignore');
    this.copy('bowerrc', '.bowerrc');
    this.copy('editorconfig', '.editorconfig');
    this.copy('jshintrc', '.jshintrc');
    this.copy('todo.md', 'todo.md');
  },

  install: function () {
     //this.installDependencies();
  }
});

module.exports = KittnGenerator;
