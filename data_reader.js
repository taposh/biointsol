var fs = require('fs');
var file = 'test_json.json';

fs.readFile(file, 'utf8',function(err,data) {
if(err) 
	{ 
	  console.log('Error : ' + err);
	  return;
	  }
	 
	 console.log(data);
	 //data = JSON.parse(data); 
	// var query = connection.query('INSERT INTO data SET ?', data, function(err, result) {
  // Neat!
});