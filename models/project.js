const connexion = require('../conf')

const getSelectSql = (onlyOne = false) => {
  const where = onlyOne ? `WHERE project.id = ?` : ''
  return `
    SELECT
      project.id, title, description, image, url_github, url_test, date,
      t.id AS tid, t.name, t.image_name
    FROM project
    JOIN project_techno pt ON pt.project_id=project.id
    JOIN techno t ON pt.techno_id=t.id
    ${where}
    GROUP BY project.id, t.id
    ORDER BY project.date DESC
  `
}

const formatResults = (result) => {
  // create a table with uniq project ids
  const idProjects = result.reduce((previousValue, item) => {
    const idExist = previousValue.includes(item.id)
    return idExist ? previousValue : [...previousValue, item.id]
  }, [])
  // Initialize a new empty tab to receive uniq projects
  // For each project, we create an object which receive the main datas and an array of technologies
  return idProjects.map((projectId) => {
    const rows = result.filter((el) => el.id === projectId)
    const { tid, name, image_name: imageName, ...mainDatas } = rows[0]
    const currentProject = { mainDatas }
    const technos = rows.map(({ tid, name, image_name: imageName }) => ({
      id: tid,
      name,
      image_name: imageName
    }))
    currentProject.technos = technos
    return currentProject
  })
}

module.exports = {
  findAll(cb) {
    const sql = getSelectSql()
    connexion.query(sql, (err, result) => {
      if (err) return cb(err)
      const projects = formatResults(result)
      cb(null, projects)
    })
  },

  findOneById(projectId, cb) {
    const sql = getSelectSql(true)
    connexion.query(sql, [projectId], (err, result) => {
      if (err) return cb(err)
      const projects = formatResults(result)
      cb(null, projects[0])
    })
  }
}
