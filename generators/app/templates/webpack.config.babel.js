const webpack = require('webpack')
const merge = require('webpack-merge')
const path = require('path')
const yargs = require('yargs')
const ExtractTextPlugin = require('extract-text-webpack-plugin')<% if ( projectjsframework === 'vue' ) { %>
const vueutils = require('./build/vue-utils')<% } %>
const kittnConf = require('./config.json')

const argv = yargs.argv
const env = argv.env || 'development'
const nodeEnv = process.env.NODE_ENV || 'production'

const ROOT_PATH = path.resolve(__dirname)<% if (projectusage == 'craft') { %>
const PUBLIC_PATH = path.join(ROOT_PATH, `${kittnConf.dist.dist}/public/`)<% } else { %>
const PUBLIC_PATH = path.join(ROOT_PATH, kittnConf.dist.dist)<% } %>
const ASSETS_PATH = kittnConf.dist.webpackjsassets
const LOADER_PATH = path.join(ROOT_PATH, kittnConf.src.js)
const PRIMARY_FILE_NAME = 'main.js'

let bundle = {
  context: path.join(ROOT_PATH, 'src'),
  entry: {
    main: `${LOADER_PATH}${PRIMARY_FILE_NAME}`
  },
  output: {
    path: path.join(PUBLIC_PATH, ASSETS_PATH),
    publicPath: '/' + ASSETS_PATH,
    filename: 'js/[name].js'
  },
  externals: {
    Modernizr: 'Modernizr'<% if (projectjquery) { %>,
    jquery: 'jQuery'<% } %>
  },
  resolve: {
    extensions: [<% if ( projectjsframework === 'vue' ) { %>
      '.vue',<% }  %>
      '.js'
    ],
    alias: {<% if ( projectjsframework === 'vue' && projectvueversion === 'standalone' ) { %>
      'vue$': 'vue/dist/vue.common.js'<% } %>
    }
  },
  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.js$/,
        use: 'eslint-loader',
        exclude: /node_modules/
      },
      {
        test: /\.js$/,
        use: 'babel-loader',
        include: LOADER_PATH,
        exclude: /node_modules/
      }<% if ( projectjsframework === 'vue' ) { %>,
      {
        test: /\.vue$/,
        include: LOADER_PATH,
        exclude: /node_modules/,
        use: 'vue-loader'
      },<% } %>
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(nodeEnv)
      }
    }),
    new webpack.LoaderOptionsPlugin({
      options: {
        eslint: {
          failOnError  : false,
          failOnWarning: false,
          configFile: env === 'development' ? './.eslintrc-dev' : './.eslintrc',
          formatter    : require('eslint-formatter-pretty')
        }<% if ( projectjsframework === 'vue' ) { %>,
        vue: {
          loaders: vueutils.cssLoaders({
            sourceMap: false,
            extract: nodeEnv === 'production' ? true : false
          }),
          postcss: [
            require('autoprefixer')({
              browsers: ['last 2 versions']
            })
          ]
        }<% } %>
      }
    })
  ]
};
<% if ( projectjsframework === 'vue' ) { %>
// add extract plugin for vue
if(nodeEnv === 'production') {
  bundle = merge(bundle, {
    plugins: [
      new ExtractTextPlugin('css/vue-styles.css')
    ]
  })
}<% } %>

module.exports = bundle
