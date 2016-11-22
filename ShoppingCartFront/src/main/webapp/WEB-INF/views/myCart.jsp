

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script>
function goBack() {
    window.history.back();
}
</script>
</head>


<%@include file="/WEB-INF/views/header.jsp" %>
<body>

<div style="margin-left: 200px;">
<table  width="100%" class="view" style="margin-top: 1em; margin-right: 6em; ">
<tr>
<td colspan="5" align="center"><h4 >My Cart</h4></td>
</tr>
	<tr>
	    <th align="left">S.No</th>
	
	
		<th align="left">ProductName</th>
		
		<th align="left">Quantity</th>
		<th align="left">Price</th>
	<th align="left">Total</th>
		<th align="left">Delete</th>		
	</tr>
	<c:forEach items="${cartList}" var="cart" varStatus="status">
		<tr>
			<td>${status.count}</td>			
			<td>${cart.productName}</td>		
			<td>${cart.quantity}</td>
			<td>${cart.price}</td>
			<td>${cart.total}</td>
			<td><a href="../deletecart/${username}/${cart.cartId}">delete</a></td>
		</tr>
	</c:forEach>
	<tr style="margin-top: 3em; ">
	<td colspan="3" align="right">Grand Total Amount :</td>
	<td colspan="2">${total}</td>
	</tr>
	
</table>
<div class="row">
<button  onclick="goBack()" class="btn btn-primary" style="float: left;">Go Back</button>
<div class="dropdown" style="margin-left: 8em;">
<button type="button" name="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" style="float: left;"> Place Order<span class="caret"></span> </button>
<ul class="dropdown-menu">
      <li><a href="../onLinePayment/${username}">On Line Payment</a></li>
    
      <li class="divider"></li>
      <li><a href="../cashOnDelivery/${username}">Cash On Delivery</a></li>
    </ul>
  </div>
</div>
  
  </div>
  </body>
