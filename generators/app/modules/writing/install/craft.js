const installCraftV3 = (context, resolve) => {
  if (context.commands.composer) {
    context.spawnCommand('composer', ['create-project', 'craftcms/craft', 'dist']).on('post-create-project-cmd', () => {
      resolve()
    })
  } else {
    context.spawnCommand('wget', [`http://buildwithcraft.com/latest-v3.tar.gz\?accept_license\=yes`]).on('close', () => {
      context.spawnCommand('mkdir', ['-p', 'dist/craft']).on('close', () => {
        context.spawnCommand('tar', ['-zxvf', `latest-v3.tar.gz\?accept_license=yes`, '-C', './dist/craft']).on('close', () => {
          context.spawnCommand('rm', ['-rf', `latest-v3.tar.gz\?accept_license=yes`]).on('close', () => {
            resolve()
          })
        })
      })
    })
  }
}

const installCraftV2 = (context, resolve) => {
  context.spawnCommand('wget', [`http://buildwithcraft.com/latest-${craftVersion}.tar.gz\?accept_license\=yes`]).on('close', () => {
    context.spawnCommand('mkdir', ['dist']).on('close', () => {
      context.spawnCommand('tar', ['-zxvf', `latest-v2.tar.gz\?accept_license=yes`, 'craft/']).on('close', () => {
        context.spawnCommand('mv', ['craft', 'dist/']).on('close', () => {
          context.spawnCommand('rm', ['-rf', `latest-v2.tar.gz\?accept_license=yes`]).on('close', () => {
            resolve()
          })
        })
      })
    })
  })
}

const installCraft = () => {
  return {
    install: (context) => {
      return new Promise((resolve, reject) => {
        if (context.props.projectusage === 'craft' || context.props.projectusage === 'craftCB') {
          if (context.commands.wget) {
            (context.props.projectcraft3) ? installCraftV3(context, resolve) : installCraftV2(context, resolve)
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
