// ===========================
// Import Database
// ===========================
const mysql = require('mysql')
const fs = require('fs')
const readline = require('readline')
let dbFile = ''

const importDB = () => {
  return {
    writing: (context) => {
      return new Promise((resolve, reject) => {
        // Connect Database
        if (context.props.projectcredential && context.props.credentialdbopen && context.commands.mysql === true) {
          const socket = context.props.projectmamp ? '/Applications/MAMP/tmp/mysql/mysql.sock' : false

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

          // Import Databases as File
          const rl = readline.createInterface({
            input: fs.createReadStream(context.templatePath(`./databases/${dbFile}`)),
            terminal: false
          })

          const connection = mysql.createConnection({
            socketPath: socket,
            host: context.props.credentialdbserver,
            user: context.props.credentialdbuser,
            password: context.props.credentialdbpass
          })

          connection.connect((err) => {
            if (err) {
              context.log('error connecting: ' + err.stack)
              reject(err)
            }
          })

          rl.on('line', function(chunk){
            connection.query(chunk.toString('ascii'), (error, sets, fields) => {
              if(error) {
                reject(error)
              } else {
                context.log('Database is written. Login with: kittn / kittn')
              }
            })
          })

          connection.end()
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
