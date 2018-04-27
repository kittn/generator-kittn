'use strict'
var path = require('path')
var assert = require('yeoman-assert')
var helpers = require('yeoman-test')

/* eslint-disable new-cap, no-multi-str, no-template-curly-in-string, no-unused-vars, no-undef, prettier/prettier */
const { vueDevDependencies, vueDependencies, vuePluginsDependencies } = require('../generators/app/modules/package/dependencies/partials/vue')
const { stylelintWebpackDependencies } = require('../generators/app/modules/package/dependencies/partials/stylelint')

const run = () => helpers.run(path.join(__dirname, '../generators/app'))

describe('generator-kittn:app', () => {
  beforeAll(() => {
    return run().withPrompts({
      projectusage: 'html',
      projectjsframework: 'vue',
      projectvueplugins: true,
      projectstylelint: true
    })
  })

  // Test for Basic Files
  describe('Vue Dependencies', () => {
    it('adds vue devDependencies', () => {
      assert.jsonFileContent('package.json', {
        devDependencies: vueDevDependencies
      })
    })

    it('adds vue dependencies', () => {
      assert.jsonFileContent('package.json', {
        dependencies: vueDependencies
      })
    })

    it('adds vue pluginDependencies', () => {
      assert.jsonFileContent('package.json', {
        dependencies: vuePluginsDependencies
      })
    })
  })

  // Test for Stylelint
  describe('Stylelint', () => {
    it('copies stylelint files', () => {
      assert.file([
        'stylelint.config.js'
      ])
    })

    it('adds stylelint webpackDependencies', () => {
      assert.jsonFileContent('package.json', {
        devDependencies: stylelintWebpackDependencies
      })
    })
  })
})
