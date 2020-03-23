const Users = require ('../models/model');
let jwt = require("jsonwebtoken");
let config = require("../../../config/jwtConfig");
exports.List_all_user = (req, res) => {
  // Users.getAllUsers ((err, users) => {
  //   if (err) res.send (err);
  //   console.log('this is request:'+ req.params);
  //
  // });
  console.log('this is request:'+ req.body);
  res.json (res.body);
};
exports.Login_user = async (req,res) => {
    
    Users.POST_LOGIN_USER((err,users)=>{

    })
}
