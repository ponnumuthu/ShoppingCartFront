<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h2>Supplier</h2>


<form:form action="../editSupplier" method="post">
	<table>
		<tr>
			<td>Supplier ID:</td>
			<td><input class="form-control" type="text" name="id" value="${supplier.id}"></td>
		</tr>
		<tr>
			<td>Supplier Name:</td>
			<td><input class="form-control" type="text" name="name" value="${supplier.name}"></td>
		</tr>
		<tr>
			<td>Supplier PhoneNo:</td>
			<td><input class="form-control" type="text" name=phoneNo value="${supplier.phoneNo}"></td>
		</tr>
		<tr>
			<td>Supplier EmailId:</td>
			<td><input class="form-control" type="text" name="emailId" value="${supplier.emailId}"></td>
		</tr>
		<tr>
			<td>Supplier Address:</td>
			<td><input class="form-control" type="text" name="address" value="${supplier.address}"></td>
		</tr>
		
		<tr>
			<td><input type="submit" value="Add">
			<td><input type="reset" value="Reset">
		</tr>

	</table>

</form:form>