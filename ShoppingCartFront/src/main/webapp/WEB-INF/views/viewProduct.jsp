<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<form:form action="searchProduct">
<div class="row">
<h4 style="float: left; margin-left: 2em;">List of available Products</h4>
<input class="form-control" type="text" name="search" style="width: 25em; float: left; margin-left: 2em;">
<input type="submit" name="submit" value="Search" class="btn btn-primary" style="float: left;">
</div>
</form:form> 


<table width="50%" ng-app="" class="table table-hover">
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