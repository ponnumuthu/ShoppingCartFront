<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="/WEB-INF/views/header.jsp" %>
<div style="margin-right:30%" align="center">
	<form:form class="form-group" action="../cardPayment/${username}" onsubmit="return formCreditCard()">

		<table align="center">
			<tr>
			<td colspan="2" align="center"><h3>Payment Details</h3></td>
			</tr>
			<tr>
				<td>Name on Card</td>
				<td>:</td>
				<td><input class="form-control" type="text" name="nameOnCard" id="nameOnCard"/>
				<td>
			</tr>
			<tr>
				<td>Card Number</td>
				<td>:</td>
				<td><input class="form-control" type="text" name="cardNumber" id="cardNumber"/></td>
			</tr>
			<tr>
				<td>Expiration Date</td>
				<td>:</td>
				<td>
				<script language="JavaScript" style="float: left;">
					document.write("<select class='form-control' name='month' style= 'width: 50%'>");
					document.write("<option>month</option>")
					for (var month = 01; month <= 12; month++) {
						document.write("<option>" + month + "</option>");
					}
					document.write("</select>");
				</script> </td><td>
				<script language="JavaScript" style="float: left;">
					document.write("<select class='form-control' name='years' style= 'width: 7em; margin-left: -7em; '>");
					document.write("<option>years</option>")
					for (var year = 2017; year <= 2025; year++) {
						document.write("<option>" + year + "</option>");
					}
					document.write("</select>");
</script></td>
			</tr>
			<tr>
				<td>Card CVV</td>
				<td>:</td>
				<td><input class="form-control" type="password" name="cvv" id="password"/>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit"
					value="Proceed" /></td>
			</tr>
		</table>
	</form:form>
</div>