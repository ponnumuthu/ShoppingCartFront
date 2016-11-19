<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<form:form action="searchCart">
<div class="row">
<h4 style="float: left; margin-left: 10em;">List of Carts</h4>
<input class="form-control" type="text" name="search" style="width: 25em; float: left; margin-left: 2em;">
<input type="submit" name="submit" value="Search" class="btn btn-primary" style="float: left;">
</div>
</form:form> 

<div style="margin-left: 200px;">
<table  width="75%" class="view" style="margin-top: 1em; margin-right: 6em; " class="table table-hover">
<tr>
	    <th align="left">S.No</th>
	    
	<th align="left">User Name</th>
		
	
		<th align="left">ProductName</th>
		<th align="left">Status</th>
		<th align="left">Quantity</th>
		<th align="left">Price</th>
		<th align="left">Days</th>

				
	</tr>
	<c:forEach items="${cartList}" var="cart" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${cart.userName}</td>	
			<td>${cart.productName}</td>	
			<td>${cart.status}</td>		
			<td>${cart.quantity}</td>
				<td>${cart.price}</td>
			 <td>${cart.days}</td> 
			</tr>
	</c:forEach>
	
	
</table>
</div>