#!/usr/bin/env node

var firstkfib = function(k) {
	var i =3;
	var arr =[];

	//2 is prime
	if(k>2){arr.push(2);}

	for (var i=3; i<=k; i+=2){
	
		//Flag for prime number
		var p=true;	
				
		//Prime numbers are subset of Odd Numbers
		for(var j=3;j<=Math.sqrt(i); j+=2)	
		{
			//console.log("testing " + i);
			if (i%j== 0){
				p = false;
				//console.log("Not Prime " +i);
				break;
				}
		}
		
		if(p == true)
			{
			//console.log("prime " + i);
			arr.push(i);
			}
	}
	return arr;
};


//Print to Console
var fmt= function(arr) 
{ 
	return arr.join(","); 
};

var k=1000;
console.log ("fistk ("+k+")");
//console.log(fmt(firstkfib(k)));

var fs = require('fs');
var outfile = "primenumbers.txt";
fs.writeFileSync(outfile, fmt(firstkfib(k)));  
console.log("Script: " + __filename + "\nWrote: " + fmt(firstkfib(k)) + "To: " + outfile);

