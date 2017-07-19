/**
 * Webpack Config for Javascript and CSS Bundling
 *
 * @package  generator-mh-boilerplate
 * @author   Martin Herweg <info@martinherweg.de>
 */

import webpack from 'webpack'
import { getIfUtils, removeEmpty } from 'webpack-config-utils'
import path from 'path'
import config from '../config.json'
import ExtractTextPlugin from 'extract-text-webpack-plugin'
import HtmlWebpackPlugin from 'html-webpack-plugin'
import WriteFilePlugin from 'write-file-webpack-plugin'
import FriendlyErrorsWebpackPlugin from 'friendly-errors-webpack-plugin'
import Webpack2Polyfill from 'webpack2-polyfill-plugin'
import { BundleAnalyzerPlugin } from 'webpack-bundle-analyzer'

const {
  ifProduction,
  ifDevelopment
} = getIfUtils(process.env.NODE_ENV)

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

/*
 |--------------------------------------------------------------------------
 | return webpack config object
 |--------------------------------------------------------------------------
 */

export default {
  // we have to use source map for css source maps, slightly longer compile times
  // devtool: 'source-map',
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
    alias: {
      src: resolve(config.src.base)
    }
  },
  module: {
    rules: [
      {
        test: /\.(js)$/,
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
      },
      // {
      //   test: /\.vue$/,
      //   loader: 'vue-loader',
      //   options: {
      //     loaders: {
      //       scss: ifProduction(
      //         ExtractTextPlugin.extract({
      //           use: 'css-loader!sass-loader',
      //           fallback: 'vue-style-loader'
      //         }),
      //         'vue-style-loader!css-loader!sass-loader'
      //       )
      //     }
      //   }
      // },

      {
        test: /\.json$/,
        use: 'json-loader'
      },
      // {
      //   test: /\.scss$/,
      //   include: resolve(config.src.css),
      //   exclude: [resolve('node_modules'), resolve('dist/')],
      //   use: ExtractTextPlugin.extract({
      //     fallback: 'style-loader',
      //     use: [
      //       {
      //         loader: 'css-loader',
      //         options: {
      //           autoprefixer: false,
      //           sourceMap: true,
      //           importLoaders: 3,
      //           url: false
      //         }
      //       },
      //       {
      //         loader: 'postcss-loader',
      //         options: {
      //           sourceMap: true
      //         }
      //       },
      //       {
      //         loader: 'sass-loader',
      //         options: {
      //           sourceMap: true
      //         }
      //       }
      //     ]
      //   })
      // }
    ]
  },
  plugins: removeEmpty([
    new Webpack2Polyfill(),
    // new CleanWebpackPlugin([config.dist.css, config.dist.js], {
    //   root: BASE_PATH,
    //   verbose: true
    // }),
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
    ifProduction(
      new webpack.DefinePlugin({
        'process.env': {
          NODE_ENV: '"production"'
        }
      })
    ),
    ifProduction(
      new webpack.optimize.UglifyJsPlugin({
        sourceMap: true,
        compress: {
          warnings: false
        }
      })
    ),
    ifProduction(
      new webpack.optimize.CommonsChunkPlugin({
        name: 'vendor',
        minChunks: function (module) {
          // this assumes your vendor imports exist in the node_modules directory
          return (
            module.context && module.context.indexOf('node_modules') !== -1
          );
        }
      })
    ),
    ifProduction(
      // extract webpack runtime and module manifest to its own file in order to
      // prevent vendor hash from being updated whenever app bundle is updated
      new webpack.optimize.CommonsChunkPlugin({
        name: 'manifest',
        chunks: ['vendor']
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
      filename: ifDevelopment(
        assetsPath('css/[name].css'),
        assetsPath('css/[name].[chunkhash].css')
      )
    }),
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
