// ===========================
// Source Files/Folders Config
// ===========================
const base = require('./copySrc/base.js')
const style = require('./copySrc/style.js')
const script = require('./copySrc/script.js')
const projecttype = require('./copySrc/projecttype.js')
const tools = require('./copySrc/tools.js')
const starterpackCraft = require('./copySrc/starterpackCraft.js')
const starterpackJoomla = require('./copySrc/starterpackJoomla.js')
const starterpackWordpress = require('./copySrc/starterpackWordpress.js')

const copyAction = (data, context) => {
  if (data.simplecopy) {
    context.fs.copy(
      context.templatePath(data.src),
      context.destinationPath(data.dest)
    )
  } else {
    context.fs.copyTpl(
      context.templatePath(data.src),
      context.destinationPath(data.dest),
      context.props
    )
  }
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
  } else if (data.orConditions) {
    let error = true
    for (const cond of data.orConditions) {
      for (const con in cond) {
        if (cond[con] === context.props[con]) {
          error = false
        }
      }
    }

    if (!error) {
      copyAction(data, context)
    }
  } else if (data.notConditions) {
    let error = false
    for (const cond in data.notConditions) {
      if (data.notConditions[cond] === context.props[cond]) {
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
    writing: context => {
      return new Promise((resolve, reject) => {
        // Base Config
        const baseConfig = base(context)
        processConfig(baseConfig, context)

        // Style
        const styleConfig = style(context)
        processConfig(styleConfig, context)

        // Script
        const scriptConfig = script(context)
        processConfig(scriptConfig, context)

        // Projecttype
        const projecttypeConfig = projecttype(context)
        processConfig(projecttypeConfig, context)

        // Tools
        const toolConfig = tools(context)
        processConfig(toolConfig, context)

        // Starterpack Craft
        const starterpackCraftConfig = starterpackCraft(context)
        processConfig(starterpackCraftConfig, context)

        // Starterpack Joomla
        const starterpackJoomlaConfig = starterpackJoomla(context)
        processConfig(starterpackJoomlaConfig, context)

        // Starterpack Wordpress
        const starterpackWordpressConfig = starterpackWordpress(context)
        processConfig(starterpackWordpressConfig, context)

        resolve()
      })
    }
  }
};

module.exports = copySources
