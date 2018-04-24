// ===========================
// Import Database
// ===========================
const importer = require('./helpers/import-mysql')
let dbFile = ''

const importDB = () => {
  return {
    writing: (context) => {
      return new Promise((resolve, reject) => {
        // Connect Database
        if (context.props.projectcredential && context.props.credentialdbopen && context.commands.mysql === true) {

          // Define Database File based on projecttype and contentbuilder option
          switch (context.props.projectusage) {
            case 'craft' :
              // Switch between regular DB File and ContentBuilder DB File
              if (context.props.projectusage === 'craftCB') {
                dbFile = 'craftCB.sql'
              } else {
                dbFile = 'craft.sql'
              }
              break

            case 'wordpress' :
              // Switch between regular DB File and ContentBuilder DB File
              if (context.props.projectusage === 'wordpressCB') {
                dbFile = 'wordpressCB.sql'
              } else {
                dbFile = 'wordpress.sql'
              }
              break

            case 'joomla' :
              // Switch between regular DB File and ContentBuilder DB File
              if (context.props.projectusage === 'joomlaCB') {
                dbFile = 'joomlaCB.sql'
              } else {
                dbFile = 'joomla.sql'
              }
              break
          }

          // TODO: Wont work with SQL Files with JSON Fragments

          // importer.config({
          //   'host': context.props.credentialdbserver,
          //   'user': context.props.credentialdbuser,
          //   'password': context.props.credentialdbpass,
          //   'database': context.props.credentialdbdatabase
          // })
          //
          // importer.importSQL(context.templatePath(`./databases/${dbFile}`)).then(() => {
          //   context.log('all statements have been executed')
          // }).catch((err) => {
          //   context.log(`error: ${err}`)
          // })

          const sqlfile = context.templatePath(`./databases/${dbFile}`);

          console.log(`Use mysql to Import database, use the following Line to import:`)
          console.log(`mysql -u${context.props.credentialdbuser} -p${context.props.credentialdbpass} ${context.props.credentialdbdatabase} < ${sqlfile}`)

          // Other Try with SpawnCommand
          // context.spawnCommand('mysql', [`-u${context.props.credentialdbuser}`, `-p${context.props.credentialdbpass}`, context.props.credentialdbdatabase, '<', sqlfile]).on('close', () => {
          //   resolve()
          // })
        } else {
          if (context.props.projectcredential && context.props.credentialdbopen && context.commands.mysql !== true) {
            console.error('`mysql`-command not available')
            reject()
          }
        }
      })
    }
  }
}

module.exports = importDB
