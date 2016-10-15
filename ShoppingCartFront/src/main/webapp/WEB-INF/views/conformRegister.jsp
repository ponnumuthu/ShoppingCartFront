<%@include file="/WEB-INF/views/header.jsp" %>

<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script>
function goBack() {
    window.history.back();
}
</script>
<div ng-app="">

<div style="margin-left:30%" align="center" >
	<form:form method="post" action="newuser" >
		<table align="center" class="col-lg-8 col-lg-offset-1 col-sm-7 col-sm-offset-1" >
		<tr>
		<td colspan="1" align="center"><h3>Register Here</h3></td>
		</tr>
			<tr>
				<td>First Name</td>			
				<td><%request.getParameter("FirstName"); %>
				
				<!-- <input class="form-control" type="text"  ng-model="first" name="FirstName" id="first" /> -->
				</td>
			</tr>
			<tr>
				<td>Last Name :</td>			
				<td><%request.getParameter("LastName"); %>
				
				<!-- <input class="form-control" type="text"  ng-model="last" name="LastName" id="last" /> -->
				</td>
			</tr>
			<tr>
				<td>User Name :</td>			
				<td><%request.getParameter("username"); %>
				<!-- <input class="form-control" type="text" name="username" id="user" value='{{first + last}}'/> -->
				</td>
			</tr>
			<tr>
				<td>Password :</td>				
			<td><%request.getParameter("password"); %>
			
				<!-- <input class="form-control" type="password" name="password" id="pass"/>-->
				</td> 
			</tr>
			<tr>
				<td>Phone Number :</td>				
				 <td><%request.getParameter("phoneNo"); %>
				 
				<!--  <input class="form-control" type="text" name="phoneNo" id="ph"/> -->
				 
				 </td> 
			</tr>
			<tr>
				<td>Email id :</td>				
				<td><%request.getParameter("emailid"); %>
				
				<!-- <input class="form-control" type="email" name="emailid" id="email" /> -->
				</td>
			</tr>
			<tr>
				<td>Address :</td>				
				<td><%request.getParameter("adress"); %>
				
				<!-- <input class="form-control" type="text" name="adress" id="address"/> -->
				</td>
			</tr>
			
			<tr>
				<td>Zipcode :</td>			
				<td><%request.getParameter("zipCode"); %>
				
				<!-- <input class="form-control" type="text" name="zipCode" id="zip"/> -->
				</td>
			</tr>
			<tr>
				<td><a href="loginpage">Existing User</a></td>
				<td align="left">
				<input class="btn btn-success" type="submit" value="submit" >
				<button class="btn btn-primary" onclick="goBack()">Go Back</button></td>
			</tr>
			
		</table>
	</form:form>
	</div>
	</div>