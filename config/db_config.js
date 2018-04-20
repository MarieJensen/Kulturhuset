
const mysql = require('mysql');


function connect() {
	return mysql.createConnection({
		host: 'localhost',
		user: 'root',
		password: '',
		database: 'kulturhus'
	});
}

module.exports = {
	connect
}
