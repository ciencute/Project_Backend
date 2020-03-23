const Users = require ('../models/model');
let jwt = require ('jsonwebtoken');
let config = require ('../../../config/jwtConfig');
exports.List_all_user = (req, res) => {
  Users.getAllUsers ((err, users) => {
    if (err) res.send (err);
    // console.log('this is request:'+ req.params);
    res.json (users);
  });
};

exports.Login = (req, res) => {
  let email = req.body.email;
  let password = req.body.password;

  console.log ('he;;o' + email + password);
  Users.validateLogin ({email: email, password: password}, (err, data) => {
    if (err) {
      if (err.kind === 'not_found') {
        res.status (404).send ({
          message: `Not found user with id ${email}.`,
        });
      } else {
        res.status (500).send ({
          message: 'Error updating users with id ' + req.params.password,
        });
      }
    } else {
      let token = jwt.sign ({email: email, password: password}, config.secret, {
        expiresIn: '24h', // expires in 24 hours
      });

      res.json ({
        success: true,
        message: 'Authentication successful!',
        token: token,
      });
      // return the JWT token for the future API calls
    }
  });
};
