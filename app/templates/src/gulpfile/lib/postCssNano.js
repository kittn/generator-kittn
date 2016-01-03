
import kc from '../../config.json'

const postCSSNano = () => {
  return [
    require('cssnano')({
      zindex: false,
      discardUnused: false,
      reduceIdents: false,
      mergeIdents: false
    })
  ]
}

module.exports = postCSSNano
