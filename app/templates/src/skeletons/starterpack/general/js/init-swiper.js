import Swiper from 'swiper'

// Image Slider Object
const imageSliders = Array.from(document.querySelectorAll('.o-imageslider'))
const imageSlidersDefaults = {
  pagination: '.o-imageslider__pagination',
  nextButton: '.o-imageslider__button-next',
  prevButton: '.o-imageslider__button-prev',
  wrapperClass: 'o-imageslider__wrapper',
  slideClass: 'o-imageslider__slide',
  paginationClickable: true,
  spaceBetween: 0,
  loop: true,
  autoplay: 20000,
  lazyLoading: true
}

// Generate Image Sliders
if (imageSliders) {
  imageSliders.forEach(imageSlider => {
    const getSettings = imageSlider.getAttribute('data-imageslider')
    const config = JSON.parse(getSettings)
    const combineSettings = Object.assign(imageSlidersDefaults, config)

    // Add a new Slider
    const newImageSlider = new Swiper(imageSlider, combineSettings)
  })
}

// Test Slider Object
const textSliders = Array.from(document.querySelectorAll('.o-textslider'))
const textSlidersDefaults = {
  pagination: '.o-textslider__pagination',
  nextButton: '.o-textslider__button-next',
  prevButton: '.o-textslider__button-prev',
  wrapperClass: 'o-textslider__wrapper',
  slideClass: 'o-textslider__slide',
  paginationClickable: true,
  spaceBetween: 60,
  autoHeight: true,
  loop: true
}

// Generate Text Sliders
if (textSliders) {
  textSliders.forEach(textSlider => {
    const getSettings = textSlider.getAttribute('data-textslider')
    const config = JSON.parse(getSettings)
    const combineSettings = Object.assign(textSlidersDefaults, config)

    // Add a new Slider
    const newtextSlider = new Swiper(textSlider, combineSettings)
  })
}
