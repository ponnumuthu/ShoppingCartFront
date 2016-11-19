<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- <marquee width="140%"> -->


  <c:forEach items="${productList}" var="product">


<c:if test="${usersId != null }">
<div class="img col-lg-2 col-lg-offset-1 col-sm-2 col-sm-offset-1" style="margin-top: 20px">
  <a href="<spring:url value="cart/${product.product_Id }"/>">
    <img src="<c:url value="/resources/image/products/${product.product_Id}.jpg"/>" alt="${product.product_Id}" width="200" height="300">
  </a>
  <div class="desc">
  <ul style="list-style-type:none">
  <li class="span2"><h5 style="color: blue" >${product.product_Name}</h5>
  <h6>Price:${product.product_Price}</h6></li></ul>
  </div>
</div>

</c:if>
<c:if test="${usersId == null }">
<div class="img col-lg-2 col-lg-offset-1 col-sm-2 col-sm-offset-1" style="margin-top: 20px">
  <a href="<spring:url value="loginpage"/>">
    <img src="<c:url value="/resources/image/products/${product.product_Id}.jpg"/>" alt="${product.product_Id}" width="200" height="300">
  </a>
  <div class="desc">
  <ul style="list-style-type:none">
  <li class="span2"><h5 style="color: blue" >${product.product_Name}</h5>
  <h6>Price:${product.product_Price}</h6></li></ul>
  </div>
  </div>
</c:if>
</c:forEach> 

<!-- </marquee> -->