const extend = require('deep-extend')

function addStarterpackDependencies (files = {}, context) {
  if (context.props.projectwordpressbp === true || context.props.projectcraftbp === true) {
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
}

module.exports = addStarterpackDependencies
