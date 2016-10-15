<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<h2 style="font-family: magneto" align="center">ADD Category</h2>

	<form:form action="newCategory" method="post" onsubmit="return formCategory()">
		<table align="center" class="col-lg-8 col-lg-offset-1 col-sm-7 col-sm-offset-1">
			<tr>
				<td>Category Name:</td>
				<td><input class="form-control" type="text" name="name" id="categoryName"></td>
			</tr>
			<tr>
				<td>Category Description:</td>
				<td><input class="form-control" type="text" name="description" id="description"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input class="btn btn-success" type="submit" value="Add">
				<input class="btn btn-danger" type="reset" value="Reset"></td>
			</tr>
			
		</table>

	</form:form>
