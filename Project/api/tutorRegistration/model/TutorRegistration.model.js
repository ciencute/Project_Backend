const sql = require('../../../config/mysqlConnection');
const CONST = require('../../../Const/Constant');
const Tutoregistration = (tutoregistration) => {
	this.id	 = tutoregistration.id;
	this.tutor_id = tutoregistration.tutor_id;
	this.student_id	= tutoregistration.student_id;
	this.course_id	= tutoregistration.course_id;
	this.created_by	= tutoregistration.created_by;
	this.created_at	= tutoregistration.created_at;
	this.updated_by =tutoregistration.updated_by;
	this.updated_at  =tutoregistration.updated_at;
	this.from_date  =tutoregistration.from_date;
	this.to_date =tutoregistration.to_date;
	this.status_id =tutoregistration.status_id;

};
Tutoregistration.getAllRegistration = result => {
	sql.query('SELECT * FROM tutor_registrations', function (err, res) {
		if (err) {
			console.log('err:', err);
			result(null, err);
		} else {
			// console.log ('tasks : ', res);
			result(null, res);
		}
	});
};
Tutoregistration.getRegistrationByID = (id, result) => {
	sql.query('select * from tutor_registrations where id = ?', [id], function (err, data) {
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
Tutoregistration.Create = (newRegistration , result) => {
	let statement = 'INSERT INTO `tutor_registrations`(`id`, `tutor_id`, `student_id`, `course_id`, `created_by`, `created_at`, `updated_by`, `updated_at`, `from_date`, `to_date`, `status_id`) VALUES ?';
	sql.query(statement,[newRegistration], function (err,data) {
		if(err){
			result(err,null);
			return;
		} else {
			result(null,data);
			return;
		}

	});
};
Tutoregistration.Update = (id, newValues, result) => {
	let statement = 'UPDATE `tutor_registrations` SET  ?  where id = ?';
	sql.query(statement, [newValues, id], (err,data)=>{

	});
};

Tutoregistration.Delete = (id,result) => {
	let statement  = 'DELETE FROM tutor_registrations WHERE id = ?';
	sql.query(statement, [id], (err,data) => {
		if(err) {
			result(err,null);
			return;
		}
		else {
			result(null,data);
			return;
		}
	})
};

module.exports = Tutoregistration;