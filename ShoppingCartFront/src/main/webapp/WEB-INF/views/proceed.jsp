<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="dropdown" style="margin-left: 8em;">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Proceed<span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="onLinePayment/${name}">On Line Payment</a></li>
    
      <li class="divider"></li>
      <li><a href="cashOnDelivery/${name}">Cash On Delivery</a></li>
    </ul>
  </div>

</body>
</html>