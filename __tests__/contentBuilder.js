'use strict'
var path = require('path')
var assert = require('yeoman-assert')
var helpers = require('yeoman-test')

/* eslint-disable new-cap, no-multi-str, no-template-curly-in-string, no-unused-vars, no-undef, prettier/prettier */
const { cbDependencies } = require('../generators/app/modules/package/dependencies/partials/contentBuilder')

const run = () => helpers.run(path.join(__dirname, '../generators/app'))

describe('Basic Contentbuilder', () => {
  beforeAll(async () => {
    await run().withPrompts({
      projectusage: 'craftCB',
      devMode: true
    })
  })

  // Test for Basic Files
  describe('Basic Files and Infos', () => {
    // Test package.json content
    it('adds ContainerQuery-Dependencies', () => {
      assert.JSONFileContent('package.json', {
        dependencies: cbDependencies
      })
    })
  })
})