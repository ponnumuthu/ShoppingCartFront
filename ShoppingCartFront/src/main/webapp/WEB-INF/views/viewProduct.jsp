<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/menu.jsp" %>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>



<h4>List of available Products</h4>

<table width="50%" ng-app="" >
	<tr>
 <th align="left">S.No</th>
		<th align="left">Id</th>
		<th align="left">Name</th>
		<th align="left">Description</th>
		<th align="left">Price</th>
		<th align="left">Stock</th>
		<th align="left">Supplier</th>
		<th align="left">Category</th>
		<th align="left">Edit</th>
		<th align="left">Delete</th>
	</tr>
	 <c:forEach items="${productList}" var="product" varStatus="status"> 
		<td align="left">${status.count}</td>
			<td align="left">${product.product_Id}</td>
			<td align="left">${product.product_Name}</td>
			<td align="left">${product.description}</td>
			<td align="left">${product.product_Price}</td>
			<td align="left">${product.product_Stock}</td>
			<td align="left">${product.supplier_Name}</td>
			<td align="left">${product.category}</td>
			<td align="left"><a href="editProduct/${product.product_Id}">Edit</a></td>
			<td align="left"><a href="deleteProduct/${product.product_Id}" onclick="return confirm('Are You Sure? Do you Want Delete Product : ${product.product_Name} ?')">Delete</a></td>
		</tr>
	 </c:forEach>
</table>