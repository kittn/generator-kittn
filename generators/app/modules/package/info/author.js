const extend = require('deep-extend')

function addAuthorData (files = {}, context) {
  extend(files.pkg, {
    author: {
      name: context.props.projectauthor,
      email: context.props.projectmail,
      url: context.props.projecturl
    }
  })
}

module.exports = addAuthorData
