const extend = require('deep-extend')

function addAuthorData (files = {}) {
  extend(files.pkg, {
    author: {
      name: '',
      email: '',
      url: ''
    }
  })
}

module.exports = addAuthorData
