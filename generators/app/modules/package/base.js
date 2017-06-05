const extend = require('deep-extend')

function addBaseSettings (files = {}) {
  extend(files.pkg, {
    name: this.props.projectName,
    description: this.props.projectDescription
  })
}

module.exports = addBaseSettings
