const filesModuleTpl = (context, destPath, pMeth, ptype, pCompiler) => {
  // Set Var
  let sassCompPath = ''
  let structureCompPath = ''
  let compName = 'components'
  let objName = 'objects'
  let srcType = ''
  let destType = ''

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

  // Switch between different Templatetypes
  switch(ptype) {
    case 'html' :
      if (pCompiler === 'twig') {
        srcType = 'twig'
        destType = 'twig'
      } else {
        srcType = 'html'
        destType = 'html'
      }
      break
    case 'craft' :
      srcType = 'twig'
      destType = 'html'
      break

    case 'wordpress' :
      srcType = 'php'
      destType = 'php'
      break
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
    template: [
      {
        src: `_module.${srcType}`,
        dest: `${destPath}/_${structureCompPath}/${context.props.moduleName}.${destType}`,
        type: 'template'
      }
    ]
  }
}

module.exports = filesModuleTpl
