const express = require('express');
const router = express.Router()

const connexion = require('../conf')

router.get('/', (req, res) => {
  connexion.query('SELECT * from techno', (err, result) => {
    if (err) {
      return res.status('500').json({
        message: err.message,
        sql: err.sql
      })
    }
    return res.status(200).json(result)
  })
})

module.exports = router