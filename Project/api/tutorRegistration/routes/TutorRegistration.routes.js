module.exports = app => {
	const tutorRegistrationController = require("../controller/TutorRegistration.controller");
	const jwt = require('../../../MiddleWares/jwtMiddleware');
	app.get('/tutorregistration', tutorRegistrationController.ListAllRegistraion )
};