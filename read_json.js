#!/usr/bin/env node

var fs = require('fs');
var file = 'test_json.json';

fs.readFile(file, 'utf8',function(err,data) {
if(err) 
	{ 
	  console.log('Error : ' + err);
	  return;
	  }
	 
	 data = JSON.parse(data); 
	
	 console.dir(data);
});
