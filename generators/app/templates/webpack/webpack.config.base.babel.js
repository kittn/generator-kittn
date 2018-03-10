/**
 * Webpack Config for Javascript Bundling
 *
 * @package  generator-kittn
 * @author   Lars Eichler <larseichler.le@gmail.com>
 */
import path from 'path'
import webpack from 'webpack'<% if ( projectusage === 'webpackApp' || projectusage === 'html' || projectjsframework === 'vue' ) { %>
import HtmlWebpackPlugin from 'html-webpack-plugin'<% if ( projectusage === 'html' && projectstructure === 'uncompiled' ) { %>
import WriteFilePlugin from 'write-file-webpack-plugin'<% } %>
import ExtractTextPlugin from 'extract-text-webpack-plugin'<% } %>
const utils = require('./utils')

const nodeEnv = process.env.NODE_ENV || 'production'

const {
  ifProduction,
  ifDevelopment
} = utils.getIfUtils(nodeEnv)

const CSS_LOADERS = [
  {
    loader: 'css-loader',
    options: {
      autoprefixer: false,
      sourceMap: true,
      url: true
    }
  },
  {
    loader: 'postcss-loader',
    options: {
      sourceMap: true,
      config: {
        ctx: {
          normalize: true
        }
      }
    }
  },
  {
    loader: 'sass-loader',
    options: {
      sourceMap: true
    }
  }
]

/*
 |--------------------------------------------------------------------------
 | Let the config begin
 |--------------------------------------------------------------------------
 */
export default {
  entry: utils.removeEmpty(utils.entryPoints),
  output: {
    path: utils.paths.PUBLIC_PATH,
    filename: 'js/[name].<% if ( projectusage === 'webpackApp') { %>[hash].<% } %>js',
    chunkFilename: 'js/[name].<% if ( projectusage === 'webpackApp') { %>[hash].<% } %>js'
  },
  externals: {
    Modernizr: 'Modernizr'
  },
  resolve: {
    extensions: [<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
      '.vue',<% } %>
      '.js'
    ],
    modules: [utils.resolve(utils.kittnConf.src.base), utils.resolve('node_modules')],
    alias: {<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
      components: path.resolve(utils.paths.LOADER_PATH, 'components/'),<% if ( projectusage === 'webpackApp' ) { %>
      icons: path.resolve(utils.paths.SRC_ROOT, 'images/vectors/'),<% } %>
      store: path.resolve(utils.paths.LOADER_PATH, 'store'),<% if ( locals.projectvueversion && projectvueversion === 'standalone' ) { %>
      'vue$': 'vue/dist/vue.common.js',<% } } %>
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
        use: 'babel-loader',
        include: utils.resolve(utils.kittnConf.src.base),
        exclude: /node_modules/
      },<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
      {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: {
          hot: true,
          loaders: {
            scss: ifProduction(
              ExtractTextPlugin.extract({
                use: [...CSS_LOADERS],
                fallback: 'vue-style-loader',
              }),
              [{ loader: 'vue-style-loader'}, ...CSS_LOADERS]
            ),
          }
        }
      },
      {
        test: /\.css$/,
        use: ifProduction(ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: ['css-loader'],
        }), ['style-loader', 'css-loader'])
      },
      {
        test: /\.scss$/,
        include: utils.resolve(utils.kittnConf.src.style),
        exclude: [utils.resolve('node_modules'), utils.resolve(utils.kittnConf.dist.base)],
        use: ifProduction(ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: CSS_LOADERS,
        }), ['style-loader', ...CSS_LOADERS]),
      },
      {
        test: /\.(png|jpe?g|gif)(\?\S*)?$/,
        loader: 'url-loader',
        options: {
          fallback: 'file-loader'
        }
      },
      {
        test: /\.(eot|ttf|woff|woff2)(\?\S*)?$/,
        loader: 'file-loader',
        query: {
          outputPath: utils.assetsPath('fonts/'),
          publicPath: 'fonts/',
          name: '[name].[ext]'
        }
      },
      {
        test: /\.svg$/,
        loader: 'vue-svg-loader',
        options: {
          // optional [svgo](https://github.com/svg/svgo) options
          svgo: {
            plugins: [
              { removeDoctype: true },
              { removeComments: true }
            ]
          }
        }
      }<% } %>
    ]
  },
  plugins: utils.removeEmpty([
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(nodeEnv)
      }
    }),<% if ( projectusage === 'webpackApp' || projectusage === 'html' ) { %><% if ( locals.projectstructure && projectstructure === 'twig' ) { %>
    ifProduction(<% } %>
      new HtmlWebpackPlugin({
        filename: 'index.html',
        template: <% if ( locals.projectstructure && projectstructure === 'twig' ) { %>utils.kittnConf.dist.markup + 'index.html'<% } else { %>utils.kittnConf.src.structure + 'index.html'<% } %>,
        inject: true,
        hash: <% if ( projectusage === 'webpackApp') { %>false<% } else { %>true<% } %>,
        minify: {
          removeComments: true,
          collapseWhitespace: true,
          removeAttributeQuotes: false
        },
        chunksSortMode: 'dependency'
      })<% if ( locals.projectstructure && projectstructure === 'twig' ) { %>
    )<% } %><% } %><% if ( projectusage === 'html' && projectstructure === 'uncompiled' ) { %>,
    new WriteFilePlugin({
      log: false,
      test: /^(?!.+(?:hot-update.(js|json))).+$/
    })<% } %>
  ])
}
