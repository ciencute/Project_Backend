module.exports = app => {
<<<<<<< HEAD
  const userList = require ('../controllers/controller');
  app.route ('/user').get (userList.List_all_user);
=======
  const UserController = require ('../controllers/controller');
  let jwtMiddleware = require("../../../MiddleWares/jwtMiddleware");
  // app.route ('/user').get (userList.List_all_user);
  // app.get('/loz',(req,res) => {
  //   console.log(req.body);
  //   res.json(req.body);
  // });
  app.get('/login' , UserController.Login);

  app.get('/users',jwtMiddleware.checkToken ,  UserController.List_all_user);
>>>>>>> 36ee0e7d794c02f61f108e90b7a094086dbd68d3
};
