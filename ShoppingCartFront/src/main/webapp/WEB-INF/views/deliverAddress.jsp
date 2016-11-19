<%@include file="/WEB-INF/views/header.jsp"%>

<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>



<body>
<div class="row">
<h3 style="margin-left: 4em; float: left;" >Delivery Address :</h3>
<a href="../newShippingAddress"><h4 style="float: right;">create new Address?</h4></a>
</div>






	<c:forEach items="${shippingAddresses}" var="shippingAddres">
		<div class="address col-lg-2 col-sm-2" style="margin-left: 4em; white-space: nowrap;">


			<h3 style="margin-left: 0.5em; float: left;">${shippingAddres.username}</h3>

			<a href="../editShippingAddress/${shippingAddres.shippingId}"><span class="glyphicon glyphicon-pencil deliveraddress"></span></a>
			<a  href="../deleteShippingAddress/${shippingAddres.shippingId}"><span class="glyphicon glyphicon-trash deliveraddress"></span></a>
			<hr style="clear: both;" />
	

		<div>
			<div>${shippingAddres.adress}</div>
			<div>${shippingAddres.zipCode}</div>
		</div>
		<hr style="margin-top: 3em;">
		<h5>contact No: ${shippingAddres.phoneNo}</h5>
		<h5>Mail id: ${shippingAddres.emailid}</h5>
		<hr style="margin-top: 0em;">
		<div class="desc">
		<a href="../productDeliverd/${username}"><button type="submit" name="submit"
				class="btn btn-success">Deliver Here</button></a>
		</div>
	</div>
	</c:forEach>
	
</body>
