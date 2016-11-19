<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<%@include file="/WEB-INF/views/header.jsp"%>
<%@include file="/WEB-INF/views/menu.jsp"%>



<div class="row">
	<div style="float: left; margin-left: 5em;">	Manage Categories: <a href="viewCategories"> View </a> | <a	href="addcategory"> Add</a> </div>
	<div style="float: left; margin-left: 5em;">	Manage Products : <a href="viewProducts"> View</a> | <a href="addproduct"> Add</a> </div>
	<div style="float: left; margin-left: 5em;">	Manage Suppliers : <a href="viewSuppliers"> View</a> | <a href="addsupplier"> Add</a> </div>
	<div style="float: left; margin-left: 5em;">	Manage Carts : <a href="viewCarts"> View</a> </div>
</div>

<br><br><br><br><br>

<c:choose>

	<c:when test="${not empty isViewCategoriesClicked}">
		<%@include file="/WEB-INF/views/viewCategory.jsp"%>
	</c:when>

	<c:when test="${not empty isAddCategoryClicked}">
		<%@include file="/WEB-INF/views/newCategory.jsp"%>
	</c:when>
	
	<c:when test="${not empty isEditCategoryClicked}">
		<%@include file="/WEB-INF/views/editCategory.jsp"%>
	</c:when>

	<c:when test="${not empty isAddProductClicked}">
		<%@include file="/WEB-INF/views/newProduct.jsp"%>
	</c:when>
	 
	<c:when test="${not empty isViewProductClicked}">
		<%@include file="/WEB-INF/views/viewProduct.jsp"%>
	</c:when>
	
	<c:when test="${not empty isEditProductClicked}">
		<%@include file="/WEB-INF/views/editProduct.jsp"%>
	</c:when>
	
	<c:when test="${not empty isAddSupplierClicked}">
		<%@include file="/WEB-INF/views/newSupplier.jsp"%>
	</c:when>
	
	<c:when test="${not empty isViewSupplierClicked}">
		<%@include file="/WEB-INF/views/viewSupplier.jsp"%>
	</c:when>
	
	<c:when test="${not empty isEditSupplierClicked}">
		<%@include file="/WEB-INF/views/editSupplier.jsp"%>
	</c:when>
	
	<c:when test="${not empty isViewCartClicked}">
		<%@include file="/WEB-INF/views/viewCart.jsp"%>
	</c:when>
	
	<c:otherwise>
			<h1 style="margin-left: 35%;">Welcome Admin !!</h1>
		</c:otherwise>
</c:choose>