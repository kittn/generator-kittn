const merge = require('webpack-merge')
import path from 'path'<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %><% if ( projectusage === 'webpackApp' ) { %>
import CleanWebpackPlugin from 'clean-webpack-plugin'<% } %>
import OptimizeCSSPlugin from 'optimize-css-assets-webpack-plugin'
import ExtractTextPlugin from 'extract-text-webpack-plugin'<% } %><% if (projectusage === 'craft' || projectusage === 'craftCB') { %>
import HtmlWebpackPlugin from 'html-webpack-plugin'<% } %>
import { BundleAnalyzerPlugin } from 'webpack-bundle-analyzer'
const utils = require('./utils')
const baseWebpackConfig = require('./webpack.config.base.babel.js')

/*
 |--------------------------------------------------------------------------
 | Merge the configs
 |--------------------------------------------------------------------------
 */
const prodWebpackConfig = merge(baseWebpackConfig.default, {
  output: {
    filename: utils.assetsPath('js/[name].<% if ( projectusage === 'webpackApp' ) { %>[hash].<% } %>js'),
    chunkFilename: utils.assetsPath('js/chunks/[name].[hash].js'),
    publicPath: './'
  },
  plugins: [<% if ( projectusage === 'webpackApp' ) { %>
    new CleanWebpackPlugin(
      [
        utils.resolve(utils.kittnConf.dist.js),
        utils.resolve(utils.kittnConf.dist.css)
      ],
      {
        root: utils.paths.PUBLIC_PATH,
        beforeEmit: true,
        exclude: ['ls.respimg.js', 'modernizr.js']
      }
    ),<% } %><% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
    new ExtractTextPlugin({
      filename: utils.assetsPath('css/[name].<% if ( projectusage === 'webpackApp' ) { %>[chunkhash].<% } %>css'),
      allChunks: true
    }),
    new OptimizeCSSPlugin({
      cssProcessorOptions: {
        safe: true
      }
    }),<% } %><% if (projectusage === 'craft' || projectusage === 'craftCB') { %>
    new HtmlWebpackPlugin({
      filename: path.resolve(`${utils.kittnConf.dist.templates}/_parts/document-footer.html`),
      template: utils.kittnConf.src.templates + '_parts/document-footer.html',
      inject: false,
      hash: false,
      minify: {
        removeComments: true,
        collapseWhitespace: true,
        removeAttributeQuotes: false
      },
      chunksSortMode: 'dependency'
    }),<% } %>
    new BundleAnalyzerPlugin({
      analyzerMode: 'disabled',
      generateStatsFile: true,
      statsFilename: `${utils.paths.ROOT_PATH}/webpack/stats.json`,
      logLevel: 'info'
    })
  ]
})

module.exports = prodWebpackConfig
