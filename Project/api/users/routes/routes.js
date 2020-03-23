module.exports = app => {
  const UserController = require('../controllers/controller');
  let jwtMiddleware = require("../../../MiddleWares/jwtMiddleware");
  // app.route ('/user').get (userList.List_all_user);
  // app.get('/loz',(req,res) => {
  //   console.log(req.body);
  //   res.json(req.body);
  // });

  // login with email and pass
  app.get('/login', UserController.Login);
// retrieve all users
  app.get('/users', jwtMiddleware.checkToken, UserController.List_all_user);
  // retrieve all users by id
  app.get('/users/:id', jwtMiddleware.checkToken, UserController.GetUserById);
  // retrieve all tutors
  app.get('/tutors', jwtMiddleware.checkToken,UserController.GetAllTutors);
  // retrieve all student
  app.get('/students', jwtMiddleware.checkToken,UserController.GetAllStudent);
  // retrieve all staff
  app.get('/staff', jwtMiddleware.checkToken,UserController.GetAllStaff);
  // app.get('/logout', UserController.Logout);
  app.post('/createusers', UserController.CreateUser);
}