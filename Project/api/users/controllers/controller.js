const Users = require ('../models/model');
let jwt = require("jsonwebtoken");
let middleWare = require("../../../MiddleWares/jwtMiddleware");
let config = require("../../../config/jwtConfig");
exports.List_all_user = (req, res) => {
  // let u1 = req.decoded;
  // console.log(req.decoded.data);
  let AuthUser = req.decoded.data;
  Users.getAllUsers ((err, users) => {
    if (err) res.send (err);
    // console.log('this is request:'+ req.params);
    res.json(users);

  });
};


exports.Login = (req,res)  => {
  let email = req.body.email;
  let password = req.body.password;

  // console.log("he;;o"+ email+password);
  Users.validateLogin({email: email, password:password} , (err,data) => {
    if(err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found user `
        });
      } else {
        res.status(500).send({
          message: "Error updating users with id "
        });
      }
    }
    else {
      // console.log(data);
      let token = jwt.sign({data } ,
          config.secret,
          { expiresIn: '24h' // expires in 24 hours
          }
      );

      res.json({
        success: true,
        message: 'Authentication successful!',
        token: token
      });
      // return the JWT token for the future API calls
    }



  })


};