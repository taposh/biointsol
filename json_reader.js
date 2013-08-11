#!/usr/bin/env node


var db = mysql.createConnection({
host: '127.0.0.1',
user: 'root',
password: 'taposh',
database: 'ispoondb'
});


var mongodb = require('mongodb')
  , server = new mongodb.Server('127.0.0.1', 27017, {});

var client = new mongodb.Db('mtest', server);

var client = new db.DB

client.open(function(err) {
  client.collection('test_insert', function(err, collection) {
    if (err) throw err;
    console.log('We are now able to perform queries.');
  });
});




//Read the Json file
var firstkfib = function(file) 
{
	console.log("Inside File variable is : " + file);
	var cb = [];
	fs.exists(file, function(exists)
	{
		var tasks = [];
		if (exists) {
		console.log("file exists");
		fs.readFile(file, 'utf8', function(err, data) 
		{
			if (err) throw err;
			var data = data.toString();
			console.log(data);
			var tasks = JSON.parse(data);
			cb(tasks);
		});
		} 
			else { cb([]); }
			console.log(cb);
			return cb;
		});

}

//Connect to db
var http = require('http');
//var work = require('./lib/timetrack');
var mysql = require('mysql');

var db = mysql.createConnection({
host: '127.0.0.1',
user: 'root',
password: 'taposh',
database: 'ispoondb'
});

//Parse Json & insert in db.

var infile ="san_francisco.json"

console.log("function (" + infile + ")");
var fs = require('fs');
var outfile = "json.txt";
fs.writeFileSync(outfile, firstkfib(infile));  
//console.log("Script: " + __filename + "\nWrote: " + fmt(firstkfib(infile)) + "To: " + outfile);


