const chalk = require('chalk')

const logMessage = ({
    message = 'Logging',
    } = {}) => {
  // Stuff from Martin. Finalize this later or never. Unit tests…
  if (process.env.NODE_ENV === 'test') {
    return
  }

  // Set Vars
  const signs = Array(96).join('.')

  let consoleMessage = `\n${chalk['yellow'].bold(`${message}`)}\n`

  if (this.log) {
    return this.log(consoleMessage)
  }
  console.log(consoleMessage) // eslint- disable
}

module.exports = logMessage
