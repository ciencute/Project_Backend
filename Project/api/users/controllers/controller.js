const Users = require ('../models/model');
exports.List_all_user = (req, res) => {
  Users.getAllUsers ((err, users) => {
    if (err) res.send (err);
    res.json (users);
  });
};
exports.Login_user = async (req,res) => {
    
    Users.POST_LOGIN_USER((err,users)=>{

    })
}
