module.exports = app => {
  const UserController = require ('../controllers/controller');
  // app.route ('/user').get (userList.List_all_user);
  // app.get('/loz',(req,res) => {
  //   console.log(req.body);
  //   res.json(req.body);
  // });
  app.get('/login' , UserController.Login)
};
