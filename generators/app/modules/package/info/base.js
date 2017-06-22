const extend = require('deep-extend')

function addBaseSettings (files = {}, context) {
  extend(files.pkg, {
    title: 'SiteTitle',
    name: context.props.projectname,
    description: context.props.projectdescription,
    version: context.props.projectversion,
    license: 'MIT',
    repository: context.props.projecturl,
    engines: {
      node: '>=7.6.0'
    }
  })
}

module.exports = addBaseSettings
