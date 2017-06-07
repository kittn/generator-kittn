const extend = require('deep-extend')

function addBaseSettings (files = {}, context) {
  extend(files.pkg, {
    title: 'SiteTitle',
    name: context.props.projectname,
    description: context.props.projectdescription,
    version: '0.0.1',
    license: 'MIT',
    repository: 'https://...',
    engines: {
      node: '>=7.6.0'
    }
  })
}

module.exports = addBaseSettings
