'use strict';
var util          = require('util');
var path          = require('path');
var yosay         = require('yosay');
var chalk         = require('chalk');
var yeoman        = require('yeoman-generator');
var mkdirp        = require('mkdirp');
var shelljs       = require('shelljs/global');
var commandExists = require('command-exists');
var clear         = require('clear-terminal');

var KittnGenerator = yeoman.Base.extend({
  init: function () {
    this.pkg = require('../package.json');
  },
  askFor: function () {
    var done      = this.async();
    var wp_cli    = false;
    var craft_cli = false;

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
          '\n                                                       v.' + chalk.bold(this.pkg.version) +
          '\n  ' +
          '\n   Authors: Sascha Fuchs (@gisugosu) ' +
          '\n   URL    : http://kittn.de   ' +
          '\n ';
    clear();
    console.log(welcome);

    // check if cli tools exist
    commandExists('wp')
      .then(function(command){
        wp_cli = true
      }).catch(function(){
      wp_cli = false;
    });

    commandExists('craft')
      .then(function(command){
        craft_cli = true
      }).catch(function(){
        craft_cli = false;
    });

    // check git info
    var gitInfo = {
      name: exec('git config user.name', {silent: true}).replace(/\n/g, ''),
      email: exec('git config user.email', {silent: true}).replace(/\n/g, ''),
      github: exec('git config github.user', {silent: true}).replace(/\n/g, '')
    }

    // Ask something to setup the project skeleton
    return this.prompt([
      {
        type: 'input',
        name: 'projectname',
        message: chalk.cyan.underline.bold('Project Name') + '\n\xa0 Please give the project a name (without Spaces)',
        default: 'kittn',
        validate: function (input) {
          // Do async stuff
          if (input.indexOf(' ') >= 0 || /[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/g.test(input)) {
            // Pass the return value in the done callback
            console.log('\n' + chalk.styles.red.open + 'No whitespaces or special-chars allowed!' + chalk.styles.red.close);
            return false;
          }
          return true;
        }
      },{
        type: 'input',
        name: 'projectdescription',
        message: chalk.cyan.underline.bold('Project Description') + '\n\xa0 Description of the project',
        default: 'undefinied'
      },{
        type: 'input',
        name: 'projectcssfilename',
        message: chalk.cyan.underline.bold('CSS Filename') +  '\n\xa0 (only the name without .css or .scss)',
        default: 'style'
      },
      {
        type: 'confirm',
        name: 'projecttypescript',
        message: chalk.cyan.underline.bold('JS Transpiler') + '\n\xa0 Would you like javascript to be processed with Typescript instead of Babel?',
        default: false
      },
      {
        when: function(props) {
          return props.projecttypescript === false;
        },
        type: 'list',
        name: 'projectscriptlinter',
        message: chalk.cyan.underline.bold('JS EsLint-Settings') + '\n\xa0 Pick an ESLint preset',
        choices: [
          {
            'name': 'Standard (https://github.com/feross/standard)',
            'value': 'standard',
            'short': 'Standard'
          },
          {
            'name': 'AirBNB (https://github.com/airbnb/javascript)',
            'value': 'airbnb',
            'short': 'AirBNB'
          },
          {
            'name': 'none (configure it yourself)',
            'value': 'none',
            'short': 'none'
          }
        ]
      },
      {

        type: 'list',
        name: 'projectsasssyntax',
        message: chalk.cyan.underline.bold('Sass Compiler Syntax') + '\n\xa0 Do you want to use indented syntax (sass) or Sassy CSS syntax (SCSS)?',
        choices: [
          'SCSS',
          'Sass'
        ]
      },
      {
        type: 'list',
        name: 'projectcssstructure',
        message: chalk.cyan.underline.bold('CSS Methodologies') + chalk.styles.red.close + '\n\xa0 CSS Writing Methodologies',
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
        message: chalk.cyan.underline.bold('Project Usage') + '\n\xa0 For what do you want to use Kittn. The generator can then prepare the project accordingly.',
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
        message: chalk.cyan.underline.bold('HTML Compiler') + '\n\xa0 If you want to generate your HTML with Twig or do not use a compiler \n\xa0 (files like html, php, txt, etc. are only copied when the process is running)?',
        choices: [
          'Twig Template',
          'Uncompiled'
        ]
      },
      {
        when: function(props) {
          if(props.projectUsage === 'Integrate in Wordpress' && wp_cli) {
            return true
          }
          return false
        },
        type: 'confirm',
        name: 'projectwpcli',
        message: chalk.cyan.underline.bold('WP-CLI') + '\n\xa0 Do you want to install Wordpress?',
        default: false
      },
      {
        when: function(props) {
          if(props.projectUsage === 'Integrate in CraftCMS' && craft_cli) {
            return true
          }
          return false;
        },
        type: 'confirm',
        name: 'projectcraftcli',
        message: chalk.cyan.underline.bold('Craft-CLI') + '\n\xa0 Do you want to install Craft?',
        default: false
      },
      {
        when: function(props) {
          return props.projectUsage !== 'Building HTML Prototypes';
        },
        type: 'confirm',
        name: 'projectcredential',
        message: chalk.cyan.underline.bold('Local Environment Credentials') +  '\n\xa0 Want to enter your URL and Database Credentials for your local Environment?',
        default: false
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'list',
        name: 'credentialprotocol',
        message: chalk.cyan.underline.bold('Credentials HTTP') + '\n\xa0 HTTP or HTTPS?',
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
        message: chalk.cyan.underline.bold('Credentials Domain Protocol') + '\n\xa0 Domain without HTTP or HTTPS',
        default: function(props) { return props.projectname + '.local' }
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbserver',
        message: chalk.cyan.underline.bold('DB Host') + '\n\xa0 Database Server Host without ending slash',
        default: 'localhost'
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbuser',
        message: chalk.cyan.underline.bold('DB User') + chalk.styles.red.close + '\n\xa0 Database User',
        default: 'root'
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbpass',
        message: chalk.cyan.underline.bold('DB Pass') + chalk.styles.red.close + '\n\xa0 Database Password',
        default: 'root'
      },
      {
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'input',
        name: 'credentialdbdatabase',
        message: chalk.cyan.underline.bold('DB Name') + chalk.styles.red.close + '\n\xa0 Database Name',
        default: function(props) { return props.projectname }
      },
      {
        type: 'confirm',
        name: 'projectiecompatible',
        message: chalk.cyan.underline.bold('Oldie IE?') + chalk.styles.red.close + '\n\xa0 IE8 compatibility needed?',
        default: false
      },
      {
        type: 'list',
        name: 'projectquery',
        message: chalk.cyan.underline.bold('Media Queries') + '\n\xa0 In addition to the media queries, Element Queries (https://github.com/marcj/css-element-queries) \n\xa0 or Container Queries (https://github.com/ausi/cq-prolyfill) can be integrated.',
        choices: [
          'Native MediaQuery',
          'ContainerQuery',
          'ElementQuery'
        ]
      },{
        type: 'confirm',
        name: 'projectjquery',
        message: chalk.cyan.underline.bold('jQuery') + '\n\xa0 Want to use jQuery?',
        default: false
      },{
        type: 'list',
        name: 'projectJSFramework',
        message: chalk.cyan.underline.bold('JS Frameworks')  + '\n\xa0 Would you like to integrate a JS framework (Vue, React...)?',
        choices: [
          'none',
          'Vue.js',
          'React.js',
          'Angular.js'
        ]
      },
      {
        when: function(props) {
          return props.projectJSFramework === 'Vue.js';
        },
        type: 'list',
        name: 'projectvueversion',
        message: chalk.cyan.underline.bold('Vuejs Runtime') + '\n\xa0 Vue Version. When you only use .vue Files Runtime is perfect,\n\xa0 if you need parsing from .html Files you need the Standalone Version.',
        choices: [
          'Runtime-Only',
          'Standalone'
        ]
      },
      {
        when: function(props) {
          return props.projectJSFramework === 'none';
        },
        type: 'confirm',
        name: 'projecthmr',
        message: chalk.cyan.underline.bold('Transpiler HMR') + '\n\xa0 Enable Hot-Module-Replacement?\n\xa0 You only need this with a MVC like Vuejs, React, etc.',
        default: false
      },
      {
        type: 'input',
        name: 'projectversion',
        message: chalk.cyan.underline.bold('Project Version') + '\n\xa0 The Version Number',
        default: '0.0.1'
      },{
        type: 'input',
        name: 'projectauthor',
        message: chalk.cyan.underline.bold('Project Author') + '\n\xa0 Project Author Name or Company',
        default: gitInfo.name
      },{
        type: 'input',
        name: 'projectmail',
        message: chalk.cyan.underline.bold('Project Mail') + '\n\xa0 Mailadress from the Author',
        default: gitInfo.email
      },{
        type: 'input',
        name: 'projecturl',
        message: chalk.cyan.underline.bold('Project URL') + '\n\xa0 Author URL',
        default: 'http://........'
      },{
        type: 'input',
        name: 'projectrepo',
        message: chalk.cyan.underline.bold('Project Repo-URL') + '\n\xa0 URL to the Git-Repo',
        default: gitInfo.github
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
      this.projectJSFramework   = props.projectJSFramework;
      this.projecthmr           = props.projectJSFramework === 'none' ? props.projecthmr : true;
      this.projectcssstructure  = props.projectcssstructure;
      this.projectvueversion    = checkAnswer(props.projectvueversion);
      this.projectwpcli         = props.projectwpcli;
      this.projectcraftcli      = props.projectcraftcli;
      this.projectcredential    = props.projectcredential;
      this.credentialprotocol   = props.credentialprotocol;
      this.credentialdomain     = props.credentialdomain;
      this.credentialdbserver   = props.credentialdbserver;
      this.credentialdbuser     = props.credentialdbuser;
      this.credentialdbpass     = props.credentialdbpass;
      this.credentialdbdatabase = props.credentialdbdatabase;
      this.projectsasssyntax    = props.projectsasssyntax;
      this.projecttypescript    = props.projecttypescript;
      this.projectscriptlinter  = props.projectscriptlinter;

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
      projectJSFramework   : this.projectJSFramework,
      projecthmr           : this.projecthmr,
      projectcssstructure  : this.projectcssstructure,
      projectvueversion    : this.projectvueversion,
      projectcraftcli      : this.projectcraftcli,
      projectwpcli         : this.projectwpcli,
      projectcredential    : this.projectcredential,
      credentialprotocol   : this.credentialprotocol,
      credentialdomain     : this.credentialdomain,
      credentialdbserver   : this.credentialdbserver,
      credentialdbuser     : this.credentialdbuser,
      credentialdbpass     : this.credentialdbpass,
      credentialdbdatabase : this.credentialdbdatabase,
      projectsasssyntax    : this.projectsasssyntax,
      projecttypescript    : this.projecttypescript,
      projectscriptlinter  : this.projectscriptlinter,
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

    // Define Sass File Type
    if ( this.projectsasssyntax === 'SCSS') {
      var sassFileEnding = '.scss';
    } else {
      var sassFileEnding = '.sass';
    }

    // Copy the CSS Structure
    switch(this.projectcssstructure) {
      case 'Atomic Design':
        this.directory('src/skeletons/css/atomic', 'src/style/application/');
        this.template('src/skeletons/css/_application_atomic.scss', 'src/style/application/_application'+sassFileEnding, templateParams);
        break;

      case 'ITCSS':
        this.directory('src/skeletons/css/itcss', 'src/style/application/')
        this.template('src/skeletons/css/_application_itcss.scss', 'src/style/application/_application'+sassFileEnding, templateParams);
        break;

      case 'OOCSS':
        this.directory('src/skeletons/css/oocss', 'src/style/application/')
        this.template('src/skeletons/css/_application_oocss.scss', 'src/style/application/_application'+sassFileEnding, templateParams);
        break;

      default:
        this.directory('src/skeletons/css/own', 'src/style/application/')
        this.template('src/skeletons/css/_application_own.scss', 'src/style/application/_application'+sassFileEnding, templateParams);
        break;
    }

    this.directory('src/framework/', 'src/framework/');

    this.directory('src/sassfiles/', 'src/style/');

    // Add SCSS Files with the desired Filename
    this.fs.copyTpl(
      this.templatePath('_style.scss'),
      this.destinationPath('src/style/'+this.projectcssfilename+sassFileEnding),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_workfile.scss'),
      this.destinationPath('src/style/_workfile'+sassFileEnding),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_loader.scss'),
      this.destinationPath('src/style/_loader'+sassFileEnding),
      templateParams
    );

    // IE8 get his own CSS File for Fallbacks
    if (this.projectiecompatible === true ) {
      this.fs.copyTpl(
        this.templatePath('_style-ie8.sassfile'),
        this.destinationPath('src/style/'+this.projectcssfilename+'-ie8'+sassFileEnding),
        templateParams
      );
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

    if ( this.projectJSFramework === 'Vue.js' ) {
      this.directory('src/skeletons/vue/components/', 'src/js/components/');
      this.directory('src/skeletons/vue/store/', 'src/js/store/');
      this.directory('src/skeletons/vue/router/', 'src/js/router/');
      this.directory('src/skeletons/vue/shared/', 'src/js/shared/');
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
      this.templatePath('sass-lint'),
      this.destinationPath('.sass-lint.yml'),
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
    var _self = this;

    // check if yarn is available and use it instead of npm
    commandExists('yarn', function(err, commandExists) {
      if(commandExists) {
        var done = _self.async();
        _self.spawnCommand('yarn').on('close', done);
      } else {
        this.installDependencies({
          bower: false,
          npm: true
        });
      }
    });

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

    // Finish Task
    this.on('end', function () {
      var goodbye =
            '\n ' + chalk.styles.yellow.open +
            '\n                    __    .__  __    __ ' +
            '\n                    |  | _|__|/  |__/  |_  ____ ' +
            '\n                    |  |/ /  \\   __\\   __\\/    \\ ' +
            '\n                    |    <|  ||  |  |  | |   |  \\ ' +
            '\n                    |__|_ \\__||__|  |__| |___|  / ' +
            '\n                    \\/                   \\/  ' +
            '\n  ' + chalk.styles.yellow.close  + chalk.styles.green.open +
            '\n   Now we are finished. Make your last settings and start `npm run init`.' +
            '\n      When you are finished activate `npm run dev` and happy Coding.' +
            '\n ' + chalk.styles.green.close;
      console.log(goodbye);
    });
  }
});

module.exports = KittnGenerator;
