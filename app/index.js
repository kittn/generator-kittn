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
var random        = require('randomstring');
var mysql         = require('mysql');


// Function for Generate Salt Keys
var saltKeys = [];

for ( var i = 0; i < 8; i++ ) {
  saltKeys.push(random.generate({
    length: 64,
    charset: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!§$%/()=_;:,.^"
  }))
}

const getGitUserName = () => {
  let gitUserName = ''

  // check git info
  commandExists('git')
    .then(function(command) {
      gitUserName = exec('git config user.name', {silent: true}).replace(/\n/g, '')
    }).catch(function() {
      gitUserName = ''
    })

  return gitUserName
}

const getGitUserMail = () => {
  let gitUserMail = ''

  // check git info
  commandExists('git')
    .then(function(command) {
      gitUserMail = exec('git config user.email', {silent: true}).replace(/\n/g, '')
    }).catch(function() {
      gitUserMail = ''
    })

  return gitUserMail
}

var KittnGenerator = yeoman.Base.extend({
  init: function () {
    this.pkg = require('../package.json');
  },
  askFor: function () {
    var done      = this.async();
    var wp_cli    = false;
    var craft_wget = false;

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

    commandExists('wget --help')
      .then(function(command) {
        craft_wget = true
      }).catch(function() {
      craft_wget = false
    })

    // Ask something to setup the project skeleton
    return this.prompt([
      {
        type: 'input',
        name: 'projectname',
        message: chalk.cyan.underline.bold('Project Name') + '\n\xa0 Please give the project a name (without Spaces)',
        // default: 'kittn',
        default: process.cwd().split('/').pop(-1).toLowerCase().replace(/[^a-zA-Z0-9]/g, ''),
        validate: function (input) {
          // Do async stuff
          if (input.indexOf(' ') >= 0 || /[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/g.test(input)) {
            // Pass the return value in the done callback
            console.log('\n' + chalk.styles.red.open + 'No whitespaces or special-chars allowed!' + chalk.styles.red.close);
            return false;
          }
          return true;
        }
      },
      {
        type: 'input',
        name: 'projectdescription',
        message: chalk.cyan.underline.bold('Project Description') + '\n\xa0 Description of the project',
        default: 'undefinied'
      },
      {
        type: 'input',
        name: 'projectthemecolor',
        message: chalk.cyan.underline.bold('Project Theme Color') + '\n\xa0 Main Theme-Color of the project',
        default: '#29b8f2'
      },
      {
        type: 'input',
        name: 'projectcssfilename',
        message: chalk.cyan.underline.bold('CSS Filename') +  '\n\xa0 (only the name without .css or .scss)',
        default: 'style'
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
        when: function(props) {
          return props.projectsasssyntax === 'SCSS';
        },
        type: 'confirm',
        name: 'projectstylelint',
        message: chalk.cyan.underline.bold('Activate Stylelint') + '\n\xa0 Do you want to ativate Stylelint?',
        default: true
      },
      {
        type: 'list',
        name: 'projectbreakpointunit',
        message: chalk.cyan.underline.bold('Media Query Unit') + '\n\xa0 Which Unit do you prefer for Media Queries?',
        choices: [
          'em',
          'px'
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
        type: 'confirm',
        name: 'projectcritical',
        message: chalk.cyan.underline.bold('CriticalCSS') + chalk.styles.red.close + '\n\xa0 Do you wan\'t to automatically create CriticalCSS (Above the fold)?',
        default: false
      },
      {
        when: function(props) {
          return props.projectcritical === true;
        },
        type: 'list',
        name: 'projectcriticalinline',
        message: chalk.cyan.underline.bold('Inline Critical CSS') + '\n\xa0 Shall the CSS be injected in the index.html-File, or as separate CSS-File?',
        choices: [
          'Inline',
          'Separate File'
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
          return props.projectUsage === 'Integrate in CraftCMS' && props.projectcssstructure === 'ITCSS';
        },
        type: 'confirm',
        name: 'projectcraftbp',
        message: chalk.cyan.underline.bold('Craft Bonus Round') + '\n\xa0 Do you want that the Generator implement a Craft Starterpack? \n\xa0 Adding a Contentbuilder, the Stylefiles (in ITCSS) and some JS Files for Lightboxes, and some Craft Plugins',
        default: true
      },
      {
        when: function(props) {
          return props.projectUsage === 'Integrate in Wordpress' && props.projectcssstructure === 'ITCSS';
        },
        type: 'confirm',
        name: 'projectwordpressbp',
        message: chalk.cyan.underline.bold('Wordpress Bonus Round') + '\n\xa0 Do you want that the Generator implement a Wordpress Starterpack? \n\xa0 Adding a Contentbuilder, the Stylefiles (in ITCSS) and some JS Files for Lightboxes, and some WP Plugins. You will need ACF 5 Pro',
        default: true
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
        message: chalk.cyan.underline.bold('WP-CLI') + '\n\xa0 Should the generator install WordPress for you?',
        default: true
      },
      {
        when: function(props) {
          if(props.projectUsage === 'Integrate in CraftCMS' && craft_wget) {
            return true
          }
          return false;
        },
        type: 'confirm',
        name: 'projectcraftcli',
        message: chalk.cyan.underline.bold('Craft Install') + '\n\xa0 Should the generator install CraftCMS for you?',
        default: true
      },
      {
        when: function(props) {
          return props.projectUsage !== 'Building HTML Prototypes';
        },
        type: 'confirm',
        name: 'projectcredential',
        message: chalk.cyan.underline.bold('Local Environment Credentials') +  '\n\xa0 Want to enter your URL and Database Credentials for your local Environment?',
        default: true
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
        when: function(props) {
          return props.projectcredential === true;
        },
        type: 'confirm',
        name: 'credentialdbopen',
        message: chalk.cyan.underline.bold('DB Name') + chalk.styles.red.close + '\n\xa0 Do you want to automatically add a database to your MySQL database?',
        default: true
      },
      {
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
        type: 'confirm',
        name: 'projectjquery',
        message: chalk.cyan.underline.bold('jQuery') + '\n\xa0 Want to use jQuery?',
        default: false
      },
      {
        type: 'list',
        name: 'projectJSFramework',
        message: chalk.cyan.underline.bold('JS Frameworks')  + '\n\xa0 Would you like to integrate a JS framework (Vue, React)?',
        choices: [
          'none',
          'Vue.js',
          'React'
        ]
      },
      {
        when: function(props) {
          return props.projectJSFramework === 'Vue.js';
        },
        type: 'confirm',
        name: 'projectvueplugins',
        message: chalk.cyan.underline.bold('Vue.js Plugins') + '\n\xa0Do you need basic Vue.js Plugins? (Axios, vuex...) ',
        default: false
      },
      {
        when: function(props) {
          return props.projectJSFramework === 'Vue.js';
        },
        type: 'list',
        name: 'projectvueversion',
        message: chalk.cyan.underline.bold('Vue.js Runtime') + '\n\xa0 Vue Version. When you only use .vue Files Runtime is perfect,\n\xa0 if you need parsing from .html Files you need the Standalone Version.',
        choices: [
          'Runtime-Only',
          'Standalone'
        ]
      },
      {
        type: 'confirm',
        name: 'projectastrum',
        message: chalk.cyan.underline.bold('Astrum Pattern Lib') + '\n\xa0 Would you like to build up your Pattern Library with Astrum?',
        default: false
      },
      {
        type: 'input',
        name: 'projectversion',
        message: chalk.cyan.underline.bold('Project Version') + '\n\xa0 The Version Number',
        default: '0.0.1'
      },
      {
        type: 'input',
        name: 'projectauthor',
        message: chalk.cyan.underline.bold('Project Author') + '\n\xa0 Project Author Name or Company',
        default: getGitUserName()
      },
      {
        type: 'input',
        name: 'projectmail',
        message: chalk.cyan.underline.bold('Project Mail') + '\n\xa0 Mailadress from the Author',
        default: getGitUserMail()
      }
    ]).then(function (props) {
      function checkAnswer(prop) {
        if (prop) {
          return prop
        } else {
          return false
        }
      }

      this.projectname            = props.projectname;
      this.projectdescription     = props.projectdescription;
      this.projectthemecolor      = props.projectthemecolor;
      this.projectversion         = props.projectversion;
      this.projectauthor          = props.projectauthor;
      this.projectmail            = props.projectmail;
      this.projectbreakpointunit  = props.projectbreakpointunit;
      this.projectcritical        = props.projectcritical;
      this.projectcriticalinline  = props.projectcriticalinline;
      this.projectcssfilename     = props.projectcssfilename;
      this.projectstructure       = checkAnswer(props.projectstructure);
      this.projectUsage           = props.projectUsage;
      this.projectjquery          = props.projectjquery;
      this.projectJSFramework     = props.projectJSFramework;
      this.projectcssstructure    = props.projectcssstructure;
      this.projectvueplugins      = props.projectvueplugins;
      this.projectvueversion      = checkAnswer(props.projectvueversion);
      this.projectwpcli           = props.projectwpcli;
      this.projectcraftcli        = props.projectcraftcli;
      this.projectcredential      = props.projectcredential;
      this.credentialprotocol     = props.credentialprotocol;
      this.credentialdomain       = props.credentialdomain;
      this.credentialdbserver     = props.credentialdbserver;
      this.credentialdbuser       = props.credentialdbuser;
      this.credentialdbpass       = props.credentialdbpass;
      this.credentialdbdatabase   = props.credentialdbdatabase;
      this.projectsasssyntax      = props.projectsasssyntax;
      this.projectstylelint       = props.projectstylelint;
      this.projectscriptlinter    = props.projectscriptlinter;
      this.projectastrum          = props.projectastrum;
      this.projectcraftbp         = props.projectcraftbp;
      this.projectwordpressbp     = props.projectwordpressbp;
      this.credentialdbopen       = props.credentialdbopen;
      this.saltKeys               = saltKeys;

      done();
    }.bind(this));
  },

  app: function () {

    // Add the Template Vars for the Process
    var templateParams = {
      projectname           : this.projectname,
      projectdescription    : this.projectdescription,
      projectthemecolor     : this.projectthemecolor,
      projectversion        : this.projectversion,
      projectauthor         : this.projectauthor,
      projectmail           : this.projectmail,
      projectbreakpointunit : this.projectbreakpointunit,
      projectcritical       : this.projectcritical,
      projectcriticalinline : this.projectcriticalinline,
      projectcssfilename    : this.projectcssfilename,
      projectstructure      : this.projectstructure,
      projectUsage          : this.projectUsage,
      projectjquery         : this.projectjquery,
      projectJSFramework    : this.projectJSFramework,
      projectcssstructure   : this.projectcssstructure,
      projectvueplugins     : this.projectvueplugins,
      projectvueversion     : this.projectvueversion,
      projectcraftcli       : this.projectcraftcli,
      projectwpcli          : this.projectwpcli,
      projectcredential     : this.projectcredential,
      credentialprotocol    : this.credentialprotocol,
      credentialdomain      : this.credentialdomain,
      credentialdbserver    : this.credentialdbserver,
      credentialdbuser      : this.credentialdbuser,
      credentialdbpass      : this.credentialdbpass,
      credentialdbdatabase  : this.credentialdbdatabase,
      projectsasssyntax     : this.projectsasssyntax,
      projectstylelint      : this.projectstylelint,
      projectscriptlinter   : this.projectscriptlinter,
      projectastrum         : this.projectastrum,
      projectcraftbp        : this.projectcraftbp,
      projectwordpressbp    : this.projectwordpressbp,
      credentialdbopen      : this.credentialdbopen,
      saltKeys              : this.saltKeys,
      projectpath           : process.cwd(),
      pkg: this.pkg
    };

    // Move the SRC Folder
    mkdirp.sync('dist/');
    this.directory('src/js/', 'src/js/')
    this.directory('src/fonts/', 'src/fonts/')
    this.directory('src/images/', 'src/images/')
    this.directory('src/scripts/', 'src/scripts/')
    this.directory('src/.system/', 'src/.system/')
    this.directory('src/gulpfile/', 'gulpfile/')

    // Define Sass File Type
    if ( this.projectsasssyntax === 'SCSS') {
      var sassFileEnding = '.scss'
    } else {
      var sassFileEnding = '.sass'
    }

    // Copy the CSS Structure
    switch(this.projectcssstructure) {
      case 'Atomic Design':
        this.directory('src/skeletons/css/atomic', 'src/style/application/')
        this.template('src/skeletons/css/_application_atomic.scss', 'src/style/application/_application'+sassFileEnding, templateParams)
        break

      case 'ITCSS':
        this.directory('src/skeletons/css/itcss', 'src/style/application/')
        this.template('src/skeletons/css/_application_itcss.scss', 'src/style/application/_application'+sassFileEnding, templateParams)
        break

      case 'OOCSS':
        this.directory('src/skeletons/css/oocss', 'src/style/application/')
        this.template('src/skeletons/css/_application_oocss.scss', 'src/style/application/_application'+sassFileEnding, templateParams)
        break

      default:
        this.directory('src/skeletons/css/own', 'src/style/application/')
        this.template('src/skeletons/css/_application_own.scss', 'src/style/application/_application'+sassFileEnding, templateParams)
        break
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
      this.templatePath('_setup.scss'),
      this.destinationPath('src/style/_setup.scss'),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_workfile.scss'),
      this.destinationPath('src/style/_workfile'+sassFileEnding),
      templateParams
    );

    this.fs.copyTpl(
      this.templatePath('_loader.scss'),
      this.destinationPath('src/style/_loader.scss'),
      templateParams
    );

    if ( this.projectstylelint ) {
      this.fs.copyTpl(
        this.templatePath('stylelintrc'),
        this.destinationPath('.stylelintrc'),
        templateParams
      );
    }

    if ( this.projectcritical ) {
      this.fs.copyTpl(
        this.templatePath('_copy-criticalcss.js'),
        this.destinationPath('gulpfile/tasks/optimize-criticalCss.js'),
        templateParams
      );
    }

    this.fs.copyTpl(
      this.templatePath('_compile-css.js'),
      this.destinationPath('gulpfile/tasks/compile-css.js'),
      templateParams
    );

    // Put Craft Base Files in Structure or simple Structure Files
    if ( this.projectUsage === 'Integrate in CraftCMS' ) {
      this.directory('src/skeletons/craftcms/structure/', 'src/structure/')

      this.directory('src/skeletons/craftcms/craftscripts/', 'craftscripts/')

      // Copy .env Config File
      this.directory('src/skeletons/craftcms/env/', 'src/.system/env/')
      this.directory('src/skeletons/craftcms/public/', 'src/.system/public/')

      if ( this.projectcredential ) {
        this.fs.copyTpl(
          this.templatePath('src/skeletons/craftcms/.env.sh'),
          this.destinationPath('craftscripts/.env.sh'),
          templateParams
        );
      }

      // Copy Additional Gulp Tasks
      this.fs.copyTpl(
        this.templatePath('_copy-craftenv.js'),
        this.destinationPath('gulpfile/tasks/copy-craftenv.js'),
        templateParams
      );
      this.fs.copyTpl(
        this.templatePath('_copy-craftindex.js'),
        this.destinationPath('gulpfile/tasks/copy-craftindex.js'),
        templateParams
      );

      // Install Craft Starterpack
      if (this.projectcraftbp) {
        // Copy Plugins and Templates
        this.directory('src/skeletons/starterpack/craftcms/structure/', 'src/structure/')
        // Copy JS Script Files
        this.directory('src/skeletons/starterpack/general/js/', 'src/js/partial/')
        // Copy Sass Files
        this.directory('src/skeletons/starterpack/general/style/', 'src/style/')
        // Copy Contentbuilder Config
        this.fs.copyTpl(
          this.templatePath('src/skeletons/starterpack/craftcms/contentbuilder.json'),
          this.destinationPath('contentbuilder.json'),
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
          this.destinationPath('src/structure/config/wp-config.php'),
          templateParams
        );
      }

      this.fs.copyTpl(
        this.templatePath('_copy-wpconfig.js'),
        this.destinationPath('gulpfile/tasks/copy-wpconfig.js'),
        templateParams
      );
      this.fs.copyTpl(
        this.templatePath('_copy-wpplugins.js'),
        this.destinationPath('gulpfile/tasks/copy-wpplugins.js'),
        templateParams
      );

      // Install Wordpress Starterpack
      if (this.projectwordpressbp) {
        // Copy JS Script Files
        this.directory('src/skeletons/starterpack/general/js/', 'src/js/partial/')
        // Copy Sass Files
        this.directory('src/skeletons/starterpack/general/style/', 'src/style/')
        // Copy Plugins and Templates
        this.directory('src/skeletons/starterpack/wordpress/structure/', 'src/structure/')
        // Copy Contentbuilder Config
        this.fs.copyTpl(
          this.templatePath('src/skeletons/starterpack/wordpress/contentbuilder.json'),
          this.destinationPath('acf-contentbuilder.json'),
          templateParams
        );
        // Copy Contentbuilder Config
        this.fs.copyTpl(
          this.templatePath('src/skeletons/starterpack/wordpress/adminimize-settings.json'),
          this.destinationPath('adminimize-settings.json'),
          templateParams
        );
      }

    } else {
      this.directory('src/skeletons/simplestructure', 'src/structure/')
    }

    // Adding Database
    if ( this.projectcredential && this.credentialdbopen ) {
      const connection = mysql.createConnection({
        host     : this.credentialdbserver,
        user     : this.credentialdbuser,
        password : this.credentialdbpass
      })

      connection.connect(function(err) {
        if (err) {
          console.error('error connecting: ' + err.stack);
          return;
        }
      })

      connection.query('CREATE DATABASE IF NOT EXISTS '+this.credentialdbdatabase+';', function (error, results, fields) {
        if (error) throw error;
        console.log('Added Database ['+this.credentialdbdatabase+'] to your MySQL DB');
      })
      connection.end()
    }

    // Include the Twig Working Dir
    if ( this.projectstructure === 'Twig Template' ) {
      this.directory('src/skeletons/twig/', 'src/template/');
    }

    if ( this.projectJSFramework === 'Vue.js' ) {
      this.directory('src/skeletons/vue/components/', 'src/js/components/')
      this.directory('src/skeletons/vue/shared/', 'src/js/shared/')
      if ( this.projectvueplugins === true ) {
        this.directory('src/skeletons/vue/store/', 'src/js/store/')
        this.directory('src/skeletons/vue/router/', 'src/js/router/')
      }
      this.directory('src/build/', 'build/')

      this.fs.copyTpl(
        this.templatePath('_app.vue'),
        this.destinationPath('src/js/app.vue'),
        templateParams
      );
    }

    if (this.projectastrum) {
      this.directory('src/pattern-library/', 'doc/pattern-library/')

      this.fs.copyTpl(
        this.templatePath('_astrum-config.json'),
        this.destinationPath('astrum-config.json'),
        templateParams
      );
    }

    // Include some other important files
    this.fs.copyTpl(
      this.templatePath('_package.json'),
      this.destinationPath('package.json'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('_config.json'),
      this.destinationPath('config.json'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('_bower.json'),
      this.destinationPath('bower.json'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('_gulpfile.babel.js'),
      this.destinationPath('gulpfile.babel.js'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('_readme.md'),
      this.destinationPath('readme.md'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('_gitignore'),
      this.destinationPath('.gitignore'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('bowerrc'),
      this.destinationPath('.bowerrc'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('editorconfig'),
      this.destinationPath('.editorconfig'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('nvmrc'),
      this.destinationPath('.nvmrc'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('sass-lint'),
      this.destinationPath('.sass-lint.yml'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('babelrc'),
      this.destinationPath('.babelrc'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('eslintrc'),
      this.destinationPath('.eslintrc'),
      templateParams
    )
    this.fs.copyTpl(
      this.templatePath('eslintrc-dev'),
      this.destinationPath('.eslintrc-dev'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('_webpack.config.babel.js'),
      this.destinationPath('webpack.config.babel.js'),
      templateParams
    )

    this.fs.copyTpl(
      this.templatePath('_webpack.dev.config.babel.js'),
      this.destinationPath('webpack.dev.config.babel.js'),
      templateParams
    )

  },

  installCraft() {
    // Put Craft Base Files in Structure or simple Structure Files
    if (this.projectUsage === 'Integrate in CraftCMS') {
      if (this.projectcraftcli) {
        const done = this.async()
        const self = this

        this.spawnCommand('wget', ['http://buildwithcraft.com/latest.tar.gz\?accept_license\=yes']).on('close', () => {
          self.spawnCommand('mkdir', ['dist']).on('close', () => {
            self.spawnCommand('tar', ['-zxvf', 'latest.tar.gz\?accept_license=yes', 'craft/']).on('close', () => {
              self.spawnCommand('mv', ['craft', 'dist/']).on('close', () => {
                self.spawnCommand('rm', ['-rf', 'latest.tar.gz\?accept_license=yes']).on('close', done)
              })
            })
          })
        })

        // For the Future CRAFT3.0 Composer Power
        // const done = this.async()
        // this.spawnCommand('composer', ['create-project', 'craftcms/craft', 'dist', '-s', 'beta']).on('close', done)

      } else {
        console.log('Before you run `npm run init`, you must manually install Craft in the `dist/` directory.')
      }
    }
  },

  installWP() {

    if (this.projectUsage === 'Integrate in Wordpress') {
      if (this.projectwpcli) {
        const done = this.async()
        this.spawnCommand('wp', ['core', 'download', '--path=dist', '--locale=de_DE']).on('close', done)
      } else {
        console.log('Before you run `npm run init`, you must manually install Wordpress in the `dist/` directory.')
      }
    }
  },

  install() {
    let _self = this

    // check if yarn is available and use it instead of npm
    commandExists('yarn', function (err, commandExists) {
      if (commandExists) {
        const done = _self.async()
        _self.spawnCommand('yarn').on('close', done);
      } else {
        const done = _self.async()
        _self.npmInstall()
        _self.spawnCommand('npm', ['install']).on('close', done);
      }
    })

    // Goodbye
    this.on('end', function () {
      const goodbye =
              '\n ' + chalk.styles.yellow.open +
              '\n                    __    .__  __    __ ' +
              '\n                    |  | _|__|/  |__/  |_  ____ ' +
              '\n                    |  |/ /  \\   __\\   __\\/    \\ ' +
              '\n                    |    <|  ||  |  |  | |   |  \\ ' +
              '\n                    |__|_ \\__||__|  |__| |___|  / ' +
              '\n                    \\/                   \\/  ' +
              '\n  ' + chalk.styles.yellow.close  + chalk.styles.green.open +
              '\n   Now we are finished. Make your last settings and start `npm run init`.' +
              '\n      When npm is finished activate `npm run dev` and happy Coding.' +
              '\n ' + chalk.styles.green.close
      console.log(goodbye)
    })
  }
})

module.exports = KittnGenerator
