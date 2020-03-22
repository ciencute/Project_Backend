const jwt = require("jsonwebtoken")
const users = require('../api/users/models/model')

module.exports =  (req, res, next)=> {
  const token = req.header('Authorization')
  if (!token) return res.status(401).send("Access denied. No token provided.")
  try {
    jwt.verify(token, process.env.JWT_SECRET_KEY, async (err, payload)=> {
      if (err) throw err
      const user = await users.
      if (!user) res.status(401).send("You must login to logout")
      else {
        req.user = user
        req.token = token
        return next()
      }
    })
  } catch (err) {
    res.status(400).send("Invalid token.")
  }
}