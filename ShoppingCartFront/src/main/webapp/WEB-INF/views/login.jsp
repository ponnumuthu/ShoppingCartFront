<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="margin-left:30%" align="center">
<form:form action="isvaliduser" method="post" class="form-horizontal">
	
		<table class="col-lg-8 col-lg-offset-1 col-sm-7 col-sm-offset-1">
	
	<tr>
		<td colspan="2" align="justify"><h3>Login Here</h3></td>
		</tr>
		
			<tr>
				<td class="col-lg-3 col-lf-offset-1 col-sm-3 col-sm-offset-1"><b>Email Id:</b></td>
				<td><input class="form-control" type="text" name="emailid"></td>
			</tr>


			<tr>
				<td class="col-lg-3 col-lf-offset-1 col-sm-3 col-sm-offset-1"><b>Password:</b></td>
				<td> <input class="form-control" type="password" name="password" /></td>
			</tr>
			<tr>
			<td colspan="2" align="center" >
			 <c:if test="${not empty error}">
				<div class="error"><b>${error}</b></div>
	 			</c:if> 
				<c:if test="${not empty logout}">
			<div class="msg"><b>${logout}</b></div>
				</c:if>				
				<b>${message}</b></td>
				</tr>
			<tr>
				<td class="col-lg-3 col-lf-offset-1 col-sm-3 col-sm-offset-1"><a href="register">New User?</a></td>
				<td align="center">
				 <div class="col-lg-5  col-sm-4 ">
				<input type="submit" class="btn btn-success">
				
				
				</div>
				
			
				
			</tr>
			
		</table>
	</form:form>
	</div>