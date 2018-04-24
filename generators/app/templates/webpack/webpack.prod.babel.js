import { BundleAnalyzerPlugin } from 'webpack-bundle-analyzer'
import CleanWebpackPlugin from 'clean-webpack-plugin'
const merge = require('webpack-merge')
const utils = require('./utils')
const baseWebpackConfig = require('./webpack.config.base.babel.js')

/*
 |--------------------------------------------------------------------------
 | Merge the configs
 |--------------------------------------------------------------------------
 */
const prodWebpackConfig = merge(baseWebpackConfig.default, {
  devtool: '',
  output: {<% if ( projectusage === 'wordpress' || projectusage === 'wordpressCB' ) { %>
    filename: 'js/[name].[hash].js',
    chunkFilename: 'js/chunks/[name].[hash].js'
    <% } else { %>
    filename: utils.assetsPath('js/[name].<% if ( projectusage === 'webpackApp' || projectusage === 'craft' || projectusage === 'craftCB' ) { %>[hash].<% } %>js'),
    chunkFilename: utils.assetsPath('js/chunks/[name].[hash].js'),
    publicPath: './'
    <% } %>
  },
  plugins: [
    <% if ( projectusage === 'webpackApp' || projectusage === 'craft' || projectusage === 'craftCB'  || projectusage === 'wordpress' || projectusage === 'wordpressCB') { %>
      new CleanWebpackPlugin(
        [
          utils.resolve(utils.kittnConf.dist.js),
          utils.resolve(utils.kittnConf.dist.css)
        ],
        {
          root: utils.paths.PUBLIC_PATH,
          beforeEmit: true<% if ( projectusage !== 'webpackApp') { %>,
          exclude: ['style.css', 'style.css.map']<% } %>
        }
      ),
    <% } %>
    new BundleAnalyzerPlugin({
      analyzerMode: 'disabled',
      generateStatsFile: true,
      statsFilename: `${utils.paths.ROOT_PATH}/webpack/stats.json`,
      logLevel: 'info'
    })
  ]
})

module.exports = prodWebpackConfig
