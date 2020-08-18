const bcrypt = require('bcryptjs')
const connexion = require('../conf')

const verifyPassword = (req,res,next) => {
  const { pseudo, password } = req.body
  connexion.query('SELECT * from admin WHERE pseudo = ?', pseudo, (err, result) => {
    if (err) return res.status(500).json({
      message: err.message,
      sql: err.sql
    })
    !bcrypt.compareSync(password, result[0].password) ?
      res.status(401).send('Bad password') :
      next()
  })
}

module.exports = {
  verifyPassword
}