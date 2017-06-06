// ===========================
// Source Files/Folders Config
// ===========================
const base = require('../../config/copySrc/base.js')
const style = require('../../config/copySrc/style.js')

const processConfig = (cfg, context) => {
  // Copy all sources
  cfg.files.forEach(file => {
    if (!file.projectContext || file.projectContext.includes(context.props.projectcssstructure)) {
      context.fs.copyTpl(
        context.templatePath(file.src),
        context.destinationPath(file.dest),
        context.props
      )
    }
  })
}

const copySources = () => {
  return {
    writing: (context) => {
      return new Promise((resolve) => {
        // Base Config
        const baseConfig = base(context)
        processConfig(baseConfig, context)

        // Style
        const styleConfig = style(context)
        processConfig(styleConfig, context)

        resolve()
      })
    }
  }
}

module.exports = copySources
