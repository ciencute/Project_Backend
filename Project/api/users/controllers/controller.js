const Users = require('../models/model');
const CONST = require('../../../Const/Constant');
let jwt = require("jsonwebtoken");
let middleWare = require("../../../MiddleWares/jwtMiddleware");
let config = require("../../../config/jwtConfig");
exports.List_all_user = (req, res) => {
	// let u1 = req.decoded;
	// console.log(req.decoded.data);
	let AuthUser = req.decoded.data;
	Users.getAllUsers((err, users) => {
		if (err) res.send(err);
		// console.log('this is request:'+ req.params);
		res.json(users);

	});
};


exports.Login = (req, res) => {
	let email = req.body.email;
	let password = req.body.password;

	// console.log("he;;o"+ email+password);
	Users.validateLogin({email: email, password: password}, (err, data) => {
		if (err) {
			if (err.kind === "not_found") {
				res.status(404).send({
					message: `Not found user `
				});
			} else {
				res.status(500).send({
					message: "Error updating users with id "
				});
			}
		} else {
			// console.log(data);
			let token = jwt.sign({data},
				config.secret,
				{
					expiresIn: '1h' // expires in 24 hours
				}
			);

			res.json({
				success: true,
				message: 'Authentication successful!',
				token: token
			});
			// return the JWT token for the future API calls
		}

	})

};

// exports.Logout = (req,res) => {
//   console.log("logging out");
//   jwt.destroy(req.token);
// }
exports.GetUserById = function (req, res) {
	if (!Number.isInteger(parseInt(req.params.id))) {
		res.json({
			"message": "error parameter",
			success: false
		})
	} else {
		Users.getUserById(req.params.id, function (err, data) {
			if (err) {
				res.send(err);
			} else {
				res.json(data);
			}

		})
	}
};

exports.GetAllTutors = function (req, res) {
	Users.GetAllTutor(function (err, data) {
		if (err) {
			res.json(err);
		} else {
			res.json({
				success: true,
				data: data
			});
		}

	})

};
exports.GetAllStudent = function (req, res) {
	Users.GetAllStudent(function (err, data) {
		if (err) {
			res.json(err);
		} else {
			res.json({
				success: true,
				number_of_record: data.length,
				data: data,

			});
		}

	})

};
exports.GetAllStaff = function (req, res) {
	Users.GetAllStaff(function (err, data) {
		if (err) {
			res.json(err);
		} else {
			res.json({
				success: true,
				number_of_record: data.length,
				data: data,

			});
		}

	})

};

exports.CreateUser = function (req, res) {
	let users = req.body.users;
	let newUser = users.map(el => Object.values(el));

	// console.log(newUser);

	// res.send(newUser);
	Users.Create(newUser, function (err, data) {
		if (err) {
			res.json(err);
		} else {
			res.json({
				success: true,
				data: data
			})
		}

	})

};

exports.Update = (req ,res) => {
	let id = req.params.id;
	let value = req.body.data;

	if (!Number.isInteger(parseInt(id))) {
		res.json({
			"message": "error parameter",
			success: false
		})
	}
	else {
		Users.Update(id,value, (err,data) => {
			if(err) {
				res.json({
					success:false,
					message:err.sqlMessage
					}
				);
			}
			else if(data.affectedRows === 0) {
				res.json({
					success: false,
					message:"not found user"
				});
			}
			else {
				res.json({
					success: true,
					message:data.message
				});
			}
		});
	}


};

exports.Delete = (req,res) => {
	let id = req.params.id;

	if (!Number.isInteger(parseInt(id))) {
		res.json({
			"message": "error parameter",
			success: false
		})
	}
	else{
		Users.Delete(id, (err,data) => {
			if(err) {
				res.json({
						success:false,
						message:err.sqlMessage
					}
				);
			}
			else if(data.affectedRows === 0) {
				res.json({
					success: false,
					message:"not found user"
				});
			}
			else {
				res.json({
					success: true,
					message:"delete user "+id+" successfully"
				});
			}
		});
	}

};

