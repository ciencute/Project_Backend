let express = require ('express');
let bodyparser = require ('body-parser');
let app = express ();
app.use (bodyparser.urlencoded ({extended: true}));
app.use (bodyparser.json ());

let port = process.env.PORT || 3000;
console.log('RESTful API server started on: ' + port);
let routes = require('./api/users/routes/routes');
routes(app);
let regRoute = require('./api/tutorRegistration/routes/TutorRegistration.routes')(app);
app.listen(port);