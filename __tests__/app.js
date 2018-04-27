'use strict'
var path = require('path')
var assert = require('yeoman-assert')
var helpers = require('yeoman-test')

/* eslint-disable new-cap, no-multi-str, no-template-curly-in-string, no-unused-vars, no-undef, prettier/prettier */
const run = () => helpers.run(path.join(__dirname, '../generators/app'))

// Define some variables
const project = {
  name: 'Kittn',
  version: '0.0.1',
  proxy: 'kittn.local',
  projectusage: 'none'
}
const author = {
  name: 'Sascha Fuchs',
  email: 'gisu2onic@gmail.com',
  homepage: 'http://kittn.de'
}

describe('generator-kittn:app', () => {
  beforeAll(() => {
    return run().withPrompts({
      projectname: project.name,
      projectauthor: author.name,
      projectmail: author.email,
      projecturl: author.homepage,
      projectusage: project.projectusage,
      projectversion: project.version
    })
  })

  // Test for Basic Files
  describe('Basic Files and Infos', () => {
    // Test package.json content
    it('fill package.json with correct Information', () => {
      assert.JSONFileContent('package.json', {
        name: project.name,
        version: project.version,
        author: {name: author.name, email: author.email, url: author.homepage}
      })
    })
  })
})
