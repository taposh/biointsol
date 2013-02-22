
// Form Validation JavaScript

function EW_onError(form_object, input_object, object_type, error_message)
    {
	alert(error_message);									
    if (object_type == "RADIO" || object_type == "CHECKBOX") {
		if (input_object[0])
			input_object[0].focus();
		else
			input_object.focus();
	}
	else if (!(document.all && document.all["_"+input_object.name+"_editor"])) { 
			input_object.focus();  
	}  

	if (object_type == "TEXT" || object_type == "PASSWORD" || object_type == "TEXTAREA") {
		if (!(document.all && document.all["_"+input_object.name+"_editor"]))
			input_object.select();
	}
						
    return false;	
    }


function EW_hasValue(obj, obj_type)
    {
    if (obj_type == "TEXT" || obj_type == "PASSWORD" || obj_type == "TEXTAREA")
	{
    	if (obj.value.length == 0) 
      		return false;
		else if (document.all && document.all["_"+obj.name+"_editor"] && (obj.value == '<P>&nbsp;</P>'))
			return false;  
    	else 
      		return true;			
    }
    else if (obj_type == "SELECT")
	{
		if (obj.selectedIndex == 0)
			return false;
		else
       		return true;	
	}   
    else if (obj_type == "RADIO" || obj_type == "CHECKBOX")
	{
        if (obj[0])
		{
			for (i=0; i < obj.length; i++)
		    	{
			if (obj[i].checked)
				return true;
			}
		}
		else
		{
			if (obj.checked)
				return true;
			else
	       		return false;	
		}
       	return false;	
	}
	}

	
// Date (mm/dd/yyyy)
function EW_checkusdate(source, args)
    {
    var object_value = args.Value;
    if (args.Value.length == 0){
        args.IsValid =  true;
		return true;
	}
	
   	var isplit = object_value.indexOf('/');

	if (isplit == -1 || isplit == args.Value.length){
		args.IsValid =  false;
		return false;
	}

    var sMonth = object_value.substring(0, isplit);

	if (sMonth.length == 0){
        args.IsValid =  false;
		return false;
	}
	var isplit = object_value.indexOf('/', isplit + 1);

	if (isplit == -1 || (isplit + 1 ) == args.Value.length){
		args.IsValid =  false;
		return false;
	}
    var sDay = object_value.substring((sMonth.length + 1), isplit);

	if (sDay.length == 0){
        args.IsValid =  false;
		return false;
	}
	var sYear = object_value.substring(isplit + 1);

	if (!EW_checkint(sMonth)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_numberrange(sMonth, 1, 12)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_checkint(sYear)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_numberrange(sYear, 0, 9999)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_checkint(sDay)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_checkday(sYear, sMonth, sDay)){
		args.IsValid =  false;
		return false;
	}
	else{
		args.IsValid =  true;
		return true;
	}
    }

	
// Date (yyyy/mm/dd)
function EW_checkdate(source, args)
    {
    var object_value = args.Value;
    if (args.Value.length == 0){
        args.IsValid =  true;
		return true;
	}
	var isplit = object_value.indexOf('/');

	if (isplit == -1 || isplit == args.Value.length){
		args.IsValid =  false;
		return false;
	}

    var sYear = object_value.substring(0, isplit);

	isplit = object_value.indexOf('/', isplit + 1);

	if (isplit == -1 || (isplit + 1 ) == args.Value.length){
		args.IsValid =  false;
		return false;
	}
    var sMonth = object_value.substring((sYear.length + 1), isplit);
	
	if (sMonth.length == 0){
        args.IsValid =  false;
		return false;
	}
	var sDay = object_value.substring(isplit + 1);
	
	if (sDay.length == 0){
        args.IsValid =  false;
		return false;
	}
	if (!EW_checkint(sMonth)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_numberrange(sMonth, 1, 12)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_checkint(sYear)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_numberrange(sYear, 0, 9999)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_checkint(sDay)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_checkday(sYear, sMonth, sDay)){
		args.IsValid =  false;
		return false;
	}
	else{
		args.IsValid =  true;
		return true;
	}
    }


// Date (dd/mm/yyyy)
function EW_checkeurodate(source, args)
    {
    var object_value = args.Value;
    if (args.Value.length == 0){
        args.IsValid =  true;
		return true;
    }

	var isplit = object_value.indexOf('/');

	if (isplit == -1)
	{
		isplit = object_value.indexOf('.');
	}

	if (isplit == -1 || isplit == args.Value.length){
		args.IsValid =  false;
		return false;
	}
    var sDay = object_value.substring(0, isplit);

	var monthSplit = isplit + 1;

	isplit = object_value.indexOf('/', monthSplit);

	if (isplit == -1)
	{
		isplit = object_value.indexOf('.', monthSplit);
	}

	if (isplit == -1 ||  (isplit + 1 )  == args.Value.length){
		args.IsValid =  false;
		return false;
	}
    var sMonth = object_value.substring((sDay.length + 1), isplit);

	var sYear = object_value.substring(isplit + 1);

	if (!EW_checkint(sMonth)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_numberrange(sMonth, 1, 12)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_checkint(sYear)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_numberrange(sYear, 0, null)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_checkint(sDay)) {
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_checkday(sYear, sMonth, sDay)) {
		args.IsValid =  false;
		return false;
	}
	else{
		args.IsValid =  true;
		return true;
	}
    }



function EW_checkday(checkYear, checkMonth, checkDay)
    {

	var maxDay = 31;

	if (checkMonth == 4 || checkMonth == 6 ||
			checkMonth == 9 || checkMonth == 11)
		maxDay = 30;
	else
	if (checkMonth == 2)
	{
		if (checkYear % 4 > 0)
			maxDay =28;
		else
		if (checkYear % 100 == 0 && checkYear % 400 > 0)
			maxDay = 28;
		else
			maxDay = 29;
	}

	return EW_numberrange(checkDay, 1, maxDay); 
    }

function EW_checkinteger(src, args)
	{
	args.IsValid = EW_checkint(args.Value);
	}


function EW_checkint(object_value)
    {
    if (object_value.length == 0)
        return true;
	
	var decimal_format = ".";
	var check_char;

	check_char = object_value.indexOf(decimal_format)
    if (check_char < 1)
	return EW_checknum(object_value);
    else
	return false;
    }

function EW_numberrange(object_value, min_value, max_value)
    {
    if (min_value != null)
	{
        if (object_value < min_value)
		return false;
	}

    if (max_value != null)
	{
	if (object_value > max_value)
		return false;
	}
	
    return true;
    }


function EW_checknumber(src,args)
    {
    if (args.Value.length == 0) {
        args.IsValid = true;
        return true;
        }

	var start_format = " .+-0123456789";
	var number_format = " .0123456789";
	var check_char;
	var decimal = false;
	var trailing_blank = false;
	var digits = false;
	var object_value = args.Value;
	check_char = start_format.indexOf(object_value.charAt(0))
	if (check_char == 1)
	    decimal = true;
	else if (check_char < 1) {
		args.IsValid = false;
		return false;
	}
        
	for (var i = 1; i < args.Value.length; i++)
	{
		check_char = number_format.indexOf(object_value.charAt(i))
		if (check_char < 0) {
			args.IsValid = false;
			return false;
		}
		else if (check_char == 1)
		{
			if (decimal) {
				args.IsValid = false;
				return false;
			}
			else
				decimal = true;
		}
		else if (check_char == 0)
		{
			if (decimal || digits)	
				trailing_blank = true;
		}
	    else if (trailing_blank) {
    		args.IsValid = false;
			return false;
		}
		else
			digits = true;
	}	

    args.IsValid = true;
    return true;
    }
    
function EW_checknum(object_value)
    {
    if (object_value.length == 0) {
        return true;
        }

	var start_format = " .+-0123456789";
	var number_format = " .0123456789";
	var check_char;
	var decimal = false;
	var trailing_blank = false;
	var digits = false;
	
	check_char = start_format.indexOf(object_value.charAt(0))
	if (check_char == 1)
	    decimal = true;
	else if (check_char < 1) {
		return false;
	}
        
	for (var i = 1; i < object_value.length; i++)
	{
		check_char = number_format.indexOf(object_value.charAt(i))
		if (check_char < 0) {
			return false;
		}
		else if (check_char == 1)
		{
			if (decimal) {
				return false;
			}
			else
				decimal = true;
		}
		else if (check_char == 0)
		{
			if (decimal || digits)	
				trailing_blank = true;
		}
	    else if (trailing_blank) {
			return false;
		}
		else
			digits = true;
	}	

    return true;
    }
    

function EW_checktime(src, args)
    {
    var object_value = args.Value;
    if (args.Value.length == 0){
        args.IsValid =  true;
		return true;
	}
	var isplit = object_value.indexOf(':');

	if (isplit == -1 || isplit == args.Value.length){
		args.IsValid =  false;
		return false;
	}
    var sHour = object_value.substring(0, isplit);
	var iminute = object_value.indexOf(':', isplit + 1);

	if (iminute == -1 || iminute == args.Value.length)
		var sMin = object_value.substring((sHour.length + 1));
	else
		var sMin = object_value.substring((sHour.length + 1), iminute);

    if (!EW_checkint(sHour)){
		args.IsValid =  false;
		return false;
	}
    else
    if (!EW_numberrange(sHour, 0, 23)) {
		args.IsValid =  false;
		return false;
	}
	if (!EW_checkint(sMin)){
		args.IsValid =  false;
		return false;
	}
	else
	if (!EW_numberrange(sMin, 0, 59)){
		args.IsValid =  false;
		return false;
	}
    if (iminute != -1)
	{
		var sSec = object_value.substring(iminute + 1);

		if (!EW_checkint(sSec)){
			args.IsValid =  false;
			return false;
		}
		else
		if (!EW_numberrange(sSec, 0, 59)){
			args.IsValid =  false;	
			return false;
		}
	}
    
    args.IsValid =  true;
    return true;
    }
    


function EW_checkphone(src, args)
    {
    var object_value = args.Value;
    var tempint; 
    if (args.Value.length == 0){
        args.IsValid =  true;
		return true;
	}
    if (args.Value.length != 12){
        args.IsValid =  false;
		return false;
	}
    if (!EW_checknum(object_value.substring(0,3))){
		args.IsValid =  false;
		return false;
	}
    else
	tempint = eval(object_value.substring(0,3));
	if (!EW_numberrange(tempint, 100, 1000)){
		args.IsValid =  false;
		return false;
	}
	if (object_value.charAt(3) != "-" && object_value.charAt(3) != " "){
        args.IsValid =  false
		return false;
	}
    if (!EW_checknum(object_value.substring(4,7))){
		args.IsValid =  false;
		return false;
	}
    else
	tempint = eval(object_value.substring(4,7))
	if (!EW_numberrange(tempint, 100, 1000)){
		args.IsValid =  false;
		return false;
	}
	if (object_value.charAt(7) != "-" && object_value.charAt(7) != " "){
        args.IsValid =  false;
		return false;
	}
	if (object_value.charAt(8) == "-" || object_value.charAt(8) == "+"){
        args.IsValid =  false;
    	return false;
    }
	else
	{
		args.IsValid =  (EW_checkint(object_value.substring(8,12)));
		return args.IsValid
	}
    }


function EW_checkzip(src, args)
    {
    var object_value = args.Value;
  if (args.Value.length == 0){
    args.IsValid =  true;
		return truee;
	}		
  if (args.Value.length != 5 && args.Value.length != 10){
    args.IsValid =  false;
	return false;
	}
	if (object_value.charAt(0) == "-" || object_value.charAt(0) == "+"){
		args.IsValid =  false;
		return false;	
	}
	if (!EW_checkint(object_value.substring(0,5))){
		args.IsValid =  false;
		return false;
	}
	if (args.Value.length == 5){
		args.IsValid =  true;
		return false;
	}
	if (object_value.charAt(5) != "-" && object_value.charAt(5) != " "){
        args.IsValid =  false;
		return false;
	}
	if (object_value.charAt(6) == "-" || object_value.charAt(6) == "+"){
        args.IsValid =  false;
        return false;
	}
	args.IsValid =  (EW_checkint(object_value.substring(6,10)));
    return args.IsValid
    }


function EW_checkcreditcard(src, args)
    {
    var object_value = args.Value;
	var white_space = " -";
	var creditcard_string="";
	var check_char;
	var strlen = object_value.length
    if (strlen == 0)
    {
        args.IsValid =  true;
        return true;
	}
	for (var i = 0; i < strlen; i++)
	{
		check_char = white_space.indexOf(object_value.charAt(i))
		if (check_char < 0)
			creditcard_string += object_value.substring(i, (i + 1));
	}	

    if (creditcard_string.length == 0){
        args.IsValid =  false;	 
	 	return false;
	 }
	if (creditcard_string.charAt(0) == "+"){
        args.IsValid =  false;
		return false;
	}
	if (!EW_checkint(creditcard_string)){
		args.IsValid =  false;
		return false;
	}

	var doubledigit = creditcard_string.length % 2 == 1 ? false : true;
	var checkdigit = 0;
	var tempdigit;

	for (var i = 0; i < creditcard_string.length; i++)
	{
		tempdigit = eval(creditcard_string.charAt(i))

		if (doubledigit)
		{
			tempdigit *= 2;
			checkdigit += (tempdigit % 10);

			if ((tempdigit / 10) >= 1.0)
			{
				checkdigit++;
			}

			doubledigit = false;
		}
		else
		{
			checkdigit += tempdigit;
			doubledigit = true;
		}
	}	
	args.IsValid =  (checkdigit % 10) == 0 ? true : false;
	return args.IsValid;
    }


function EW_checkssc(src, args)
    {
    var object_value = args.Value;
	var white_space = " -+.";
	var ssc_string="";
	var check_char;

    if (args.Value.length == 0){
        args.IsValid =  true;
		return true;
	}
    if (args.Value.length != 11){
        args.IsValid =  false;
		return false;
	}
	if (object_value.charAt(3) != "-" && object_value.charAt(3) != " "){
        args.IsValid =  false;
		return false;
	}
	if (object_value.charAt(6) != "-" && object_value.charAt(6) != " "){
        args.IsValid =  false;
		return false;
	}
	for (var i = 0; i < args.Value.length; i++)
	{
		check_char = white_space.indexOf(object_value.charAt(i))
		if (check_char < 0)
			ssc_string += object_value.substring(i, (i + 1));
	}	

    if (ssc_string.length != 9){
        args.IsValid =  false;	 
	 	return false;
	 }
	if (!EW_checkint(ssc_string)){
		args.IsValid =  false;
		return false;
	}
	args.IsValid =  true;
	return true;
    }
	

function EW_checkemail(src, args)
	{
	var object_value = args.Value;
	if (args.Value.length == 0){
		args.IsValid =  true;
		return false;
	}
	if(!(object_value.indexOf("@") > -1 && object_value.indexOf(".") > -1)){
        args.IsValid =  false;    
    	return false;
    }
	args.IsValid =  true;
		return true;
	}
	

// GUID {xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}	
function EW_checkGUID(src, args)
	{
	var object_value = args.Value;
	if (args.Value.length == 0){
        args.IsValid =  true;
    	return true;
    }
	if (args.Value.length != 38){
        args.IsValid =  false;
    	return false;
    }
	if (object_value.charAt(0)!="{"){
		args.IsValid =  false;
		return false;
	}
	if (object_value.charAt(37)!="}"){
		args.IsValid =  false;	
		return false;
	}
	var hex_format = "0123456789abcdefABCDEF";
	var check_char;	

	for (var i = 1; i < 37; i++)
	{		
		if ((i==9)||(i==14)||(i==19)||(i==24)) {
			if (object_value.charAt(i)!="-"){
				args.IsValid =  false;
				return false;
			}
		} else {
			check_char = hex_format.indexOf(object_value.charAt(i));
			if (check_char < 0){
				args.IsValid =  false;
				return false;
			}
		}
	}
	args.IsValid =  true;
	return true;
	}
	

// Update a combobox with filter value
// object_value_array format
// object_value_array[n] = option value
// object_value_array[n+1] = option text 1
// object_value_array[n+2] = option text 2
// object_value_array[n+3] = option filter value
function EW_updatecombo(obj, object_value_array, filter_value) {	
	for (var i = obj.length-1; i > 0; i--) {
        obj.options[i] = null;
	}	
	for (var j=0; j<object_value_array.length; j=j+4) {
		if (object_value_array[j+3].toUpperCase() == filter_value.toUpperCase()) {
			EW_newopt(obj, object_value_array[j], object_value_array[j+1], object_value_array[j+2]);			
		}	
	}
}

// Create combobox option 
function EW_newopt(obj, value, text1, text2) {
	var text = text1;
	if (text2 != "") text += ", " + text2;
    var optionName = new Option(text, value, false, false)
    var length = obj.length;
    obj.options[length] = optionName;
}

// Select combobox option
function EW_selectopt(obj, value) {
	for (var i = obj.length-1;i>=0;i--) {
        if (obj.options[i].value.toUpperCase() == value.toUpperCase()) {
			obj.selectedIndex = i;
			break;
		}
	}
}

// Get image width/height
function EW_getimagesize(file_object, width_object, height_object) {
	if (navigator.appVersion.indexOf("MSIE") != -1)	{
		myimage = new Image();
		myimage.onload = function () { width_object.value = myimage.width; height_object.value = myimage.height; }		
		myimage.src = file_object.value;
	}
}