const TutorRegistration = require("../model/TutorRegistration.model");
exports.ListAllRegistraion = (req,res) => {
	TutorRegistration.getAllRegistration(function (err,data) {
		if(err) {
			res.json(err);
		}
		else{
			res.json(data);
		}
	});
};