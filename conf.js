const mysql = require('mysql')

// Define the env variables either to heroku deployment or localhost
const dbSettings = typeof (process.env.CLEARDB_DATABASE_URL) === 'string'
  ? process.env.CLEARDB_DATABASE_URL
  : {
    host: process.env.DB_HOST, // db server address
    user: process.env.DB_USER, // db user's name
    password: process.env.DB_PASS, // db user's password
    database: process.env.DB_NAME // db name
  }

// Setup database connection
const connection = mysql.createPool(dbSettings)

module.exports = connection