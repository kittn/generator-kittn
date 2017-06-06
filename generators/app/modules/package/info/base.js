const extend = require('deep-extend')

function addBaseSettings (files = {}) {
  extend(files.pkg, {
    title: '',
    name: this.props.projectName,
    description: this.props.projectDescription,
    version: '',
    license: '',
    repository: '',
    engines: {
      node: '>=6.0.0'
    }
  })
}

module.exports = addBaseSettings
