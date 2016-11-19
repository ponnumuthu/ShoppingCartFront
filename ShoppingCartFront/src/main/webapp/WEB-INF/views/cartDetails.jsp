<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="margin-left: 200px;">
<table  width="75%" class="view" style="margin-top: 1em; margin-right: 6em; " class="table table-hover">
<tr>
<td colspan="7" align="center"><h4 >Cart Details</h4></td>
</tr>
<tr>
	    <th align="left">S.No</th>
	    
	<th align="left">User Name</th>
		
	
		<th align="left">ProductName</th>
		<th align="left">Status</th>
		<th align="left">Quantity</th>
		<th align="left">Price</th>
		<th align="left">Total</th>
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
				<td>${cart.total}</td>
			 <td>${cart.days}</td> 
			</tr>
	</c:forEach>
	<tr style="margin-top: 3em; ">
	<td colspan="3" align="right">Total Amount :</td>
	<td colspan="2">${total}</td>
	</tr>
	
</table>
</div>