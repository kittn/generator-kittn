const chalk = require('chalk')

const branding = (version, author, website, repoURL) => {
  return `${chalk.styles.yellow.open}
                    __    .__  __    __ 
                    |  | _|__|/  |__/  |_  ____ 
                    |  |/ /  \\   __\\   __\\/    \\ 
                    |    <|  ||  |  |  | |   |  \\ 
                    |__|_ \\__||__|  |__| |___|  / 
                    \\/                   \\/  
   ${chalk.styles.yellow.close}${chalk.styles.green.open}
                         FILE Generator
                         `
}

module.exports = branding
