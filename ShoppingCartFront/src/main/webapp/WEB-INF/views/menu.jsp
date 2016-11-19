<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty isLoggedInUser || not empty isLoggedInAdmin}">
<marquee width="25%"><h4  style="text-align:left;float:left;">Welcome ${username}, ${usersId}!!</h4></marquee> 
<h4 style="text-align:right;float:right;"><b>${msg}</b></h4> 
<!-- <hr style="clear:both;"/> -->
</c:if> 

<style>
.blink {
    animation-duration: 1200ms;
    animation-name: blink;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    -webkit-animation:blink 1200ms infinite; /* Safari and Chrome */
}
@keyframes blink {
    from {
        color:blue;
    }
    to {
        color:yellow;
    }
}
@-webkit-keyframes blink {
    from {
        color:blue;
    }
    to {
        color:yellow;
    }
}

</style>
<div class="menu">

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="active"><a class="blink" href="#">Electronics Hub</a></li> 	
				
				<!-- <li><a href="">About</a></li>
				 -->
			</ul>
		
			<c:choose>
			
			<c:when test="${not empty isLoginClicked }">			
			<ul class="nav navbar-nav navbar-right">
						<li><a href="register"><span
						class="glyphicon glyphicon-user"></span>Sign Up</a></li>						
			</ul> 
			</c:when>
			
			<c:when test="${not empty isSignUpClicked }">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="loginpage" />"><span
						class="glyphicon glyphicon-log-in"></span>Login</a></li>	
			</ul> 
			
			
			</c:when>
		
			<c:when test="${not empty isLoggedInAdmin || not empty isLoggedInUser }">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="../j_spring_security_logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>	</ul>
				
			<c:if test="${not empty isLoggedInUser }">
				<ul class="nav navbar-nav navbar-right"> 
			
				<li><a href="myCart/${username}"><span class="glyphicon glyphicon-shopping-cart "></span>MyCart(${numberOfProduct})</a></li>	</ul>
			</c:if>
			
			<%-- <c:if test="${not empty isLoggedInAdmin }">
				<ul class="nav navbar-nav navbar-right"> 
			
				<li><a href="#"><span class="glyphicon glyphicon-shopping-cart "></span>manageCategory</a></li>	</ul>
			</c:if> --%>
			</c:when>
			
			<c:otherwise>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="register"><span
				class="glyphicon glyphicon-user"></span>Sign Up</a></li>
	
				<li><a href="loginpage"><span
						class="glyphicon glyphicon-log-in"></span>Login</a></li>
			</ul> 
			</c:otherwise>
			</c:choose>
			
		</div>
	</nav>
</div>


