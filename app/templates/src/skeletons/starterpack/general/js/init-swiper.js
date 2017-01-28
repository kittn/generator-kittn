import Swiper from 'swiper'

// Image Slider Config
const imageslider = new Swiper('.o-imageslider', {
  pagination: '.o-imageslider__pagination',
  paginationClickable: true,
  nextButton: '.o-imageslider__button-next',
  prevButton: '.o-imageslider__button-prev',
  wrapperClass: 'o-imageslider__wrapper',
  slideClass: 'o-imageslider__slide',
  spaceBetween: 0,
  loop: true,
  autoplay: 20000,
  lazyLoading: true
})

// Text Slider Config
const textslider = new Swiper('.o-textslider', {
  pagination: '.o-textslider__pagination',
  paginationClickable: true,
  nextButton: '.o-textslider__button-next',
  prevButton: '.o-textslider__button-prev',
  wrapperClass: 'o-textslider__wrapper',
  slideClass: 'o-textslider__slide',
  spaceBetween: 60,
  autoHeight: true,
  loop: true
})
