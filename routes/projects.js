const express = require('express')
const router = express.Router()

const connexion = require('../conf')

const isDev = process.env.NODE_ENV === 'production'

// fetch all projects
router.get('/', (req, res) => {
  let sql =
    'SELECT project.id, title, description, image, url_github, url_test, date, '
  sql += 't.name, t.image_name '
  sql += 'FROM project '
  sql += 'JOIN project_techno pt ON pt.project_id=project.id '
  sql += 'JOIN techno t ON pt.techno_id=t.id '
  sql += 'GROUP BY project.id, t.id '
  sql += 'ORDER BY project.date DESC'

  connexion.query(sql, (err, result) => {
    if (err) {
      return res.status('500').json({
        message: err.message,
        sql: isDev && err.sql
      })
    }
    // create a table with uniq project ids
    const idProjects = result.reduce((previousValue, item) => {
      const idExist = previousValue.includes(item.id)
      return idExist ? previousValue : [...previousValue, item.id]
    }, [])
    // Initialize a new empty tab to receive uniq projects
    const projects = []

    // For each project, we create an object which receive the main datas and an array of technologies
    idProjects.map((project, id) => {
      const currentProject = {}
      const technos = []
      result
        .filter((el) => el.id === project)
        .map((el) => {
          const { name, image_name: imageName, ...mainDatas } = el
          currentProject.mainDatas = mainDatas
          technos.push({ name, image_name: imageName })
        })
      currentProject.technos = technos
      projects.push(currentProject)
    })
    res.status(200).json(projects)
  })
})

// fetch a particular projects
router.get('/:id', (req, res) => {
  connexion.query(
    'SELECT * from project WHERE ID = ?',
    req.params.id,
    (err, result) => {
      if (err) {
        return res.status('500').json({
          message: err.message,
          sql: err.sql
        })
      }
      return res.status(200).send(result)
    }
  )
})

// Post a new project
router.post('/', (req, res) => {
  const { project, techno } = req.body
  const requiredFields = ['title', 'description', 'image', 'url_github', 'url_test']
  const missingField = requiredFields.some((field) => !project[field])
  console.log('missingField', missingField)
  if (missingField) {
    return res.status(400).json({
      message: 'A required field is missing'
    })
  }
  project.date = new Date(project.date)

  connexion.query('INSERT INTO project SET ?', project, (err, result) => {
    if (err) {
      return res.status('500').json({
        message: err.message,
        sql: err.sql
      })
    }
    // Add technos selected
    const sql = 'INSERT INTO project_techno VALUES ?'
    const listTechnos = []
    techno &&
      techno.map((techno) =>
        listTechnos.push([result.insertId, parseInt(techno)])
      )

    connexion.query(sql, [listTechnos], (err, result) => {
      if (err) {
        return res.status(500).json({
          server: err.message,
          sql: err.sql
        })
      }
    })
    // return create infos to the user
    connexion.query(
      'SELECT * FROM project WHERE id = ?',
      result.insertId,
      (err, result2) => {
        if (err) {
          return res.status('500').json({
            message: err.message,
            sql: err.sql
          })
        }
        const host = req.get('host')
        const location = `http://${host}/project/${result.insertId}`
        return res.status(201).set('location', location).json({ result2 })
      }
    )
  })
})

module.exports = router
