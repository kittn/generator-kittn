const merge = require('webpack-merge')
import path from 'path'<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %><% if ( projectusage === 'webpackApp' ) { %>
import CleanWebpackPlugin from 'clean-webpack-plugin'<% } %>
import ExtractTextPlugin from 'extract-text-webpack-plugin'<% if ( projectstylelint ) { %>
import StylelintPlugin from 'stylelint-webpack-plugin'<% } %>
import OptimizeCSSPlugin from 'optimize-css-assets-webpack-plugin'<% } %>
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
    ),<% } %><% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %><% if ( projectstylelint ) { %>
    // Doesn't work yet in dev-mode with webpack 4
    // See: https://github.com/JaKXz/stylelint-webpack-plugin/issues/137
    new StylelintPlugin({
      context: utils.paths.LOADER_PATH,
      syntax: 'scss'
    }),<% if ( projectusage === 'webpackApp' ) { %>
    new StylelintPlugin({
      context: utils.paths.CSS_ROOT,
      syntax: 'scss'
    }),<% } %><% } %>
    new ExtractTextPlugin({
      filename: utils.assetsPath('css/[name].<% if ( projectusage === 'webpackApp' ) { %>[chunkhash].<% } %>css'),
      allChunks: true
    }),
    new OptimizeCSSPlugin({
      cssProcessorOptions: {
        safe: true
      }
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
