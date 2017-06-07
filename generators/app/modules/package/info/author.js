const extend = require('deep-extend')

function addAuthorData (files = {}, context) {
  extend(files.pkg, {
    author: {
      name: '',
      email: '',
      url: ''
    }
  })
}

module.exports = addAuthorData
