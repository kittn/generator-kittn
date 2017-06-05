const extend = require('deep-extend')

function addBrowsersList (files = {}) {
  extend(files.pkg, {
    browserslist: [
      '> 5%',
      'ie 11',
      'last 3'
    ]
  })
}

module.exports = addBrowsersList
