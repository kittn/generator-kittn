const failsave = (fn) => {
  try {
    fn()
  } catch (err) {
    console.error(err) // eslint-disable-line
  }
}

export default failsave
