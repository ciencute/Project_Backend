module.exports = app => {
	const tutorRegistrationController = require("../controller/TutorRegistration.controller");
	app.get('/tutorregistration', tutorRegistrationController.ListAllRegistraion )
};