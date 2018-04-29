/**
 * Flickity Package
 * @param element (string) =
 */

import Flickity from 'flickity'
import 'flickity-imagesloaded'

const flickityPackage = () => {
  const flickityDefaults = {
    accessibility: false,
    contain: true,
    imagesLoaded: true,
    lazyLoad: false
  }

  const slider = document.querySelector('.js-imageSlider')

  if (slider !== null) {
    window.addEventListener('load', () => {
      setTimeout(() => {
        const sliders = Array.from(document.querySelectorAll('.js-imageSlider'))
        if (sliders) {
          sliders.forEach((slider) => {
            // Check if outer transport Wrapper is used
            let flkty

            // If Slidertransport is not used as Wrapper yield data from the main slider wrapper
            const sliderTransport = slider.querySelector('.flickity-custom__transport') || slider

            // Check if the right Data Attr is available, otherwise use an empty object
            const preCustomData = sliderTransport.hasAttribute('data-myflickity')
              ? JSON.parse(sliderTransport.dataset.myflickity)
              : {}

            // Merging with Defaults
            const customData = Object.assign(flickityDefaults, preCustomData)

            // Init Flickity
            flkty = new Flickity(sliderTransport, customData)

            // Fix Height
            flkty.resize()
            slider.classList.add('is-visible')
          })
        }
      }, 250)
    })
  }
}

export default flickityPackage
