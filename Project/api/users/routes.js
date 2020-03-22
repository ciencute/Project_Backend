module.exports = app=>{
    let userList = require('./controller')
    app.route('/user')
    .get(userList.List_all_user)
}