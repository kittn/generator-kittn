import webpack from 'webpack'
import merge from 'webpack-merge'
import path from 'path'
import yargs from 'yargs'
import ExtractTextPlugin from 'extract-text-webpack-plugin'<% if ( projectJSFramework === 'Vue.js' ) { %>
import vueutils from './build/vue-utils'<% } %>
import kittnConf from './config.json'

const argv = yargs.argv
const env = argv.env || 'development'
const nodeEnv = process.env.NODE_ENV || 'production'

const ROOT_PATH = path.resolve(__dirname)<% if (projectUsage == 'Integrate in CraftCMS') { %>
const PUBLIC_PATH = path.join(ROOT_PATH, `${kittnConf.dist.dist}/public/`)<% } else { %>
const PUBLIC_PATH = path.join(ROOT_PATH, kittnConf.dist.dist)<% } %>
const ASSETS_PATH = kittnConf.dist.webpackjsassets
const SOURCE_PATH = './js/'
const LOADER_PATH = path.join(ROOT_PATH, kittnConf.src.js)
const PRIMARY_FILE_NAME = 'main.js'

let bundle = {
  context: path.join( ROOT_PATH, 'src'),
  entry: {
    main: `${SOURCE_PATH}${PRIMARY_FILE_NAME}`
  },
  output: {
    path: path.join(PUBLIC_PATH, ASSETS_PATH),
    publicPath: '/' + ASSETS_PATH,
    filename: 'js/[name].js'
  },
  externals: {
    Modernizr: 'Modernizr'
  },
  resolve: {
    extensions: [<% if ( projectJSFramework === 'Vue.js' ) { %>
      '.vue',<% }  %>
      '.js'
    ],
    alias: {<% if ( projectJSFramework === 'Vue.js' && projectvueversion === 'Standalone' ) { %>
      'vue$': 'vue/dist/vue.common.js'<% } %>
    }
  },
  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.js$/,
        loader: 'eslint-loader',
        exclude: /node_modules/
      },
      {
        test: /\.js$/,
        loader: 'babel-loader',
        include: LOADER_PATH,
        exclude: /node_modules/
      }<% if ( projectJSFramework === 'Vue.js' ) { %>,
      {
        test: /\.vue$/,
        include: LOADER_PATH,
        exclude: /node_modules/,
        loader: 'vue-loader'
      },<% } %>
    ]
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(nodeEnv)
      }
    }),<% if (projectjquery) { %>
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        'window.jQuery': 'jquery'
    }),<% } %>
    new webpack.LoaderOptionsPlugin({
      options: {
        eslint: {
          failOnError  : false,
          failOnWarning: false,
          configFile   : './.eslintrc',
          formatter    : require('eslint-formatter-pretty')
        }<% if ( projectJSFramework === 'Vue.js' ) { %>,
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
<% if ( projectJSFramework === 'Vue.js' ) { %>
// add extract plugin for vue
if(nodeEnv === 'production') {
  bundle = merge(bundle, {
    plugins: [
      new ExtractTextPlugin('css/vue-styles.css')
    ]
  })
}<% } %>

export default bundle
