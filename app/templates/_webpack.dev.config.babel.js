import webpack from 'webpack'
import merge from 'webpack-merge'
import webpackBase from './webpack.config.babel'

// add hot client for every entry point
Object.keys(webpackBase.entry).forEach((entry) => {
  webpackBase.entry[entry] = ['webpack-hot-middleware/client?path=/__webpack_hmr&timeout=20000&reload=true&overlay=true'].concat(webpackBase.entry[entry])
})

export default merge(webpackBase, {
  devtool: 'eval-source-map',
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NamedModulesPlugin(),
    new webpack.NoEmitOnErrorsPlugin(),
  ],
})
