const sql = require ('../../../config/mysqlConnection');
const Users = users => {
  this.id = users.id;
  this.name = users.name;
  this.gender = users.gender;
  this.dob = users.dob;
  this.email = users.email;
  this.image = users.image;
  this.created_by = users.created_by;
  this.created_at = users.created_at;
  this.updated_by = users.updated_by;
  this.updated_at = users.updated_at;
  this.password = users.password;
  this.status_id = users.status_id;
  this.active = users.active;
  this.role_id = users.role_id;
};
Users.getAllUsers = async result => {
  sql.query ('SELECT * FROM users',(err, res) => {
    if (err) {
      console.log ('err:', err);
      result (null, err);
    } else {
      console.log ('tasks : ', res);
      result (null, res);
    }
  });
};
Users.POST_LOGIN_USER = async result =>{
    sql.query('SELECT * FROM users WHERE email = ?, password = ?', (err, res)=>{
        if (err) {
            console.log ('err:', err);
            result (null, err);
          } else {
            console.log ('tasks : ', res);
            result (null, res);
          }
    })
}
Users.module.exports = Users;
