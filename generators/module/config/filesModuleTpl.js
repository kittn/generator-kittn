const filesModuleTpl = (context, destPath, pMeth, ptype, pCompiler) => {
  // Set Var
  let srcType = ''
  let destType = ''
  let pathName = ''

  // Rename Comp and Objects if Atomic
  if (pMeth === 'sassAtomic') {
    switch(context.props.moduleType) {
      case 'a' :
        pathName = 'atom'
        break
      case 'm' :
        pathName = 'molecule'
        break
      case 'o' :
        pathName = 'organism'
        break
      case 't' :
        pathName = 'template'
        break
      default :
    }

  } else {
    // ITCSS Tree
    if (context.props.moduleType === 'c') {
      pathName = '_components'

    } else {
      pathName = '_objects'
    }
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
        dest: `${destPath}/${pathName}/_${context.props.moduleName}.scss`,
        type: 'css'
      },
    ],
    template: [
      {
        src: `_module.${srcType}`,
        dest: `${destPath}/${pathName}/${context.props.moduleName}.${destType}`,
        type: 'template'
      }
    ]
  }
}

module.exports = filesModuleTpl
