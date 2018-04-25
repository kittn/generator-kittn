const extend = require('deep-extend')

function addStarterpackDependencies (files = {}, context) {
  if (context.props.projectusage === 'wordpressCB' || context.props.projectusage === 'craftCB' || context.props.projectusage === 'joomlaCB') {
    extend(files.pkg, {
      dependencies: {
        'anchor-scroll': '^2.0.0',
        'photoswipe': '^4.1.1',
        'flickity': '^2.0.5',
        'flickity-imagesloaded': '^2.0.0',
        'transition-to-from-auto': '^0.5.2'
      }
    })
  }
  // TailwindCSS
  if (
    context.props.projecttailwind === 'hybrid' ||
    context.props.projecttailwind === 'yes'
  ) {
    extend(files.pkg, {
      devDependencies: {
        'tailwindcss': '^0.5.2',
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
