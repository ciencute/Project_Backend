const Users = require ('../models/model');
exports.List_all_user = (req, res) => {
  Users.getAllUsers ((err, users) => {
    if (err) res.send (err);
    console.log('this is request:'+ req.params);
    res.json (res.body);
  });
};
