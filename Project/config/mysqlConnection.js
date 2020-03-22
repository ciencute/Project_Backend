'use strict';
const mysql = require ('mysql');
const connection = mysql.createConnection ({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'etutor',
});
connection.connect ( err=> {
  if (err) throw err;
});
module.exports = connection;
