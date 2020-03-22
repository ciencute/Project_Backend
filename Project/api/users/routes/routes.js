module.exports = app => {
  const userList = require ('../controllers/controller');
  app.route ('/user').get (userList.List_all_user);
};
