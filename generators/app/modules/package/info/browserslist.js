const extend = require('deep-extend')

function addBrowsersList (files = {}) {
  extend(files.pkg, {
    browserslist: [
      '> 5%',
      'ie 11',
      'last 2 versions'
    ]
  })
}

module.exports = addBrowsersList
