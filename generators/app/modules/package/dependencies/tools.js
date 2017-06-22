const extend = require('deep-extend')

function addToolsDependencies (files = {}, context) {
  /**
   * If User wants sassdocs
   * @method if
   * @param  {object} context The global context with prompts
   */
  if (context.props.projectsassdocs === true) {
    extend(files.pkg, {
      devDependencies: {
        'sassdoc': '^2.2.2'
      }
    })
  }
}

module.exports = addToolsDependencies
