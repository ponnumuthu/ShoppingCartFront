<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<h4>List of available Suppliers</h4>

<table width="50%" class="table table-hover">
	<tr>
	    <th align="left">S.No</th>
		<th align="left">Id</th>
		<th align="left">Name</th>
		<th align="left">PhoneNo</th>
		<th align="left">EmailId</th>
		<th align="left">Address</th>
		<th align="left">Edit</th>
		<th align="left">Delete</th>
	</tr>
	<c:forEach items="${supplierList}" var="supplier" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${supplier.id}</td>
			<td>${supplier.name}</td>
			<td>${supplier.phoneNo}</td>
			<td>${supplier.emailId}</td>
			<td>${supplier.address}</td>
			<td><a href="editSupplier/${supplier.id}">Edit</a></td>
			<td><a href="deleteSupplier/${supplier.id}" onclick="return confirm('Are you Sure? Do you Want Delete Supplier : ${supplier.name} ?')">Delete</a></td>
		</tr>
	</c:forEach>
</table>
