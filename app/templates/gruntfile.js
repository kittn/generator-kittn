// Gruntfile
// =========

module.exports = function (grunt) {

  // Load Grunt Plugins -----------
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-newer');
  grunt.loadNpmTasks('grunt-modernizr');
  grunt.loadNpmTasks('grunt-todo');
  grunt.loadNpmTasks('grunt-sass-imagemapper');
  grunt.loadNpmTasks('grunt-spritesmith');
  grunt.loadNpmTasks('grunt-svgmin');
  grunt.loadNpmTasks('grunt-svg-to-png');
  grunt.loadNpmTasks('grunt-responsive-images');
  // grunt.loadNpmTasks('grunt-sassdoc');
  grunt.loadNpmTasks('grunt-combine-media-queries');
  grunt.loadNpmTasks('grunt-contrib-cssmin');

  var matchdep = require('matchdep');

  // Configure Tasks ---------------
  grunt.initConfig({

    // Read the Package.json
    pkg: grunt.file.readJSON('package.json'),

    clean: {
      svg: {
        src: [
          '<%= pkg.directory.cssimg %>svg/'
        ]
      },
      sprites: {
        src: [
          '<%= pkg.directory.cssimg %>sprite_2x/',
          '<%= pkg.directory.cssimg %>sprite/'
        ]
      },
      single: {
        src: [
          '<%= pkg.directory.cssimg %>single/'
        ]
      },
      textures: {
        src: [
          '<%= pkg.directory.cssimg %>textures/'
        ]
      },
    },
    copy: {
      sprites: {
        files: [
          {
            // Copy Retina Images in the Retina Sprite Folder
            expand: true,
            cwd: 'src/stash/images/css-images/sprite-assets/',
            src: ['**/*@2x.png'],
            dest: '<%= pkg.directory.cssimg %>sprite_2x/',
            rename: function(dest,src) {
              return dest + src.substring(0, src.length - 7) + '.png';
            }
          },
          {
            // Copy Normal Images in the Normal Sprite Folder
            expand: true,
            cwd: 'src/stash/images/css-images/sprite-assets/',
            src: ['**/*.png','!**/*@2x.png'],
            dest: '<%= pkg.directory.cssimg %>sprite/',
            rename: function(dest,src) {
              return dest + src.substring(0, src.length - 4) + '.png';
            }
          }
        ]
      },
      single: {
        files: [
          {
            // Copy Single Image Assets to tmp
            expand: true,
            cwd: 'src/stash/images/css-images/single-assets/',
            src: ['**/*.{png,jpg,gif,jpeg}'],
            dest: '<%= pkg.directory.cssimg %>single/'
          },
        ]
      },
      textures: {
        files: [
          {
            // Copy Single Image Assets to tmp
            expand: true,
            cwd: 'src/stash/images/css-images/texture-assets/',
            src: ['**/*.{png,jpg,gif,jpeg}'],
            dest: '<%= pkg.directory.cssimg %>textures/'
          },
        ]
      }
    },
    sprite:{
      nonRetinaSass: {
        // OPTIONAL: Specify algorithm (top-down, left-right, diagonal [\ format],
        // alt-diagonal [/ format], binary-tree [best packing])
        // Visual representations can be found below
        algorithm: 'binary-tree',
        // OPTIONAL: Specify padding between images
        padding: 2,
        // OPTIONAL: Specify engine (auto, phantomjs, canvas, gm, pngsmith)
        engine: 'pngsmith',
        cssTemplate: 'src/stash/.system/scss-sprite.template.mustache',
        cssFormat: 'stylus',
        'cssVarMap': function (sprite) {
          sprite.name = '' + sprite.name;
        },
        src: '<%= pkg.directory.cssimg %>sprite/**/*.png',
        imgPath: 'sprite.png',
        destImg: '<%= pkg.directory.cssimg %>sprite.png',
        destCSS: 'src/sass/maps/_sprite.scss',
        // OPTIONAL: Specify css options
        'cssOpts': {
          // Some templates allow for skipping of function declarations
          'functions': false
        }
      },
      retinaSass: {
        algorithm: 'binary-tree',
        padding: 2,
        // OPTIONAL: Specify engine (auto, phantomjs, canvas, gm, pngsmith)
        engine: 'pngsmith',
        cssTemplate: 'src/stash/.system/scss-retinaSprite.template.mustache',
        cssFormat: 'stylus',
        'cssVarMap': function (sprite) {
          sprite.name = '' + sprite.name;
        },
        src: '<%= pkg.directory.cssimg %>sprite_2x/**/*.png',
        imgPath: 'sprite@2x.png',
        destImg: '<%= pkg.directory.cssimg %>sprite@2x.png',
        destCSS: 'src/sass/maps/_sprite-retina.scss',
        // OPTIONAL: Specify css options
        'cssOpts': {
          // Some templates allow for skipping of function declarations
          'functions': false
        }
      }
    },
    sass_imagemapper: {
      all: {
        files: [{
          cwd: '<%= pkg.directory.cssimg %>',
          src: [
            'single/**/*.{png,jpg,gif,jpeg}',
            'textures/**/*.{png,jpg,gif,jpeg}',
            'svg/**/*.png'
          ],
          dest: 'src/sass/maps/_imagemap.scss'
        }],
        options: {
          prefix: '',
          images_path:''
        }
      }
    },
    responsive_images: {
      dev: {
        options: {
          sizes: [
            {
              name: 'small',
              width: 320,
            },
            {
              name: 'medium',
              width: 500
            },
            {
              name: 'large',
              width: 900
            },
            {
              name: 'xlarge',
              width: 1200
            }
          ]
        },
        files: [{
          expand: true,
          cwd: '<%= pkg.directory.htmlimg %>',
          src: ['**.{jpg,gif,png}'],
          dest: '<%= pkg.directory.htmlimg %>'
        }]
      }
    },
    svgmin: {
      options: {
        plugins: [
            { removeViewBox: true },
            { cleanupIDs: false}
        ]
      },
      dist: {
        files: [
          {
            expand: true,
            cwd: 'src/stash/images/css-images/svg-assets/',
            src: ['**/*.svg'],
            dest: '<%= pkg.directory.cssimg %>svg/',
            ext: '.svg'
          }
        ]
      },
      pure: {
        files: [
          {
            expand: true,
            cwd: 'src/stash/images/css-images/svgonly-assets/',
            src: ['**/*.svg'],
            dest: '<%= pkg.directory.cssimg %>svgonly/',
            ext: '.svg'
          }
        ]
      }
    },
    svg2png: {
      all: {
        files: [
          {
            src: ['<%= pkg.directory.cssimg %>svg/*.svg'],
            dest: '<%= pkg.directory.cssimg %>svg/'
          }
        ]
      }
    },
    cmq: {
      options: {
        log: false
      },
      dist: {
        files: {
          '<%= pkg.directory.css %><%= pkg.cssFileName%>.css': ['<%= pkg.directory.css %><%= pkg.cssFileName%>.css']
        }
      }
    },
    cssmin: {
      minify: {
        expand: true,
        cwd: '<%= pkg.directory.css %>',
        src: ['*.css', '!*.min.css'],
        dest: '<%= pkg.directory.css %>',
        ext: '.css'
      }
    },
    modernizr: {
      dist: {
        // [REQUIRED] Path to the build you're using for development.
        'devFile': 'src/stash/bower/modernizr/modernizr.js',

        // [REQUIRED] Path to save out the built file.
        'outputFile': '<%= pkg.directory.js %>modernizr.js',

        // Based on default settings on http://modernizr.com/download/
        'extra': {
            'shiv': true,
            'printshiv': true,
            'load': true,
            'mq': false,
            'cssclasses': true
        },

        // Based on default settings on http://modernizr.com/download/
        'extensibility': {
            'addtest': false,
            'prefixed': false,
            'teststyles': false,
            'testprops': false,
            'testallprops': false,
            'hasevents': false,
            'prefixes': false,
            'domprefixes': false
        },

        // By default, source is uglified before saving
        'uglify': false,

        // Define any tests you want to implicitly include.
        'tests': [
          'flexbox',
          'opacity',
          'backgroundsize',
          'borderimage',
          'borderradius',
          'boxshadow',
          'cssanimations',
          'csstransitions',
          'csstransforms',
          'csstransforms3d',
          'prefixed',
          'generatedcontent',
          'svg',
          'inlinesvg',
          'touch',
          'respond',
          'hsla',
          'rgba',
          'webgl'
        ],

        // By default, this task will crawl your project for references to Modernizr tests.
        // Set to false to disable.
        'parseFiles': true,
        // When parseFiles = true, this task will crawl all *.js, *.css, *.scss files, except files that are in node_modules/.
        // You can override this by defining a 'files' array below.
        'files': {
            'src': []
        },
        // When parseFiles = true, matchCommunityTests = true will attempt to
        // match user-contributed tests.
        'matchCommunityTests': false,

        // Have custom Modernizr tests? Add paths to their location here.
        'customTests': []
      }
    },
    todo: {
      options: {},
      src: [
        'src/jade/**/*.jade',
        'src/markdown/**/*.md',
        'src/js/**/*.js',
        'src/sass/**/*.scss'
      ],
    },
    sassdoc: {
      default: {
        src: 'src/sass',
        dest: 'docs',
        options: {
          display: {
            access: ['public', 'private'],
            alias: true,
            watermark: true
          },
          package: './package.json'
        }
      }
    }
  });


  // Register Tasks
  grunt.registerTask('build-sprite',[
    'clean:sprites',
    'copy:sprites',
    'sprite:nonRetinaSass',
    'sprite:retinaSass'
  ]);

  grunt.registerTask('build-svg',[
    'newer:svgmin:dist',
    'newer:svg2png',
    'sass_imagemapper:all'
  ]);

  grunt.registerTask('minify-svg', [
    'newer:svgmin:pure'
  ]);

  grunt.registerTask('copy-images',[
    'newer:copy:single',
    'newer:copy:textures',
    'sass_imagemapper:all'
  ]);

  grunt.registerTask('build-images', [
    'copy:sprites',
    'sprite:nonRetinaSass',
    'sprite:retinaSass',
    'svgmin:pure',
    'svgmin:dist',
    'svg2png',
    'copy:single',
    'copy:textures',
    'sass_imagemapper:all'
  ]);

  // Cleanup the Target Image Directorys and Copy the File from Src to Tmp
  grunt.registerTask('rebuild-images', [
    'clean:sprites',
    'clean:single',
    'clean:textures',
    'clean:svg',
    'copy:sprites',
    'sprite:nonRetinaSass',
    'sprite:retinaSass',
    'svgmin:pure',
    'svgmin:dist',
    'svg2png',
    'copy:single',
    'copy:textures',
    'sass_imagemapper:all'
  ]);

  // Minify and Combine CSS
  grunt.registerTask('cssminify', [
    'cmq:dist',
    'cssmin'
  ]);

  grunt.registerTask('modernizr-build', [
    'modernizr'
  ]);

  grunt.registerTask('responsive-images',[
    'newer:responsive_images:dev'
  ]);

  // grunt.registerTask('documentation', [
  //   'sassdoc'
  // ]);
};
