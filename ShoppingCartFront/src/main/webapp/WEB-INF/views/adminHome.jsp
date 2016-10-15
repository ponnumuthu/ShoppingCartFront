<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/menu.jsp" %>



<div>
Manage Categories: <a href="viewCategories"> View </a> | <a href="addcategory"> Add</a>  <br>
Manage Products : <a href="viewProducts"> View</a>  | <a href="addproduct"> Add</a>  <br>
Manage Suppliers : <a href="viewSuppliers"> View</a>  | <a href="addsupplier"> Add</a>  </br>

</div>


<c:if test="${not empty isViewCategoriesClicked}">
<%@include file="/WEB-INF/views/viewCategory.jsp" %>

</c:if><c:if test="${not empty isAddCategoryClicked}">
<%@include file="/WEB-INF/views/newCategory.jsp" %>

</c:if> 