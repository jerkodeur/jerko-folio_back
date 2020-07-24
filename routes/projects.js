const express = require('express')
const router = express.Router()

const connexion = require('../conf')

// fetch all projects
router.get('/', (req, res) => {
  connexion.query('SELECT * from project', (err, result) => {
    if (err) {
      return res.status('500').json({
        message: err.message,
        sql: err.sql
      })
    }
    return res.status(200).json(result)
  })
})

// fetch a particular projects
router.get('/:id', (req, res) => {
  connexion.query('SELECT * from project WHERE ID = ?', req.params.id, (err, result) => {
    if (err) {
      return res.status('500').json({
        message: err.message,
        sql: err.sql
      })
    }
    return res.status(200).send(result)
  })
})

// Post a new project
router.post('/', (req, res) => {
  const { project, techno } = req.body
  project.date = new Date(project.date)

  connexion.query('INSERT INTO project SET ?', project, (err, result) => {
    if (err) {
      return res.status('500').json({
        message: err.message,
        sql: err.sql
      })
    }
    // Add technos selected
    let sql = 'INSERT INTO project_techno VALUES ?'
    let listTechnos = []
    techno && techno.map(techno => listTechnos.push([result.insertId, parseInt(techno)]))

    connexion.query(sql, [listTechnos], (err, result) => {
      if (err) {
        return res.status(500).json({
          server: err.message,
          sql: err.sql
        })
      }
    })
    // return create infos to the user
    connexion.query('SELECT * FROM project WHERE id = ?', result.insertId, (err, result2) => {
      if (err) {
        return res.status('500').json({
          message: err.message,
          sql: err.sql
        })
      }
      const host = req.get('host')
      const location = `http://${host}/project/${result.insertId}`
      return res.status(201)
        .set('location', location)
        .json({ result2 })
    })
  })
})

module.exports = router