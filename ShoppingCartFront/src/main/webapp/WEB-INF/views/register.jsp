<%@include file="/WEB-INF/views/header.jsp"%>

<html>
<head>
<script	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script type="text/javascript">
var app = angular.module('myApp',[]);
app.controller("UserController", function ($scope,$http) {
	$scope.getdata = function () {
		$http({
			method : 'GET',
			url : 'checkUser'
		}).success(function (data, status, headers, config) {
			$scope.result = data;
			
		}).error(function (data, status, headers, config) {
			
		})
	}
});


</script>

<style type="text/css">
.confirmpassword.compare-to {
	background-color: lightgreen;
}
.password.ng-valid {
	background-color: lightgreen;
}

.password.ng-dirty.ng-invalid-required {
	background-color: red;
}

.password.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}
.confirmMessage{
    margin-left: 30%;
    margin-top: -5%;
   position: absolute;
}


</style>
</head>
<body>
	<div ng-app="myApp">

		<div style="margin-left: 30%" align="center">
			<form:form method="post" action="newuser"
				onsubmit="return formRegister()" name="myForm">
				<table align="center"
					class="col-lg-8 col-lg-offset-1 col-sm-7 col-sm-offset-1">
					<tr>
						<td colspan="1" align="center"><h3>Register Here</h3></td>
					</tr>
					<tr>
						<td>First Name</td>
						<td><input class="form-control" type="text" ng-model="first"
							name="FirstName" id="first" /></td>
					</tr>
					<tr>
						<td>Last Name :</td>
						<td><input class="form-control" type="text" ng-model="last"
							name="LastName" id="last" /></td>
					</tr>
					<tr>
						<td>User Name :</td>
						<td><input class="form-control" type="text" name="username"
							id="user" value='{{first + last}}' />
							</td>
					</tr>
					<tr>
						<td>Password :</td>
						<td><input class="form-control password" type="password" ng-model="password"
							name="password" id="pass" required  ng-minlength="8"/>
							
							
							<!-- <div class="has-error" ng-show="myForm.$dirty">
								<span ng-show="myForm.password.$error.required">This is a
									required field</span> <span ng-show="myForm.password.$error.minlength">Minimum
									length required is 3</span> <span ng-show="myForm.password.$invalid">This
									field is invalid </span>
							</div> -->
							
							</td>
					</tr>
					<tr class="fieldWrapper">
						<td>Confirm Password :</td>
						<td><input class="form-control confirmpassword" type="password" ng-model="confirmpassword" name="confirmpassword" id="confirmpass" onkeyup="checkPass(); return false;"/><span id="confirmMessage" class="confirmMessage"></span></td>						
							</tr>
					<tr>
						<td>Phone Number :</td>
						<td><input class="form-control" type="text" name="phoneNo"
							id="ph" /></td>
					</tr>
					<tr>
						<td>Email id :</td>
						<td><input class="form-control" type="email" name="emailid"
							id="email" /></td>
					</tr>
					<tr>
						<td>Address :</td>
						<td><input class="form-control" type="text" name="adress"
							id="address" /></td>
					</tr>

					<tr>
						<td>Zipcode :</td>
						<td><input class="form-control" type="text" name="zipCode"
							id="zip" /></td>
					</tr>
					<tr>
						<td><a href="loginpage">Existing User</a></td>
						<td align="left"><input class="btn btn-success" type="submit"
							value="submit"> <a href="loginpage"><input class="btn btn-danger"
							type="button" value="Cancel"></a></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</body>
</html>