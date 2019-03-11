const extend = require('deep-extend')
const { cbDependencies } = require('./partials/contentBuilder')

function addStarterpackDependencies (files = {}, context) {
  if (context.props.projectusage === 'wordpressCB' || context.props.projectusage === 'craftCB' || context.props.projectusage === 'joomlaCB') {
    extend(files.pkg, {
      dependencies: cbDependencies
    })
  }
  // TailwindCSS
  if (
    context.props.projecttailwind === 'hybrid' ||
    context.props.projecttailwind === 'yes'
  ) {
    extend(files.pkg, {
      devDependencies: {
        'tailwindcss': '^0.7.4',
        'gulp-purgecss': '^0.21.0'
      }
    })
  }

  if (context.props.projectusage === 'craftCB') {
    extend(files.pkg, {
      scripts: {
        'db': './craftscripts/pull_db.sh'
      }
    })
  }
}

module.exports = addStarterpackDependencies
