'use strict'
var path = require('path')
var assert = require('yeoman-assert')
var helpers = require('yeoman-test')

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
    return helpers.run(path.join(__dirname, '../generators/app'))
      .withPrompts({
        projectname: project.name,
        projectauthor: author.name,
        projectmail: author.email,
        projecturl: author.homepage,
        projectusage: project.projectusage
      })
  })
  // Test for Basic Files
  describe('Basic Files and Infos', () => {
    // Test package.json content
    it('fill package.json with correct Information', () => {
      assert.JSONFileContent('package.json', {
        name: project.name
        // author: {name: author.name, email: author.email, url: author.homepage}
      })
    })
  })
})
