import { getIfUtils, removeEmpty } from 'webpack-config-utils'
import path from 'path'
import kittnConf from '../config.json'

exports.getIfUtils = getIfUtils
exports.removeEmpty = removeEmpty

exports.kittnConf = kittnConf
exports.entryPoints = kittnConf.src.jsEntryPoints

/*
 |--------------------------------------------------------------------------
 | Setting some paths for our Application
 |--------------------------------------------------------------------------
 */
const paths = {}
paths.ROOT_PATH = path.resolve(__dirname, '..')
paths.PUBLIC_PATH = path.join(paths.ROOT_PATH, kittnConf.dist.webpackpublic)
paths.ASSETS_PATH = kittnConf.dist.webpackassets
paths.SRC_ROOT = path.resolve(paths.ROOT_PATH, kittnConf.src.base)
paths.CSS_ROOT = path.resolve(paths.ROOT_PATH, kittnConf.src.style)
paths.LOADER_PATH = path.join(paths.ROOT_PATH, kittnConf.src.js)
exports.paths = paths

/*
 |--------------------------------------------------------------------------
 | Helper Functions
 |--------------------------------------------------------------------------
 */
exports.resolve = function (dir) {
  return path.join(__dirname, '..', dir)
}

exports.assetsPath = function (_path) {
  return path.posix.join(paths.ASSETS_PATH, _path);
}
