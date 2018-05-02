const searchBar = () => {
  const triggers = document.querySelectorAll('.js-searchField-trigger')
  const searchbar = document.querySelector('.c-searchbar')
  const searchClose = document.querySelector('.c-searchbar__close')

  triggers.forEach((trigger) => {
    trigger.addEventListener('click', () => {
      searchbar.classList.add('is-open')
    })
  })

  // Remove State on Keypress ESC
  document.onkeydown = (event) => {
    if (event.keyCode === 27) {
      searchbar.classList.remove('is-open')
    }
  }

  // Closing
  searchClose.addEventListener('click', () => {
    searchbar.classList.remove('is-open')
  })
}

export default searchBar
