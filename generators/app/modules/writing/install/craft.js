const installCraft = () => {
  return {
    install: (context) => {
      return new Promise((resolve, reject) => {
        console.log(context.props)
        if (!context.props.devMode && (context.props.projectusage === 'craft' || context.props.projectusage === 'craftCB')) {
          if (context.commands.wget) {
            context.spawnCommand('wget', ['http://buildwithcraft.com/latest.tar.gz\?accept_license\=yes']).on('close', () => {
              context.spawnCommand('mkdir', ['dist']).on('close', () => {
                context.spawnCommand('tar', ['-zxvf', 'latest.tar.gz\?accept_license=yes', 'craft/']).on('close', () => {
                  context.spawnCommand('mv', ['craft', 'dist/']).on('close', () => {
                    context.spawnCommand('rm', ['-rf', 'latest.tar.gz\?accept_license=yes']).on('close', () => {
                      resolve()
                    })
                  })
                })
              })
            })

            // For the Future CRAFT3.0 Composer Power
            // this.spawnCommand('composer', ['create-project', 'craftcms/craft', 'dist', '-s', 'beta']).on('close', () => {
            //   resolve()
            // })
          } else {
            context.log('Before you run `npm run init`, you must manually install Craft in the `dist/` directory.')
            resolve()
          }
        } else {
          resolve()
        }
      })
    }
  }
}

module.exports = installCraft
