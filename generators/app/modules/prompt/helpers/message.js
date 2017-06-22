const chalk = require('chalk')

const message = ({
  headline = 'Headline',
  description = 'description',
  defaultValue = 'Default:'
}) => {
  return `${chalk.cyan.underline.bold(`${headline}`)}\n\xa0  ${description}`
  // return `${chalk.cyan.underline.bold(`${headline}`)}
  // \xa0  ${description}${defaultValue ? `\n\xa0  ${chalk.underline.yellow.dim(defaultValue)}` : ''}`
}

module.exports = message
