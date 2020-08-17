const express = require('express')
const router = express.Router()

const connexion = require ('../conf')

router.post('/', (req,res) => {
  console.log('Routes connected');
})

module.export = router