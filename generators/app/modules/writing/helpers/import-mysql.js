const mysql = require('mysql')
const fs = require('fs-extra')
const Validator = require('jsonschema').Validator
const v = new Validator()
var conn

const configSchema = {
  'host': {'type': 'string'},
  'user': {'type': 'string'},
  'password': {'type': 'string'},
  'database': {'type': 'string'}
}

exports.config = data => {
  return new Promise((resolve, reject) => {
    console.log('starting config')
    // console.log(data)
    const valid = v.validate(data, configSchema)
    console.log(`valid schema`)
    // console.log(`valid schema: ${valid}`)
    if (valid) {
      console.log('storing config data')
      conn = data
      // console.log(JSON.stringify(conn, null, 2))
      resolve(true)
    } else {
      reject('invalid config data')
    }
  })
}

exports.importSQL = filename => {
  console.log(`importSQL start: ${filename}`)
  return new Promise((resolve, reject) => {
    console.log(`importSQL promise: ${filename}`)
    fs.readFile(filename, 'utf8').then(arraySplit).then(runQueries).then(() => {
      console.log(`importSQL done: ${filename}`)
      resolve('all tables created')
    }).catch((err) => {
      console.log(`error with: ${filename}`)
      console.log(err)
      reject(`error: ${err}`)
    })
  })
}

const arraySplit = (str) => {
  console.log('arraySplit')
  return new Promise((resolve, reject) => {
    if (str.indexOf(';') === -1) {
      reject('each SQL statement must terminate with a semicolon (;)')
    }
    str = str.trim()
    str = str.replace(/(?:\r\n|\r|\n)/g, ' ')
    str = str.replace(/\s\s+/g, ' ').trim()
    str = str.substring(0, str.length - 1)
    let arr = str.split(';')
    resolve(arr)
  })
}

const runQueries = (arr) => {
  console.log('connecting to database')
  // console.log(JSON.stringify(conn, null, 2))
  let db = mysql.createConnection(conn)
  Promise.all(arr.map(item => {
    // console.log(item)
    db.query(item, (err, rows) => {
      if (err) {
        throw 'ERROR: ' + err
      }
      return 'ROWS: ' + rows
    })
  })).then(() => {
    console.log('DONE!')
  }, (e) => {
    console.log(`error: ${e}`)
  })
}
