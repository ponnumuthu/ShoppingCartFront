function formProduct(){
	// Make quick references to our fields
	var productName = document.getElementById('productName');
	var description = document.getElementById('description');
	var category = document.getElementById('category');
	varsupplierName = document.getElementById('supplierName');
	var price = document.getElementById('price');
			if(notEmty(productName, "Product Name Should not be empty")){
			if(isAlphanumeric(productName, "Numbers and Letters Only for Product Name")){
				if(notEmty(description, "categoryName Should not be empty")){
				if(isAlphanumeric(description, "Numbers and Letters Only for Description")){
					if(notEmty(category, "categoryName Should not be empty")){
					if(isAlphabet(category, "Please enter only letters for Category Name")){
						if(notEmty(supplierName, "supplierName Should not be empty")){
						if(isAlphabet(supplierName, "Please enter only letters for your name")){
							if(notEmty(price, "Price Should not be empty")){
							if(isNumeric(price, "Please enter only number for Price")){
								return true;
							}}
						}}
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
