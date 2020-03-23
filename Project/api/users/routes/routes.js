module.exports = app => {
  const UserController = require ('../controllers/controller');
  let jwtMiddleware = require("../../../MiddleWares/jwtMiddleware");

  app.get('/login' , UserController.Login);

  app.get('/users',jwtMiddleware.checkToken ,  UserController.List_all_user);
};
