
var mysql = require('mysql');
var config = {
    dbhost: 'database-2.csklk4sgnzee.us-east-1.rds.amazonaws.com',
    dbuser: 'admin',
    dbpassword: 'HackerSquad10822', 
    dbname: 'database-2' 
};
var util = require('util');

var pool = mysql.createPool({
  host : config.dbhost,
  user : config.dbuser,
  password : config.dbpassword,
  database : config.dbname
});

pool.query = util.promisfy(pool.query);

exports.handler = async (event) => {
  var result = await pool.query("select * from Questions");
  return result;
}
