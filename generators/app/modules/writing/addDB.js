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
          const connection = mysql.createConnection({
            host: context.props.credentialdbserver,
            user: context.props.credentialdbuser,
            password: context.props.credentialdbpass
          })

          connection.connect((err) => {
            if (err) {
              context.log('error connecting: ' + err.stack)
            }
          })

          connection.query('CREATE DATABASE IF NOT EXISTS ' + context.props.credentialdbdatabase + ';', (error, results, fields) => {
            if (error) throw error
            context.log('Added Database [' + context.props.credentialdbdatabase + '] to your MySQL DB')
          })
          connection.end()
        } else {
          if (context.props.projectcredential && context.props.credentialdbopen && context.commands.mysql !== true) {
            console.error('`mysql`-command not available')
          }
        }
      })
    }
  }
}

module.exports = addDB
