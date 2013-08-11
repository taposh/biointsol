#!/usr/bin/env node

// Include http module, 
var http = require('http'), 

// And mysql module you've just installed. 
mysql = require("mysql"); 
     
// Create the connection. 
var connection = mysql.createConnection({ 
   user: "root", 
   password: "taposh", 
   database: "ispoondb"
}); 
 
 //connect using the connection
 connection.connect(function(err) {
  // connected! (unless `err` is set)
});
 
 
var fs = require('fs');
var file = 'test_json.json';

fs.readFile(file, 'utf8',function(err,data) {
if(err) 
	{ 
	  console.log('Error : ' + err);
	  return;
	  }
	 
	 data = JSON.parse(data); 
	 var query = connection.query('INSERT INTO data SET ?', data, function(err, result) {
  // Neat!
});
    //console.log(query.sql); 
	
	// console.dir(data);
});
