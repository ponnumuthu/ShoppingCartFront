<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<h2 style="font-family: magneto" align="center">ADD Supplier</h2>

	<form:form action="newSupplier" method="post">
		<table align="center" class="col-lg-8 col-lg-offset-1 col-sm-7 col-sm-offset-1">
			
			<tr>
				<td>Supplier Name:</td>
				<td><input class="form-control" type="text" name="name" required="true"></td>
			</tr>
			<tr>
				<td>Supplier phoneNo:</td>
				<td><input class="form-control" type="text" name="phoneNo" required="true"></td>
			</tr>
			<tr>
				<td>Supplier emailId:</td>
				<td><input class="form-control" type="email" name="emailId" required="true"></td>
			</tr>
			<tr>
				<td>Supplier Address:</td>
				<td><input class="form-control" type="text" name="address" required="true"></td>
			</tr>

			<tr>
				<td  colspan="2" align="center"><input class="btn btn-success" type="submit" value="Add">
				<input class="btn btn-danger" type="reset" value="Reset"></td>
			</tr>
			
		</table>

	</form:form>
