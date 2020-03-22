const sql = require ('../../../config/mysqlConnection');
const Users = users => {
  this.name = users.name;
};
Users.createUser = (newUser, result) => {
  sql.query ('INSERT INTO users set ?', newUser, (err, res) => {
    if (err) {
      console.log (err);
      result (err, null);
    } else {
      console.log (res.insertId);
      result (null, res.insertId);
    }
  });
};
Users.getAllUsers = result => {
  sql.query ('SELECT * FROM users', function (err, res) {
    if (err) {
      console.log ('err:', err);
      result (null, err);
    } else {
      // console.log ('tasks : ', res);
      result (null, res);
    }
  });
};
module.exports = Users;
