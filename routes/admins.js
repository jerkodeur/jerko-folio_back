const express = require('express')
const router = express.Router()

const { verifyPassword } = require('../services/verify')
const { generateToken } = require('../services/token')

// Verify if the user have a valid access for connect as administrator
router.post('/', verifyPassword, generateToken)

module.exports = router