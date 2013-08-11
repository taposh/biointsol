#!/usr/bin/env node

//Fibonacci Basic
var fibonacci=function(n) {
	if (n<0) { return 0;}
	else if (n==1 || n ==2) {return 1; 
	else if (n>2) {return fibonacci(n-1)+fibonacci(n-2);}};

//Golden Ratio Fibonacci 
var fibonacci2 = function(n) {
	var phi= (1+ Math.sqrt(5))/2;
	return Math.round((Math.pow(phi,n) - Math.pow(1-phi,n)/Math.sqrt(5));
};

var firstkfib = function(k) {
	var i =1;
	var arr =[];
	for (i=1; i<k+1; i++){
		arr.push (fibonacci(i));
	}
	return arr;
};

//Print to Console
var fmt= function(arr) { retun arr.join(" "); };

var k=20
console.log ("fistk ("+k+")");
console.log(fmt(firstkfib(k)));
