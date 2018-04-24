
import webpack from 'webpack'
import FriendlyErrorsWebpackPlugin from 'friendly-errors-webpack-plugin'
<% if ( (projectusage === 'html' && projectstructure === 'uncompiled') || projectusage === 'webpackApp' ) { %>
  // import WriteFilePlugin from 'write-file-webpack-plugin'
<% } %>
<% if (projectusage === 'craft' || projectusage === 'craftCB' || projectusage === 'wordpress' || projectusage === 'wordpressCB' || projectusage === 'joomla' || projectusage === 'joomlaCB') { %>
  import WriteFilePlugin from 'write-file-webpack-plugin'
<% } %>
import utils from './utils'
const baseWebpackConfig = require('./webpack.config.base.babel.js')
const merge = require('webpack-merge')
<% if ( projectusage === 'webpackApp' ) { %>
  const path = require('path')
  const portfinder = require('portfinder')
<% } %>

<% if ( projectusage !== 'webpackApp' ) { %>
/*
 |--------------------------------------------------------------------------
 | Hot Middleware Client
 |--------------------------------------------------------------------------
 */

const hotClient =
'webpack-hot-middleware/client?path=/__webpack_hmr&timeout=20000&reload=true&overlay=true'
<% } %>

/*
 |--------------------------------------------------------------------------
 | Defining Entry Points, could be used to manually split Parts of the Application, for example
 | Admin Javascript and FrontEnd JavaScript
 |--------------------------------------------------------------------------
 */
let entries = utils.entryPoints
<% if ( projectusage !== 'webpackApp' ) { %>
  Object.keys(entries).forEach((entry) => entries[entry] = [hotClient].concat(entries[entry]))
<% } %>

<% if ( projectusage === 'webpackApp' ) { %>
  const HOST = 'localhost'
  const PORT = utils.kittnConf.browsersync.port
<% } %>

const devWebpackConfig = merge(baseWebpackConfig.default, {
  <% if (projectusage !== 'webpackApp' ) { %>
    mode: 'development',
  <% } %>
  devtool: 'eval-source-map',
  entry: utils.removeEmpty(entries),
  output: {
    publicPath: '/',
    filename: utils.assetsPath('js/[name].js'),
    chunkFilename: utils.assetsPath('js/chunks/[name].js')
  },

  <% if ( projectusage === 'webpackApp' ) { %>
    devServer: {
      clientLogLevel: 'warning',
      historyApiFallback: {
        rewrites: [
          { from: /.*/, to: path.posix.join(utils.kittnConf.dist.markup, 'index.html') },
        ],
      },
      hot: true,
      compress: true,
      host: HOST,
      port: PORT,
      proxy: [
        {
          path: /\/(?!__webpack_hmr).+/
        }
      ],
      quiet: true,
      stats: { colors: true },
      contentBase: path.join(__dirname, `../${utils.kittnConf.src.base}`),
      publicPath: '/',
      open: utils.kittnConf.browsersync.openbrowser,
      overlay: true
    },
  <% } %>
  plugins: [<% if ( projectusage !== 'webpackApp' ) { %>
    new FriendlyErrorsWebpackPlugin(),<% } %>
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoEmitOnErrorsPlugin(),
    <% if ( (projectusage === 'html' && projectstructure === 'uncompiled') || projectusage === 'webpackApp' || projectusage === 'wordpress' || projectusage === 'wordpressCB') { %>
      // only needed if you want to write the files to your harddrive in dev-mode
      // new WriteFilePlugin({
      //   log: false,
      //   test: /^(?!.+(?:hot-update.(js|json))).+$/
      // })
    <% } %>

    <% if (projectusage === 'craft' || projectusage === 'craftCB') { %>
      new WriteFilePlugin({
        log: false,
        test: /^(?!.+(?:hot-update.(js|json))).+$/
      })
    <% } %>
  ]
})<% if ( projectusage === 'webpackApp' ) { %>

module.exports = new Promise((resolve, reject) => {
  portfinder.basePort = process.env.PORT || utils.kittnConf.browsersync.port
  portfinder.getPort((err, port) => {
    if (err) {
      reject(err)
    } else {
      // publish the new Port, necessary for e2e tests
      process.env.PORT = port
      // add port to devServer config
      devWebpackConfig.devServer.port = port

      // Add FriendlyErrorsPlugin
      devWebpackConfig.plugins.push(new FriendlyErrorsWebpackPlugin({
        compilationSuccessInfo: {
          messages: [`Your application is running here: http://${devWebpackConfig.devServer.host}:${port}`],
        }
      }))

      resolve(devWebpackConfig)
    }
  })
})<% } else { %>
module.exports = devWebpackConfig
<% } %>
