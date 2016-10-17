/**
 * CSS Compiler Task
 */

import kc from '../../config.json'
import globals from '../../src/style/maps/globals.json'
import gulp from 'gulp'
import gutil from 'gulp-util'
import browserSync from 'browser-sync'
import gulpLoadPlugins from 'gulp-load-plugins'
import errorHandler from '../lib/errorHandler'
import yargs from 'yargs'
import cssnano from 'cssnano'
import cssnext from 'postcss-cssnext'
import lost from 'lost'
import cssSizes from 'postcss-short-size'
import flexboxfixes from 'postcss-flexbugs-fixes'
import cssRucksack from 'rucksack-css'
import cssAspectRatio from 'postcss-aspect-ratio'
import cssmap from 'postcss-map'
import cssimports from 'postcss-sassy-import'
import csspartial from 'postcss-partial-import'
import cssextend from 'postcss-extend'
import svgfragments from 'postcss-svg-fragments'
import cssAssets from 'postcss-assets'
import cssReporter from 'postcss-reporter'
import sassstyleVar from 'postcss-advanced-variables'
import sassstyleAtRules from 'postcss-at-rules-variables'
import sassstyleRoot from 'postcss-atroot'
import sassstyleMixin from 'postcss-mixins'
import sassstyleFunctions from 'postcss-functions'
import propertyLookup from 'postcss-property-lookup'
import quantityQueries from 'postcss-quantity-queries'

const args = yargs.argv
const $ = gulpLoadPlugins()

// Gulp Task with two Ways one Libsass (default) one Rubysass
const compilerCssTask = () => {
  const env = args.env || 'development'

  const opts = {
    basePath: 'src/style/maps/',
    maps: ['sprites.yml', 'globals.json', 'breakpoints.yml']
  }

  const processors = [
    csspartial({}),
    cssimports({}),
    function(css) { // Spacer Function
      css.walkDecls(function (decl) {
        if (decl.value.match(/spacer/)) {
          const SPACER = parseInt(globals.spacer, 10)
          decl.value = SPACER * parseFloat(decl.value) + 'px'
        }
        if (decl.value.match(/pxrem/)) {
          const BASE = parseInt(globals.baseFontSize, 10)
          decl.value = parseFloat(decl.value) / BASE + 'rem'
        }
      })
    },
    sassstyleAtRules({}),
    sassstyleVar({
      variables: {
        'pathFont': kc.templatePath.fonts,
        'pathJs': kc.templatePath.js,
        'pathImg': kc.templatePath.cssimage
      }
    }),
    cssmap(opts),
    sassstyleRoot({}),
    sassstyleMixin({}),
    sassstyleFunctions({}),
    propertyLookup({}),
    cssnext({
      warnForDuplicates: false,
      browsers: ['last 1 version']
    }),
    cssextend({}),
    svgfragments({}),
    cssRucksack({
      autoprefixer: false,
      hexRGBA: false
    }),
    cssAssets({
      basePath: kc.dist.base,
      baseUrl: '/',
      loadPaths: [kc.templatePath.cssimage]
    }),
    quantityQueries({}),
    cssSizes({}),
    cssAspectRatio({}),
    lost({}),
    flexboxfixes({}),<% if (if (projectquery === 'ContainerQuery') { %>
    function (css) {
      css.walkRules(/:container\(/i, function (rule) {
        rule.selectors = rule.selectors.map(function(selector) {
          return selector.replace(/:container\([^)]*\)/gi, function(match) {
            return '.' + match
              .replace(/([a-z])\s+([a-z])/gi, '$1|$2')
              .replace(/\s+/g, '')
              .replace(/^:container\("([^)]*)"\)$/i, ':container($1)')
              .replace(/[[\]!"#$%&'()*+,./:;<=>?@^`{|}~]/g, '\\$&')
              .toLowerCase()
          })
        })
      })
    },<% } %>
    env === 'production' ? cssnano({
      zindex: false,
      discardUnused: false,
      reduceIdents: false,
      mergeIdents: false,
      discardComments: {
        removeAll: true
      }
    }) : function () {},
    cssReporter({
      clearMessages: true
    })
  ]

  return gulp
    .src(kc.src.style + '*.css')
    .pipe(env === 'development' ? $.sourcemaps.init() : gutil.noop())
    .pipe($.postcss(processors).on('error', errorHandler))
    .pipe(env === 'development' ? $.sourcemaps.write('.') : gutil.noop())
    .pipe(gulp.dest(kc.dist.css))
};

gulp.task('compiler:css', compilerCssTask)
module.exports = compilerCssTask
