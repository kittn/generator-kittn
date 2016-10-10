import path from 'path'
import webpack from 'webpack'
import ExtractTextPlugin from 'extract-text-webpack-plugin'
import merge from 'webpack-merge'
import yargs from 'yargs'
import eslintPretty from 'eslint-formatter-pretty'

const argv = yargs.argv
const env = argv.env || 'development'

const nodeEnv = process.env.NODE_ENV || 'production'
const bundle = argv.bundle || 'primary'

const ROOT_PATH = path.resolve(__dirname)
const PUBLIC_PATH = path.join(ROOT_PATH, 'dist/')

const ASSET_JS_PATH = 'assets/js/'

const PRIMARY_FILE_NAME = 'app.js'
const PRIMARY_FILE_HANDLE = 'app'


const configSelect = bundle => {
  switch (bundle) {
    case 'primary':
      return {
        entry: [`./js/${PRIMARY_FILE_NAME}`],
        output: {
          path: path.join(PUBLIC_PATH, ASSET_JS_PATH),
          publicPath: `/${ASSET_JS_PATH}`,
          filename: PRIMARY_FILE_NAME
        }
      }
      break

    // Add More Cases is you need

    case 'production' :
      return {
        entry: {
          app: `./js/${PRIMARY_FILE_NAME}`
          // Adding more Files here
        },
        output: {
          path: path.join(PUBLIC_PATH, ASSET_JS_PATH),
          filename: '[name].js'
        }
      }
      break

    default :
      return true
  }
}

const configSegment = configSelect(bundle)

const config = {
  devtool: 'source-map',
  context: path.join( ROOT_PATH, 'src'),
  entry: configSegment.entry,
  output: configSegment.output,
  module: {

    preLoaders: [<% if (projectvue === true ) { %>
      {
        test: /\.vue$/,
        loader: 'eslint-loader',
        include: path.join( ROOT_PATH, 'src/js' ),
        exclude: /node_modules/
      },<% } %>
      {
        test: /\.js$/,
        loader: 'eslint-loader',
        include: path.join( ROOT_PATH, 'src/js' ),
        exclude: /node_modules/
      }
    ],

    loaders: [<% if (projectvue === true ) { %>
      {
        test: /\.vue$/,
        include: path.join( ROOT_PATH, 'src/js' ),
        loader: 'vue'
      },<% } %>
      {
        test: /\.js$/,
        include: path.join( ROOT_PATH, 'src/js' ),
        exclude: /node_modules/,
        loader: 'babel'
      }
    ]
  },

  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(nodeEnv)
      }
    }),
    new webpack.optimize.OccurrenceOrderPlugin(),
    new webpack.NoErrorsPlugin(),
  ],
  eslint: {
    failOnError: false,
    failOnWarning: false,
    configFile: './.eslintrc',
    formatter: eslintPretty
  },

  resolve: {
    extensions: [<% if (projectvue === true ) { %>
      '.vue',<% } %>
      '',
      '.js'
    ],
    alias: {<% if (projectvue === true && projectvueversion === 'Standalone' ) { %>
      'vue': 'vue/dist/vue.js'<% } %>
    }
  },

  externals: {
    'Modernizr': 'Modernizr'
  }
}

if(env == 'development') {
  module.exports = merge(config, {
    entry: [
      'webpack/hot/dev-server',
      'webpack-hot-middleware/client'
    ],
    plugins: [
      new webpack.HotModuleReplacementPlugin()
    ]
  })
} else {
  module.exports = merge(config)
}
