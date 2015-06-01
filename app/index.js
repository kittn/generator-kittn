'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var yosay = require('yosay');
var chalk = require('chalk');


var KittnGenerator = yeoman.generators.Base.extend({
  init: function () {
    this.pkg = require('../package.json');

    this.on('end', function () {
      if (!this.options['skip-install']) {
        this.installDependencies();
      }
    });
  },

  askFor: function () {
    var done = this.async();

    // Custom Greeting
    var welcome =
      '\n ' +
      '\n    /\\___/\\       '+
      '\n    )     (       '+
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
        message: 'Include new (2.1.4 => y) or Old (1.9.3 => n) jQuery Version?',
        default: true
      },{
        type: 'confirm',
        name: 'projectjade',
        message: 'Do you want to use Jade as HTML Compiler?',
        default: true
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
      this.projectjade = props.projectjade;
      this.projectUsage = props.projectUsage;
      done();
    }.bind(this));
  },

  app: function () {
    this.mkdir('src/sass');
    this.mkdir('src/jade/templatepart');
    this.directory('src/', 'src/');
    this.copy('_style.scss', 'src/sass/'+this.projectcssfilename+'.scss');
    if (this.projectiecompatible == 'y') {
      this.copy('_style-ie8.scss', 'src/sass/'+this.projectcssfilename+'-ie8.scss');
    }
    this.copy('_default-page-header.jade', 'src/jade/templatepart/_default-page-header.jade');
    this.copy('_default-page-scripts.jade', 'src/jade/templatepart/_default-page-scripts.jade');
    this.copy('_package.json', 'package.json');
    this.copy('_bower.json', 'bower.json');
    this.copy('_gulpfile.js', 'gulpfile.js');
    this.copy('_setup.scss', 'src/sass/_setup.scss');
  },

  projectfiles: function () {
    this.copy('_readme.md', 'readme.md');
    this.copy('_gitignore', '.gitignore');
    this.copy('bowerrc', '.bowerrc');
    this.copy('editorconfig', '.editorconfig');
    this.copy('jshintrc', '.jshintrc');
    this.copy('todo.md', 'todo.md');
  },

  install: function () {
    this.installDependencies();
  }
});

module.exports = KittnGenerator;
