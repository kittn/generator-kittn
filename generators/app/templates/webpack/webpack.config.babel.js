/**
 * Webpack Config for Javascript Bundling
 *
 * @package  generator-kittn
 * @author   Lars Eichler <larseichler.le@gmail.com>
 */
import path from 'path'
const argv = require('yargs').argv
import { getIfUtils, removeEmpty } from 'webpack-config-utils'
const kittnConf = require('../config.json')

const nodeEnv = argv.mode || 'development'

const {
  ifProduction,
  ifDevelopment
} = getIfUtils(nodeEnv)

/*
 |--------------------------------------------------------------------------
 | Setting some paths for our Application
 |--------------------------------------------------------------------------
 */
const ROOT_PATH = path.resolve(__dirname, '..')
const PUBLIC_PATH = path.join(ROOT_PATH, kittnConf.dist.webpackpublic)
const ASSETS_PATH = kittnConf.dist.webpackjsassets
const LOADER_PATH = path.join(ROOT_PATH, kittnConf.src.js)

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

const entryPoints = kittnConf.src.jsEntryPoints

if (ifDevelopment()) {
  Object.keys(entryPoints).forEach((entry) => entryPoints[entry] = [hotClient].concat(entryPoints[entry]))
}

function resolve (dir) {
  return path.join(__dirname, '..', dir)
}


/*
 |--------------------------------------------------------------------------
 | Let the config begin
 |--------------------------------------------------------------------------
 */
export default {
  entry: removeEmpty(entryPoints),
  mode: nodeEnv,
  output: {
    path: path.join(PUBLIC_PATH, ASSETS_PATH),
    publicPath: '/' + ASSETS_PATH,
    filename: '[name].js',
    chunkFilename: '[name].js'
  },
  resolve: {
    extensions: [<% if ( projectjsframework === 'vue' ) { %>
      '.vue',<% } %>
      '.js'
    ],
    modules: [resolve(kittnConf.src.base), resolve('node_modules')],
    alias: {<% if ( projectjsframework === 'vue' ) { %>
      components: path.resolve(LOADER_PATH, 'components/'),<% } %>
      src: resolve(kittnConf.src.base)
    }
  },
  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.(js<% if ( projectjsframework === 'vue' ) { %>,|vue<% } %>)$/,
        loader: 'eslint-loader',
        options: {
          formatter: require('eslint-friendly-formatter')
        },
        exclude: /node_modules/,
        include: resolve(kittnConf.src.base)
      },
      {
        test: /\.js$/,
        use: 'babel-loader',
        include: resolve(kittnConf.src.base),
        exclude: /node_modules/
      },
      {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: {
          hot: true,
          loaders: {
            scss: [
              { loader: 'vue-style-loader' },
              {
                loader: 'css-loader',
                options: {
                  url: true
                }
              },
              {
                loader: 'postcss-loader',
                options: {
                  config: {
                    ctx: {
                      normalize: false
                    }
                  }
                }
              },
              {
                loader: 'sass-loader'
              }
            ]
          }
        }
      }
    ]
  }
}
