/**
 * Webpack Config for Javascript and CSS Bundling
 *
 * @package  generator-mh-boilerplate
 * @author   Martin Herweg <info@martinherweg.de>
 */

import webpack from 'webpack'
import { getIfUtils, removeEmpty } from 'webpack-config-utils'
import path from 'path'
import yargs from 'yargs'
import config from '../config.json'
import ExtractTextPlugin from 'extract-text-webpack-plugin'
import HtmlWebpackPlugin from 'html-webpack-plugin'
import WriteFilePlugin from 'write-file-webpack-plugin'
import FriendlyErrorsWebpackPlugin from 'friendly-errors-webpack-plugin'
import Webpack2Polyfill from 'webpack2-polyfill-plugin'<% if ( projectjsframework === 'vue' && projectstylelint) { %>
import StylelintPlugin from 'stylelint-webpack-plugin'<% } %>
import { BundleAnalyzerPlugin } from 'webpack-bundle-analyzer'

const argv = yargs.argv
const env = argv.env || 'development'
const nodeEnv = process.env.NODE_ENV || 'production'

const {
  ifProduction,
  ifDevelopment
} = getIfUtils(nodeEnv)

/*
 |--------------------------------------------------------------------------
 | Setting some paths for our Application
 |--------------------------------------------------------------------------
 */
const BASE_PATH = path.join(path.resolve(__dirname, '../'))
const ASSETS_ROOT = path.resolve(BASE_PATH, config.dist.base)
const JS_ROOT = path.resolve(BASE_PATH, config.src.js)
const JS_DIST = path.resolve(BASE_PATH, config.dist.js)

let outputPath = ASSETS_ROOT

if (ifDevelopment()) {
  outputPath = JS_DIST
}

/*
 |--------------------------------------------------------------------------
 | Hot Middleware Client
 |--------------------------------------------------------------------------
 */

const hotClient =
  'webpack-hot-middleware/client?path=/__webpack_hmr&timeout=20000&reload=true&overlay=true'

/*
 |--------------------------------------------------------------------------
 | Defining Entry Points, could be used to manually split Parts of the Application, for example
 | Admin Javascript and FrontEnd JavaScript
 |--------------------------------------------------------------------------
 */

const entryPoints = {}

Object.keys(config.src.jsEntryPoints).forEach(
  entry => (entryPoints[entry] = ifDevelopment() ? [hotClient].concat(`${JS_ROOT}/${config.src.jsEntryPoints[entry]}`) : `${JS_ROOT}/${config.src.jsEntryPoints[entry]}`)
)

function assetsPath (_path) {
  return path.posix.join('assets/', _path)
}

const chunks = []

const chunksInject = [
  {
    filename: path.resolve(`${config.dist.markup}index.html`),
    file: null,
    inject: false
  }
]

chunksInject.forEach((chunk) => {
  const plugin = new HtmlWebpackPlugin({
    filename: chunk.filename,
    inject: chunk.inject,
    minify: false,
    // necessary to consistently work with multiple chunks via CommonsChunkPlugin
    chunksSortMode: 'dependency'
  })

  chunks.push(plugin)
})

/*
 |--------------------------------------------------------------------------
 | return webpack config object
 |--------------------------------------------------------------------------
 */

export default {
  // we have to use source map for css source maps, slightly longer compile times
  devtool: 'source-map',
  context: BASE_PATH,
  // entry is a function so that we can use environment variables
  entry: removeEmpty(entryPoints),
  output: {
    path: outputPath,
    publicPath: '',
    filename: ifProduction(
      assetsPath('js/[name].js')
    ),
    chunkFilename: assetsPath('js/[id].js')
  },
  resolve: {
    extensions: ['.js', '.json', '.vue'],
    modules: [resolve(config.src.base), resolve('node_modules')],
    alias: {<% if ( projectjsframework === 'vue' ) { %>
      components: path.resolve(JS_ROOT, 'components/')<% if ( projectvueversion === 'standalone' ) { %>,
      'vue$': 'vue/dist/vue.common.js',<% } } %>
      src: resolve(config.src.base)
    }
  },
  module: {
    rules: [
      {
        test: /\.(js<% if ( projectjsframework === 'vue' ) { %>|vue<% } %>)$/,
        loader: 'eslint-loader',
        options: {
          formatter: require('eslint-friendly-formatter')
        },
        enforce: 'pre',
        include: resolve(config.src.base)
      },
      {
        test: /\.js$/,
        use: 'babel-loader',
        include: resolve(config.src.base)
      },<% if ( projectjsframework === 'vue') { %>
      {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: {
          loaders: {
            scss: ifProduction(
              ExtractTextPlugin.extract({
                use: 'css-loader!postcss-loader!sass-loader',
                fallback: 'vue-style-loader'
              }),
              'vue-style-loader!css-loader!postcss-loader!sass-loader'
            )
          }
        }
      },<% } %>

      {
        test: /\.json$/,
        use: 'json-loader'
      }
    ]
  },
  plugins: removeEmpty([
    new Webpack2Polyfill(),
    ifProduction(
      new BundleAnalyzerPlugin({
        analyzerMode: 'disabled',
        generateStatsFile: true,
        statsFilename: `${BASE_PATH}/webpack/stats.json`,
        logLevel: 'info'
      })
    ),
    ifDevelopment(new webpack.HotModuleReplacementPlugin()),
    ifDevelopment(new webpack.NamedModulesPlugin()),
    ifDevelopment(new webpack.NoEmitOnErrorsPlugin()),
    ifDevelopment(new FriendlyErrorsWebpackPlugin()),
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(nodeEnv)
      }
    }),
    ifProduction(
      new webpack.optimize.UglifyJsPlugin({
        sourceMap: true,
        compress: {
          warnings: false
        }
      })
    ),
    ifProduction(
      new webpack.LoaderOptionsPlugin({
        minimize: true,
        options: {
          eslint: {
            configFile: './.eslintrc.js'
          }
        }
      })
    ),
    ifDevelopment(
      new webpack.LoaderOptionsPlugin({
        options: {
          eslint: {
            failOnError: false,
            failOnWarning: false,
            configFile: './.eslintrc-dev.js',
            formatter: require('eslint-formatter-pretty')
          }
        }
      })
    ),
    new ExtractTextPlugin({
      filename: assetsPath('css/vue-style.css')
    }),<% if ( projectjsframework === 'vue' && projectstylelint) { %>
    new StylelintPlugin({
      context: JS_ROOT,
      syntax: 'scss'
    }),<% } %>
    // ...chunks,
    new WriteFilePlugin({
      log: true,
      test: /^(?!.+(?:hot-update.(js|json))).+$/
    }),
    new webpack.optimize.ModuleConcatenationPlugin()
  ])
}

function resolve (dir) {
  return path.join(__dirname, '..', dir)
}
