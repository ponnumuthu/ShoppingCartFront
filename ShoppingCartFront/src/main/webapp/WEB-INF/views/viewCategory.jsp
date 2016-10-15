<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%-- <c:if test="${not empty isEditClicked}">
<%@include file="/WEB-INF/views/editCategory.jsp" %>

</c:if> --%>

<form:form action="orderedBy">
<input type="text" name="search" >
<input type="submit" name="submit" value="Sort">
</form:form> 

<h1>${msg}</h1>
<h4>List of available categories</h4>

<table  width="50%">
	<tr>
	    <th align="left">S.No</th>
		<th align="left">Id</th>
		<th align="left">Name</th>
		<th align="left">Description</th>
		<th align="left">Edit</th>
		<th align="left">Delete</th>
		
	</tr>
	<c:forEach items="${categoryList}" var="category" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${category.id}</td>
			<td>${category.name}</td>
			<td>${category.description}</td>
			<td><a href="editcategory/${category.id}">edit</a></td>
			<td><a href="deletecategory/${category.id}" onclick="return confirm('Are You Sure? Do you Want Delete Category : ${category.name} ?')">delete</a></td>
		</tr>
	</c:forEach>
</table>
