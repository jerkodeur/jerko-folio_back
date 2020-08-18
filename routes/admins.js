const express = require('express')
const router = express.Router()

const { verifyPassword } = require('../services/verify')

// Verify if the user have a valid access for connect as administrator
router.post('/', verifyPassword, (req, res) => {
  res.status(200).send('Authentified !')
})

module.exports = router