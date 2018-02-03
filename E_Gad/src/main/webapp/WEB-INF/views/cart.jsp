<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Cart</title>
<style >#snackbar {
    visibility: hidden;
    min-width: 250px;
    margin-left: -125px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 2px;
    padding: 16px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 17px;
}

#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
</style>
</head>
<body>
	<%@include file="header.jsp"%>

	<div class = "container">
		<table class="table table-hover">
			<thead>
				<tr>
					<td>Image</td>
					<td>Name</td>
					<td>Cost</td>
					<td>Quantity</td>
					<td>Action</td>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${cart.cartItems}" var="cart">
				<c:url value="/resources/images/${cart.product.id}.jpg" var="url"/>
					<tr>
						<td><img alt="${product.productName}" src="${url}"
							width="250px" height="300px" class="img-thumbnail"></td>
						<td>${cart.product.pname}</td>
						<td>${cart.subTotal}</td>
						<td>${cart.quantity}</td>
						<td><a href="${context}/addtocart/${product.id}" class="btn btn-default">+</a></td>
						<td><a href="${pageContext.request.contextPath}/deletecart/${cart.id}"   class="btn btn-danger" onclick="myFunction()">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<div class="col-sm-6">
				<h3>Overall Cost: ${cart.grandTotal}</h3>
			</div>
			<div class="col-sm-6">
			<c:if test="${cart.grandTotal !=0 }">
				<a href="${context}/checkout" class="btn btn-primary" style="right: 50px">CHECK OUT</a>	
			</c:if>
			</div>
		</div>
		
	</div>
</body>
</html>