module.exports = app => {
  const UserController = require('../controllers/controller');
  let jwtMiddleware = require("../../../MiddleWares/jwtMiddleware");
  // app.route ('/user').get (userList.List_all_user);
  // app.get('/loz',(req,res) => {
  //   console.log(req.body);
  //   res.json(req.body);
  // });
  app.get('/login', UserController.Login);

  app.get('/users', jwtMiddleware.checkToken, UserController.List_all_user);
  app.get('/users/:id', jwtMiddleware.checkToken, UserController.GetUserById);
  // app.get('/logout', UserController.Logout);
}