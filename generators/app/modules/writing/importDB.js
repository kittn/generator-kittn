// ===========================
// Import Database
// ===========================
const importer = require('./helpers/import-mysql')
let dbFile = ''
let conn

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
              if (context.props.projectcraftbp) {
                dbFile = 'craftCB.sql'
              } else {
                dbFile = 'craft.sql'
              }
              break

            case 'wordpress' :
              // Switch between regular DB File and ContentBuilder DB File
              if (context.props.projectwordpressbp) {
                dbFile = 'wordpressCB.sql'
              } else {
                dbFile = 'wordpress.sql'
              }
              break
          }

          importer.config({
            'host': context.props.credentialdbserver,
            'user': context.props.credentialdbuser,
            'password': context.props.credentialdbpass,
            'database': context.props.credentialdbdatabase
          })

          importer.importSQL(context.templatePath(`./databases/${dbFile}`)).then(() => {
            context.log('all statements have been executed')
          }).catch((err) => {
            context.log(`error: ${err}`)
          })

          resolve()
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
