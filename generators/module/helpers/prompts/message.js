const chalk = require('chalk')

const message = ({
     headline = 'Headline',
     description = 'description',
     defaultValue = 'Default:'
   }) => {
  return `${chalk.green.underline.bold(`${headline}`)}
  ${description}${defaultValue ? `\n  ${chalk.underline.yellow.dim(defaultValue)}` : ''}`
}

module.exports = message
