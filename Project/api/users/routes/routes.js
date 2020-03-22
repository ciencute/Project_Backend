module.exports = app=>{
    let userList = require('../controllers/controller')
    app.route('/user')
    .get(userList.List_all_user)
}