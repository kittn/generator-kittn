'use strict'
var path = require('path')
var assert = require('yeoman-assert')
var helpers = require('yeoman-test')

describe('generator-kittn:app', () => {
  beforeAll(() => {
    return helpers.run(path.join(__dirname, '../generators/app'))
      .withPrompts({someAnswer: true})
  })

  it('creates a package.json', () => {
    assert.file([
      'package.json'
    ])
  })

  // it('adds base infos to package.json', () => {
  //   assert.JSONFileContent('package.json', {
  //     name: '',
  //     description: '',
  //     version: '',
  //     authors: [{ name: '', email: '', homepage: '' }]
  //   })
  // })
})
