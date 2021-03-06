/**
 * Webpack Config for Javascript Bundling
 *
 * @package  generator-kittn
 * @author   Lars Eichler <larseichler.le@gmail.com>
 */
import path from 'path'
import webpack from 'webpack'
import WebpackBar from 'webpackbar'
import Stylish from 'webpack-stylish'

<% if ( projectusage !== 'webpackApp' ) { %>
  import CleanWebpackPlugin from 'clean-webpack-plugin'
<% } %>

import HtmlWebpackPlugin from 'html-webpack-plugin'
import WriteFilePlugin from 'write-file-webpack-plugin'

<% if ( projectstylelint && (projectusage === 'webpackApp' || projectjsframework === 'vue') ) { %>
  // Use easy-stylelint-plugin until stylelint-webpack-plugin is webpack 4 ready
  // See: https://github.com/JaKXz/stylelint-webpack-plugin/issues/137
  import EasyStylelintPlugin from 'easy-stylelint-plugin'
<% } %>
import ExtractTextPlugin from 'extract-text-webpack-plugin'
import OptimizeCSSPlugin from 'optimize-css-assets-webpack-plugin'
<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
  import { VueLoaderPlugin } from 'vue-loader'
  const SpriteLoaderPlugin = require('svg-sprite-loader/plugin')
<% } %>

const utils = require('./utils')

const nodeEnv = process.env.NODE_ENV || 'production'

const {
  ifProduction,
  ifDevelopment
} = utils.getIfUtils(nodeEnv)<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>

const CSS_LOADERS = [
  {
    loader: 'css-loader',
    options: {
      autoprefixer: false,
      sourceMap: ifProduction(false, true),
      url: true
    }
  },
  {
    loader: 'postcss-loader',
    options: {
      sourceMap: ifProduction(false, true),
      config: {
        ctx: {
          normalize: true
        }
      }
    }
  },
  {
    loader: 'sass-loader',
    options: {<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
      includePaths: [utils.resolve(utils.kittnConf.src.style)],<% } %>
      sourceMap: ifProduction(false, true)
    }
  }
]<% } %>

/*
 |--------------------------------------------------------------------------
 | Let the config begin
 |--------------------------------------------------------------------------
 */
export default {
  entry: utils.removeEmpty(utils.entryPoints),
  output: {
    pathinfo: ifDevelopment(true, false),
    path: utils.paths.PUBLIC_PATH
  },
  stats: 'none',
  resolve: {
    extensions: [
      <% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
        '.vue',
      <% } %>
      '.js'
      <% if ( projecttypescript ) { %>,
        '.ts',
        '.tsx'
      <% } %>
    ],
    modules: [utils.resolve(utils.kittnConf.src.base), utils.resolve('node_modules')],
    alias: {
      <% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
        components: path.resolve(utils.paths.LOADER_PATH, 'components/'),

        <% if ( projectusage === 'webpackApp' ) { %>
          bitmaps: path.resolve(utils.paths.SRC_ROOT, 'images/bitmaps/'),
          icons: path.resolve(utils.paths.SRC_ROOT, 'images/vectors/'),
          iconsSingle: path.resolve(utils.paths.SRC_ROOT, 'images/vectorsSingle/'),
          appstyles$: path.resolve(utils.paths.CSS_ROOT, '_app.scss'),
          fonts$: path.resolve(utils.paths.SRC_ROOT, 'fonts/'),
        <% } %>

        store: path.resolve(utils.paths.LOADER_PATH, 'store'),

        <% if ( locals.projectvueversion && projectvueversion === 'standalone' ) { %>
          'vue$': 'vue/dist/vue.common.js',
        <% } %>
      <% } %>
      src: utils.resolve(utils.kittnConf.src.base)
    }
  },
  module: {
    rules: [
      {
        enforce: 'pre',
        test: /\.(js<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>|vue<% } %>)$/,
        loader: 'eslint-loader',
        options: {
          configFile: ifProduction('./.eslintrc.js', './.eslintrc-dev.js'),
          formatter: require('eslint-friendly-formatter')
        },
        exclude: /node_modules/,
        include: utils.resolve(utils.kittnConf.src.base)
      },
      {
        test: /\.js$/,
        include: utils.resolve(utils.kittnConf.src.base),
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            cacheDirectory: true
          }
        }
      }<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>,
        {
          test: /\.vue$/,
          loader: 'vue-loader'
        },
        {
          test: /\.css$/,
          use: ifProduction(
            ExtractTextPlugin.extract({
              fallback: 'vue-style-loader',
              use: ['css-loader']
            }),
            ['vue-style-loader', 'css-loader']
          )
        },
        {
          test: /\.scss$/,
          include: [utils.resolve(utils.kittnConf.src.style), utils.resolve(utils.kittnConf.src.js)],
          exclude: [utils.resolve('node_modules'), utils.resolve(utils.kittnConf.dist.base)],
          use: ifProduction(
            ExtractTextPlugin.extract({
              fallback: 'vue-style-loader',
              use: CSS_LOADERS
            }),
            ['vue-style-loader', ...CSS_LOADERS]
          )
        },
        {
          test: /\.(png|jpe?g|gif|svg)(\?\S*)?$/,
          exclude: [
            path.resolve(utils.paths.SRC_ROOT, 'images/vectors/'),
            path.resolve(utils.paths.SRC_ROOT, 'images/vectorsSingle/')
          ],
          use: [
            {
              loader: 'url-loader',
              options: {
                limit: 8192,
                fallback: 'file-loader',
                outputPath: utils.assetsPath('img/'),
                publicPath: utils.assetsPath('img/'),
                name: '[name].[ext]'
              }
            }
          ]
        },
        {
          test: /\.(eot|ttf|woff|woff2|svg)(\?\S*)?$/,
          exclude: [
            path.resolve(utils.paths.SRC_ROOT, 'images/vectors/'),
            path.resolve(utils.paths.SRC_ROOT, 'images/vectorsSingle/')
          ],
          use: [
            {
              loader: 'file-loader',
              query: {
                outputPath: utils.assetsPath('fonts/'),
                publicPath: ifDevelopment('assets/fonts/', '../fonts/'),
                name: '[name].[ext]'
              }
            }
          ]
        },
        {
          test: /\.svg$/,
          include: [
            path.resolve(utils.paths.SRC_ROOT, 'images/vectors/'),
            path.resolve(utils.paths.SRC_ROOT, 'images/vectorsSingle/')
          ],
          use: [
            {
              loader: 'svg-sprite-loader'
            },
            'svg-transform-loader',
            'svgo-loader'
          ]
        }
      <% } %><% if ( projecttypescript ) { %>,
        {
          test: /\.tsx?$/,
          exclude: /node_modules/,
          use: [
            'babel-loader',
            {
              loader: 'ts-loader',
              options: {
                transpileOnly: true,
                experimentalWatchApi: true,
                appendTsSuffixTo: [/\.vue$/]
              }
            }
          ]
        },
      <% } %>
    ]
  },
  plugins: utils.removeEmpty([<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
    new VueLoaderPlugin(),
    <% } %>
    new webpack.NamedModulesPlugin(),
    new WebpackBar(),
    new Stylish(),
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(nodeEnv)
      }
    }),

    <% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
      new SpriteLoaderPlugin({ plainSprite: true }),
    <% } %>

    <% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
      new ExtractTextPlugin({
        filename: utils.assetsPath('css/[name].<% if ( projectusage === 'webpackApp' ) { %>[chunkhash].<% } %>css'),
        allChunks: true
      }),
      new OptimizeCSSPlugin(),
    <% } %>

    <% if ( projectstylelint && (projectusage === 'webpackApp' || projectjsframework === 'vue') ) { %>

      // Doesn't work yet in dev-mode with webpack 4
      // See: https://github.com/JaKXz/stylelint-webpack-plugin/issues/137
      new EasyStylelintPlugin({
        context: utils.paths.LOADER_PATH
      }),

      <% if ( projectusage === 'webpackApp' ) { %>
        new EasyStylelintPlugin({
          context: utils.paths.CSS_ROOT
        }),
      <% } %>
    <% } %>

    <% if ( locals.projectstructure && projectstructure === 'twig' ) { %>
      ifProduction(
    <% } %>
      new HtmlWebpackPlugin({<% if ( projectusage === 'craft' || projectusage === 'craftCB' ) { %>
        filename: path.resolve(`${utils.kittnConf.dist.templates}/_parts/document-footer.html`),
        template: utils.kittnConf.src.templates + '_parts/document-footer.html',<% } else if ( projectusage === 'joomla') { %>
        filename: path.resolve(`${utils.kittnConf.dist.templates}/_parts/footer.php`),
        template: utils.kittnConf.src.structure + '_parts/footer.php',<% } else if ( projectusage === 'wordpress') { %>
        filename: path.resolve(`${utils.kittnConf.dist.templates}/footer.php`),
        template: utils.kittnConf.src.structure + 'footer.php',<% } else if ( projectusage === 'wordpressCB' ) { %>
        filename: path.resolve(`${utils.kittnConf.dist.templates}/_parts/document-footer.php`),
        template: utils.kittnConf.src.structure + '_parts/document-footer.php',<% } else { %>
        filename: 'index.html',
        template: <% if ( locals.projectstructure && projectstructure === 'twig' ) { %>utils.kittnConf.dist.markup + 'index.html'<% } else { %>utils.kittnConf.src.structure + 'index.html'<% } %>,<% } %>
        inject: <% if ( projectusage === 'craft' || projectusage === 'craftCB' || projectusage === 'wordpress' || projectusage === 'wordpressCB' || projectusage === 'joomla' || projectusage === 'joomlaCB' ) { %>false<% } else { %>true<% } %>,
        hash: false<% if ( projectusage !== 'craft' && projectusage !== 'craftCB' && projectusage !== 'wordpress' && projectusage !== 'wordpressCB' && projectusage !== 'joomla' && projectusage !== 'joomlaCB' ) { %>,
        minify: {
          removeComments: true,
          collapseWhitespace: true,
          removeAttributeQuotes: false
        }<% } %>,
        chunksSortMode: 'dependency'
      })
    <% if ( locals.projectstructure && projectstructure === 'twig' ) { %>
      )
    <% } %>
  ])
}
