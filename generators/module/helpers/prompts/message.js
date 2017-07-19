const chalk = require('chalk')

const message = ({
     headline = 'Headline',
     description = 'description',
     defaultValue = 'Default:'
   }) => {
  return `${chalk.cyan.underline.bold(`${headline}`)}
  ${description}${defaultValue ? `\n  ${chalk.underline.yellow.dim(defaultValue)}` : ''}`
}

module.exports = message
