// ===========================
// Source Files/Folders Config
// ===========================
const base = require('../../config/copySrc/base.js')
const style = require('../../config/copySrc/style.js')
const script = require('../../config/copySrc/script.js')
const tools = require('../../config/copySrc/tools.js')

const copyAction = (data, context) => {
  context.fs.copyTpl(
    context.templatePath(data.src),
    context.destinationPath(data.dest),
    context.props
  )
}

const checkCondition = (data, context) => {
  if (data.conditions) {
    let error = false
    for (const cond in data.conditions) {
      if (data.conditions[cond] !== context.props[cond]) {
        error = true
      }
    }

    if (!error) {
      copyAction(data, context)
    }
  } else {
    copyAction(data, context)
  }
}

const processConfig = (cfg, context) => {
  // Copy all sources
  for (const file of cfg.files) {
    checkCondition(file, context)
  }
  for (const folder of cfg.folders) {
    checkCondition(folder, context)
  }
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

        // Script
        const scriptConfig = script(context)
        processConfig(scriptConfig, context)

        // Tools
        const toolConfig = tools(context)
        processConfig(toolConfig, context)

        resolve()
      })
    }
  }
}

module.exports = copySources
