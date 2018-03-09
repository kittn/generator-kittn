const merge = require('webpack-merge')
const path = require('path')
const portfinder = require('portfinder')
import webpack from 'webpack'
import FriendlyErrorsWebpackPlugin from 'friendly-errors-webpack-plugin'
const baseWebpackConfig = require('./webpack.config.babel.js')
const kittnConf = require('../config.json')

const HOST = 'localhost'
const PORT = kittnConf.browsersync.port

const devWebpackConfig = merge(baseWebpackConfig, {
  // these devServer options should be customized in /config/index.js
  devServer: {
    clientLogLevel: 'warning',
    historyApiFallback: {
      rewrites: [
        { from: /.*/, to: path.posix.join(kittnConf.dist.markup, 'index.html') },
      ],
    },
    hot: true,
    compress: true,
    host: HOST,
    port: PORT,
    proxy: {},
    contentBase: path.join(__dirname, kittnConf.dist.base),
    open: kittnConf.browsersync.openbrowser,
    overlay: true,
    poll: false,
    publicPath: kittnConf.dist.base
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NamedModulesPlugin(),
    new webpack.NoEmitOnErrorsPlugin()
  ]
})

module.exports = new Promise((resolve, reject) => {
  portfinder.basePort = process.env.PORT || kittnConf.browsersync.port
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
})
