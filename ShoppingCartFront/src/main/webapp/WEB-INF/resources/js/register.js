function formRegister(){
	// Make quick references to our fields
	var username = document.getElementById('user');
	var password = document.getElementById('pass');
	var phone = document.getElementById('ph');
	var email = document.getElementById('email');
	var address = document.getElementById('address');
	var zipcode = document.getElementById('zip');

		// Check each input in the order that it appears in the form!
			if(notEmpty(username, "Username Should not be empty")){
			if(isAlphabet(username, "Please enter only letters for Username")){
				if(notEmpty(password, "password Should not be empty")){
				if(isAlphanumeric(password, "Numbers and Letters Only for Passwords")){
					if(notEmpty(phone, "PhoneNumber Should not be empty")){
					if(isNumeric(phone, "Please enter only number for PhoneNumber")){
						if(notEmpty(email, "EmailId Should not be empty")){
							if(notEmpty(address, "Address Should not be empty")){
								if(notEmpty(zipcode, "Zipcode Should not be empty")){
								if(isNumeric(zipcode, "Please enter a valid zip code")){
									return true;
								}}
							}
						}
					}}
				}}
			}}
		return false;
}


function notEmpty(elem, helperMsg){
	if(elem.value.length == 0){
		alert(helperMsg);
		elem.focus(); // set the focus to this input
		return false;
	}
	return true;
}

function isNumeric(elem, helperMsg){
	var numericExpression = /^[0-9]+$/;
	if(elem.value.match(numericExpression)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}

function isAlphabet(elem, helperMsg){
	var alphaExp = /^[a-zA-Z]+$/;
	if(elem.value.match(alphaExp)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}

function isAlphanumeric(elem, helperMsg){
	var alphaExp = /^[0-9a-zA-Z]+$/;
	if(elem.value.match(alphaExp)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}

function emailValidator(elem, helperMsg){
	var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
	if(elem.value.match(emailExp)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}