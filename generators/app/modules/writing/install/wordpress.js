const installWordpress = () => {
  return {
    install: (context) => {
      return new Promise((resolve, reject) => {
        if (context.props.projectusage === 'wordpress' && context.props.projectwpcli === true) {
          if (context.commands.wp) {
            context.spawnCommand('wp', ['core', 'download', '--path=dist', '--locale=de_DE']).on('close', () => {
              resolve()
            })
          } else {
            context.log('Before you run `npm run init`, you must manually install Wordpress in the `dist/` directory.')
            resolve()
          }
        } else {
          resolve()
        }
      })
    }
  }
}

module.exports = installWordpress
