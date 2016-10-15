<%@include file="/WEB-INF/views/header.jsp" %>
<%@include file="/WEB-INF/views/menu.jsp" %>
<aside class="col-lg-3 col-sm-4 asidenav">
<%@include file="/WEB-INF/views/sidebar.jsp" %> 
</aside>
<%@include file="/WEB-INF/views/carousel.jsp" %>
<article class="col-lg-8 col-lg-offset-1 col-sm-7 col-sm-offset-1">
<%@include file="/WEB-INF/views/listedItem.jsp" %>
</article>
<c:if test="${not empty isLoginClicked }">
<%@include file="/WEB-INF/views/login.jsp" %>
</c:if>
<c:if test="${not empty isSignUpClicked }">
<%@include file="/WEB-INF/views/register.jsp" %>
</c:if>
<c:if test="${not empty isLoggedOutClicked }">
<%@include file="/WEB-INF/views/login.jsp" %>
</c:if>
<%@include file="/WEB-INF/views/footer.jsp" %>