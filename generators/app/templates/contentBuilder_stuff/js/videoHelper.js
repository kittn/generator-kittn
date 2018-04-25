import inView from 'in-view'

const videoHelper = () => {
  inView.offset(300)
  inView('.is-videoAutoplay')
    .on('enter', (el) => {
      el.play()
    })
    .on('exit', (el) => {
      el.pause()
    })

  // Helper for displaying Videoposter after video is finished
  const videoEnded = () => video.load() // eslint-disable-line
}

export default videoHelper
