/**
 * Flickity Package
 * @param element (string) =
 */

import flickity from 'flickity'
import 'flickity-imagesloaded'

// Heightfix
{
  const slider = document.querySelector('.js-imageSlider')

  if (slider !== null) {
    window.addEventListener('load', () => {
      setTimeout(() => {
        const sliders = Array.from(document.querySelectorAll('.js-imageSlider'))
        if (sliders) {
          sliders.forEach((slider) => {
            const flkty = flickity.data(slider)
            flkty.resize()
            slider.classList.add('is-visible')
          })
        }
      }, 250)
    })
  }
}
