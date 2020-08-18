const jwt = require('jsonwebtoken')

const generateToken = (req, res) => {
  const token = jwt.sign(
    { id: req.id },
    process.env.SECRET,
    { algorithm: 'HS256' }
  )
  res.header('Access-Control-Expose-Headers', 'x-access-token')
  res.set('x-access-token', token)
  res.status(200).send({ auth: true })
}

module.exports = {
  generateToken
}