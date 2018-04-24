const installJoomla = () => {
  return {
    install: (context) => {
      return new Promise((resolve, reject) => {
        if (context.props.projectusage === 'joomla') {
          if (context.commands.wget) {
            context.spawnCommand('wget', ['https://downloads.joomla.org/cms/joomla3/3-8-7/Joomla_3.8.7-Stable-Full_Package.tar.gz']).on('close', () => {
              context.spawnCommand('mkdir', ['dist']).on('close', () => {
                context.spawnCommand('tar', ['-zxvf', 'Joomla_3.8.7-Stable-Full_Package.tar.gz', '-C', 'dist/']).on('close', () => {
                  context.spawnCommand('rm', ['-rf', 'Joomla_3.8.7-Stable-Full_Package.tar.gz']).on('close', () => {
                    context.spawnCommand('rm', ['-rf', 'dist/installation/']).on('close', () => {
                      resolve()
                    })
                  })
                })
              })
            })
          } else {
            context.log('Before you run `npm run init`, you must manually install Joomla in the `dist/` directory.')
            resolve()
          }
        } else {
          resolve()
        }
      })
    }
  }
}

module.exports = installJoomla
