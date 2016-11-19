<%@include file="/WEB-INF/views/header.jsp" %>

<div ng-app="">

<div style="margin-left: 15em;" align="center" >
	<form:form method="post" action="shippingAddess/${username}" onsubmit=" ">
		<table align="center">
		<tr>
		<td colspan="1" align="center"><h3>Shipping Address </h3></td>
		</tr>
			
			<tr>
				<td>User Name :</td>			
				<td style="width: 25em;"><input class="form-control" type="text" name="username" id="user" value="${User.username}"/>
			</tr>
			
			<tr>
				<td>Phone Number :</td>				
				<td><input class="form-control" type="text" name="phoneNo" id="ph" value="${User.phoneNo}"/>
			</tr>
			<tr>
				<td>Email id :</td>				
				<td><input class="form-control" type="email" name="emailid" id="email" value="${User.emailid}"/>
			</tr>
			<tr>
				<td>Address :</td>				
				<td><input class="form-control" type="text" name="adress" id="address" value="${User.adress}"/></td>
			</tr>
			
			<tr>
				<td>Zipcode :</td>			
				<td><input class="form-control" type="text" name="zipCode" id="zip" value="${User.zipCode}"/></td>
			</tr>
			<tr>
				
				<td align="left">
				<input class="btn btn-success" type="submit" value="submit" >
				<input class="btn btn-danger" type="button" value="Cancel"></td>
			</tr>
		</table>
	</form:form>
	</div>
	</div>