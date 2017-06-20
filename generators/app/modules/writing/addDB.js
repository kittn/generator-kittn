// ===========================
// Add Database
// ===========================
const mysql = require('mysql')

const addDB = () => {
  return {
    writing: (context) => {
      return new Promise((resolve, reject) => {
        // Adding Database
        if (context.props.projectcredential && context.props.credentialdbopen && context.commands.mysql === true) {
          const socket = context.props.projectmamp ? '/Applications/MAMP/tmp/mysql/mysql.sock' : false

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

          connection.query('CREATE DATABASE IF NOT EXISTS ' + context.props.credentialdbdatabase + ';', (error, results, fields) => {
            if (error) {
              reject(error)
            } else {
              context.log('Added Database [' + context.props.credentialdbdatabase + '] to your MySQL DB')
            }
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

module.exports = addDB
