// ===========================
// Source Files/Folders Config
// ===========================
const base = require('../../config/copySrc/base.js')
const style = require('../../config/copySrc/style.js')

const processConfig = (cfg, context) => {
  // Copy all sources
  cfg.files.forEach(file => {
    if (!file.projectContext || file.projectContext.includes(context.props.projectcssstructure)) {
      if (file.filename) {
        context.fs.copyTpl(
          context.templatePath(file.src),
          context.destinationPath(file.dest.replace('%s', context.props[file.filename])),
          context.props
        )
      } else {
        context.fs.copyTpl(
          context.templatePath(file.src),
          context.destinationPath(file.dest),
          context.props
        )
      }
    }
  })
}

const copySources = () => {
  return {
    writing: (context) => {
      return new Promise((resolve) => {
        console.log('Foobar')
        // Base Config
        processConfig(base, context)

        // Style
        processConfig(style, context)

        resolve()
      })
    }
  }
}

module.exports = copySources
