const sql = require('../../../config/mysqlConnection');
const Users = users => {
	this.name = users.name;
};

Users.getAllUsers = result => {
	sql.query('SELECT * FROM users', function (err, res) {
		if (err) {
			console.log('err:', err);
			result(null, err);
		} else {
			// console.log ('tasks : ', res);
			result(null, res);
		}
	});
};

Users.validateLogin = (login, result) => {
	console.log(login);
	let query = "SELECT * FROM users WHERE email = " + login.email + "and password = "+ login.password;
	console.log(query);
	sql.query('SELECT * FROM users WHERE email = ? and password = ?', [login.email, login.password], (err, res) => {
		if (err) {
			console.log("error: ", err);
			result(err, null);
			return;
		}

		if (res.length) {
			console.log("login success ", res[0]);
			result(null, res[0]);
			return;
		}

		// not found users with the id
		result({kind: "not_found"}, null);
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
