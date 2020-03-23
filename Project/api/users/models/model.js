const sql = require('../../../config/mysqlConnection');
const CONST = require('../../../Const/Constant');
const Users = users => {
	this.name = users.name;
};

Users.createUser = (newUser, result) => {
	sql.query('INSERT INTO users set ?', newUser, (err, res) => {
		if (err) {
			console.log(err);
			result(err, null);
		} else {
			console.log(res.insertId);
			result(null, res.insertId);
		}
	});
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
	// console.log(login);
	let query = "SELECT * FROM users WHERE email = " + login.email + "and password = " + login.password;
	// console.log(query);
	sql.query('SELECT * FROM users WHERE email = ? and password = ?', [login.email, login.password], (err, res) => {
		if (err) {
			console.log("error: ", err);
			result(err, null);
			return;
		}

		if (res.length) {
			//hien thi response
			// console.log("login success ", res[0]);
			result(null, res[0]);
			return;
		}

		// not found users with the id
		result({kind: "not_found"}, null);
	});
};

Users.getUserById = (id, result) => {
	sql.query('select * from users where id = ?', [id], function (err, data) {
		if (err) {
			console.log(err);
			result(err, null);
			return;
		} else if (data !== "") {

			result(null, data[0]);
			return;
		} else {
			console.log("not found");
			result(null, {message: "not found users", success: false});
			return;
		}

	});
};

Users.GetAllTutor = result => {
	sql.query(`select * from users where role_id =  ?` ,[CONST.ROLE_TUTOR] , function (err,data) {
		if(err) {
			console.log(err);
			result(err,null)
			return;

		}
		else{
			result(null,data);
			return;
		}
	})
};
Users.GetAllStudent = result => {
	sql.query(`select * from users where role_id =  ?` ,[CONST.ROLE_STUDENT] , function (err,data) {
		if(err) {
			console.log(err);
			result(err,null)
			return;

		}
		else{
			result(null,data);
			return;
		}
	})
};

Users.GetAllStaff = result => {
	sql.query(`select * from users where role_id =  ?` ,[CONST.ROLE_STAFF] , function (err,data) {
		if(err) {
			console.log(err);
			result(err,null)
			return;

		}
		else{
			result(null,data);
			return;
		}
	})
};

Users.Create = (values,result) => {
	let statement = 'INSERT INTO `users`(`name`, `gender`, `dob`, `email`, `image`, `created_by`, `created_at`, `updated_by`, `updated_at`, `password`, `status_id`, `active`, `role_id`) VALUES ?';
	sql.query(statement,[values], function (err,data) {
		if(err){
			result(err,null);
			return;
		} else {
			result(null,data);
			return;
		}

	});
};
module.exports = Users;
