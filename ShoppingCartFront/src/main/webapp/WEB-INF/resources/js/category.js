function formCategory(){
	// Make quick references to our fields
	var categoryName = document.getElementById('categoryName');
	var description = document.getElementById('description');
			if(notEmty(categoryName, "categoryName Should not be empty")){
			if(isAlphabet(categoryName, "Please enter only letters for Category")){
				if(notEmty(description, "Description Should not be empty")){
				if(isAlphanumeric(description, "Numbers and Letters Only forproductName")){
						return true;
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