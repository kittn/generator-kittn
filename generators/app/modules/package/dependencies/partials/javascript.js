/**
 * Dependencies for Gulp
 *
 * @package  generator-kittn
 * @author   Lars Eichler <larseichler.le@gmail.com>
 */

'use strict'
const extend = require('deep-extend')

const eslint = {
  'eslint': '^4.19.1',
  'eslint-config-standard': '^11.0.0',
  'eslint-plugin-promise': '^3.7.0',
  'eslint-plugin-standard': '^3.0.1',
  'eslint-formatter-pretty': '^1.3.0',
  'eslint-friendly-formatter': '^4.0.0',
  'eslint-loader': '^2.0.0',
  'eslint-plugin-import': '^2.10.0',
  'eslint-plugin-jsx-a11y': '^6.0.3',
  'eslint-plugin-node': '^6.0.1',
  'eslint-import-resolver-webpack': '^0.9.0'
}

const babel = {
  '@babel/cli': '^7.0.0-beta.44',
  '@babel/core': '^7.0.0-beta.44',
  '@babel/plugin-proposal-class-properties': '^7.0.0-beta.44',
  '@babel/plugin-proposal-object-rest-spread': '^7.0.0-beta.44',
  '@babel/plugin-syntax-dynamic-import': '^7.0.0-beta.44',
  '@babel/plugin-transform-runtime': '^7.0.0-beta.44',
  '@babel/preset-env': '^7.0.0-beta.44',
  '@babel/register': '^7.0.0-beta.44',
  '@babel/polyfill': '^7.0.0-beta.44',
  'babel-loader': '^8.0.0-beta.0',
  'babel-eslint': '^8.2.1'
}

exports.typescriptDependencies = {
  'ts-loader': '^4.2.0',
  typescript: '^2.8.1'
}

exports.javascriptDependencies = Object.assign(eslint, babel)

exports.packageJsonJavascript = (files = {}, context) => {
  extend(files.pkg, {
    devDependencies: exports.javascriptDependencies
  })

  if (context.props.projecttypescript === true) {
    extend(files.pkg, {
      devDependencies: exports.typescriptDependencies
    })
  }
}
