import kc from '../../config.json'

const globalMinifyCheck = () => {
  const gminify = {
    js: false,
    css: false,
    image: false
  }

  // Global Minifier - will be activated on the Publish Task. Only active when the regular minfier is deactivated
  if (kc.minify.automatic.jsFiles == false && kc.minify.automatic.jsCombine == false && kc.minify.automatic.jsCopy == false && kc.minify.automatic.jsModernizr == false) {
    gminify.js = true
  } else {
    gminify.js = false
  }

  if (kc.minify.automatic.jsFiles == false) {
    gminify.css = true
  } else {
    gminify.css = false
  }

  if (kc.minify.automatic.vector == false && kc.minify.automatic.bitmaps == false && kc.minify.automatic.vectorSprite == false && kc.minify.automatic.bitmapSprite == false) {
    gminify.image = true
  } else {
    gminify.image = false
  }

  return gminify
}

module.exports = globalMinifyCheck
