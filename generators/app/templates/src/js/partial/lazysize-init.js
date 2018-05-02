import lazySizes from 'lazysizes'
import lazybgset from 'lazysizes/plugins/bgset/ls.bgset' // eslint-disable-line
if (!window.HTMLPictureElement) {
  import('lazysizes/plugins/respimg/ls.respimg.js' /* webpackChunkName: "picturePolyfill" */)
}

const lazySizeInit = () => {
  // Lasysizes Lazyload Config
  const lazySizesConfig = window.lazySizesConfig || {}
  window.lazySizesConfig = lazySizesConfig
  window.lazySizesConfig.expand = 130
  lazySizesConfig.expFactor = 1.3

  // Lazy Sizes Init
  lazySizes.init()
}

export default lazySizeInit
