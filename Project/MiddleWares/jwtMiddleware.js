let jwt = require('jsonwebtoken');
const config = require('../config/jwtConfig');

let checkToken = (req, res, next) => {
	let token = req.headers['x-access-token'] || req.headers['authorization']; // Express headers are auto converted to lowercase
	if (token.startsWith('Bearer ')) {
		// Remove Bearer from string
		token = token.slice(7, token.length);
	}

	if (token) {
		jwt.verify(token, config.secret, (err, decoded) => {
			if (err) {
				return res.json({
					success: false,
					message: 'Token is not valid'
				});
			} else {
				req.decoded = decoded;
				req.token = token;
				// console.log(decoded);
				next();
			}
		});
	} else {
		return res.json({
			success: false,
			message: 'Auth token is not supplied'
		});
	}
};

let getAuthenticatedUser = (req)  => {
	let token = req.headers['x-access-token'] || req.headers['authorization']; // Express headers are auto converted to lowercase
	if (token.startsWith('Bearer ')) {
		// Remove Bearer from string
		token = token.slice(7, token.length);
	}
	jwt.verify(token, config.secret, (err, decoded) => {
		if (err) {
			return  "";
		} else {
			return decoded;


		}
	});

}

module.exports = {
	checkToken: checkToken,
	getAuthenticatedUser: getAuthenticatedUser
}