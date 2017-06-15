const installCraft = () => {
  return {
    install: (context) => {
      return new Promise((resolve, reject) => {
        if (context.props.projectusage === 'craft') {
          if (context.projectcraftcli) {
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
            // const done = this.async()
            // this.spawnCommand('composer', ['create-project', 'craftcms/craft', 'dist', '-s', 'beta']).on('close', done)
          } else {
            console.log('Before you run `npm run init`, you must manually install Craft in the `dist/` directory.')
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
