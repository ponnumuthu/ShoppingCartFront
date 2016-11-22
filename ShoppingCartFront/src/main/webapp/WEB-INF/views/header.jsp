<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">




<link rel="stylesheet" type="text/css" href="/resources/css/Shopping.css">
<link rel="stylesheet" type="text/css" href="<c:url value= "/resources/css/home.css"/>">

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script>
	function formCategory() {
		// Make quick references to our fields
		var categoryName = document.getElementById('categoryName');
		var description = document.getElementById('description');
		if (notEmpty(categoryName, "categoryName Should not be empty")) {
			if (isAlphabet(categoryName,
					"Please enter only letters for Category")) {
				if (notEmpty(description, "Description Should not be empty")) {

					return true;

				}
			}
		}
		return false;

	}

	function formCreditCard() {
		
		var nameOnCard = document.getElementById('nameOnCard');
		var cardNumber = document.getElementById('cardNumber');
		var password = document.getElementById('password');
		if (notEmpty(nameOnCard, "Card Name Should not be empty")) {
			if (isAlphabet(nameOnCard, "Please enter only letters for Card Name")) {	
				if (notEmpty(cardNumber, "Card Number Should not be empty")) {
					if (isNumeric(cardNumber, "Please enter only number for cardNumber")) {
						if (notEmpty(password, "CVV Should not be empty")) {
							if (isNumeric(password, "Please enter only number for CVV")) {
								return true;
							}
						}
					}
				}
			}
		}
		return false;
	}
	
	function formRegister() {
		// Make quick references to our fields
		var firstname = document.getElementById('first');
		var lastname = document.getElementById('last');
		var username = document.getElementById('user');
		var password = document.getElementById('pass');
		var phone = document.getElementById('ph');
		var email = document.getElementById('email');
		var address = document.getElementById('address');
		var zipcode = document.getElementById('zip');

		// Check each input in the order that it appears in the form!
		if (notEmpty(firstname, "Firstname Should not be empty")) {
			if (isAlphabet(firstname, "Please enter only letters for Fsername")) {
					if (notEmpty(username, "Username Should not be empty")) {
							if (isAlphabet(username,
									"Please enter only letters for Username")) {
								if (notEmpty(password,
										"password Should not be empty")) {
									if (isAlphanumeric(password,
											"Numbers and Letters Only for Passwords")) {
										if (notEmpty(phone,
												"PhoneNumber Should not be empty")) {
											if (isNumeric(phone,
													"Please enter only number for PhoneNumber")) {
												if (notEmpty(email,
														"EmailId Should not be empty")) {
													if (notEmpty(address,
															"Address Should not be empty")) {
														if (notEmpty(zipcode,
																"Zipcode Should not be empty")) {
															if (isNumeric(
																	zipcode,
																	"Please enter a valid zip code")) {
																return true;
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
		
		return false;
	}
	
	
	function checkPass(){
		var password = document.getElementById('pass');
		var confirmpassword = document.getElementById('confirmpass');
		
		var message = document.getElementById('confirmMessage');
		
		 var goodColor = "lightgreen";
		    var badColor = "#ff6666";
		    
		    if(password.value == confirmpassword.value){
		        //The passwords match. 
		        //Set the color to the good color and inform
		        //the user that they have entered the correct password 
		        confirmpassword.style.backgroundColor = goodColor;
		        message.style.color = goodColor;
		        message.innerHTML = "<span class='glyphicon glyphicon-ok'></span>"
		    }else{
		        //The passwords do not match.
		        //Set the color to the bad color and
		        //notify the user.
		        confirmpassword.style.backgroundColor = badColor;
		        message.style.color = badColor;
		        message.innerHTML = "<span class='glyphicon glyphicon-remove'></span>"
		    }
		    
		    
	}

	function notEmpty(elem, helperMsg) {
		if (elem.value.length == 0) {
			alert(helperMsg);
			elem.focus(); // set the focus to this input
			return false;
		}
		return true;
	}

	function isNumeric(elem, helperMsg) {
		var numericExpression = /^[0-9]+$/;
		if (elem.value.match(numericExpression)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}

	function isAlphabet(elem, helperMsg) {
		var alphaExp = /^[a-z A-Z]+$/;
		if (elem.value.match(alphaExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}

	function isAlphanumeric(elem, helperMsg) {
		var alphaExp = /^[0-9a-zA-Z]+$/;
		if (elem.value.match(alphaExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}

	function emailValidator(elem, helperMsg) {
		var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
		if (elem.value.match(emailExp)) {
			return true;
		} else {
			alert(helperMsg);
			elem.focus();
			return false;
		}
	}
</script>
<!-- body -->
<style type="text/css">
w3-sidenav{
 height: auto;
        padding: 15px;
}


body {
	background-color: WhiteSmoke;
}

/* .asd
  {
   font-size:25;
   font-family:Magneto;
  } */
<!--Carousel -->
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
}

<!--
Menu -->.menu {
	width: 100%;
}

<!--Product Details -->
div.img {
	margin: 5px;
	/*    border: 1px solid #ccc;  */
	float: left;
	width: 150px;
}

div.img:hover {
	-webkit-transform: scale(1.8);
	-ms-transform: scale(1.3);
	transform: scale(0.8);
}

div.img {
	width: auto%;
	height: 23%
}

div.desc {
	padding: 15px;
	text-align: center;
}

<!--Form -->
tr.spaceUnder>td {
	padding-bottom: 1em;
}

table {
	border-collapse: separate;
	border-spacing: 1em;
}

input[type=text], input[type=password], input[type=email], select {
	width: 50%;
}
#password, #cardNumber, #nameOnCard{
width: 107%;
}
 div.address{
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 300px;
    height: 315px;
}

div.address:hover {
    border: 1px solid green;
}
div.desc {
    padding: 15px;
    text-align: center;
}
.deliveraddress{
margin-right: 2em;  
margin-top: 1.5em; 
text-align: right; 
float: right;

}
.asidenav{
display: table-column !important;
}
</style>
<c:choose>
	<c:when test="${not empty isSignUpClicked }">
		<title>Register Page</title>
	</c:when>
	<c:when test="${not empty isLoginClicked }">
		<title>Login Page</title>
	</c:when>
	<c:when test="${not empty isMyCartClicked }">
		<title>My Cart</title>
	</c:when>
	<c:when test="${not empty isProductClicked }">
		<title>Product Details</title>
	</c:when>
	<c:otherwise>
		<title>ShoppingCart</title>
	</c:otherwise>
</c:choose>
</head>
<body>