const filesModuleTpl = (context, destPath, pMeth) => {
  // Set Var
  let sassCompPath = ''
  let structureCompPath = ''
  let compName = 'components'
  let objName = 'objects'

  // Rename Comp and Objects if Atomic
  if (pMeth === 'sassAtomic') {
    compName = 'organisms'
    objName = 'molecules'
  }

  // Check Moduletype for Sass Files
  if (context.props.moduleType === 'c') {
    sassCompPath = compName
    structureCompPath = compName

  } else {
    sassCompPath = objName
    structureCompPath = objName
  }

  return {
    javascript: [
      {
        src: `_module.js`,
        dest: `${destPath}/partial/${context.props.moduleName}.js`,
        type: 'js'
      }
    ],
    style: [
      {
        src: `_module.scss`,
        dest: `${destPath}/${sassCompPath}/_${context.props.moduleName}.scss`,
        type: 'css'
      },
    ],
    templateCraft: [
      {
        src: `_module.twig`,
        dest: `${destPath}/_${structureCompPath}/${context.props.moduleName}.html`,
        type: 'template'
      }
    ],
    templateWordpres: [
      {
        src: `_module.php`,
        dest: `${destPath}/_${structureCompPath}/${context.props.moduleName}.php`,
        type: 'template'
      }
    ],
    templateHTML: [
      {
        src: `_module.html`,
        dest: `${destPath}/${structureCompPath}/${context.props.moduleName}.html`,
        type: 'template'
      }
    ],
    templateHTMLTwig: [
      {
        src: `_module.twig`,
        dest: `${destPath}/${structureCompPath}/${context.props.moduleName}.twig`,
        type: 'template'
      }
    ],
  }
}

module.exports = filesModuleTpl
