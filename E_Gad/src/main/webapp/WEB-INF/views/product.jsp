<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="ef" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<style>
.col-sm-10 {
	color: Brown;
	font-family: Georgia;
}

.col-sm-2 {
	color: Green;
	font-family: Georgia;
}

h2 {
	color: Brown;
	font-family: Georgia;
}
</style>

<title>Product details</title>
</head>
<c:set value="${pageContext.request.contextPath}" var="context"></c:set>
<body background="resources/images/yello back.jpg">
<%@include file="header.jsp" %>

	
		<center><h2>PRODUCT DETAILS</h2></center>
	
	<ef:form class="form-horizontal" action="${context}/addproduct" method="post" modelAttribute="product" enctype="multipart/form-data">
		<ef:hidden path="id" />
		<div class="form-group">
			<label class="control-label col-sm-2" for="pname"> Product Name </label>
			<div class="col-sm-10">
				<ef:input type="text" path="pname" class="form-control" placeholder="Enter product name..." />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pdes">Product
				Description </label>
			<div class="col-sm-10">
				<ef:input type="text" path="pdes" class="form-control"
					placeholder="Enter product description..." />
			</div>
		</div><br>
		
		
		<div class="col-sm-10">
		<label class="control-label col-sm-2" for="quantity">Select category:</label>
		<div class="col-sm-10">
			<ef:select path="pcat.id">
				<ef:options items="${categories}" itemLabel="name" itemValue="id" />
			</ef:select>
			 
			
				</div>
		</div><br>

<br><br>
		<div class="form-group">
			<label class="control-label col-sm-2" for="enterpassword">Quantity
			</label>
			<div class="col-sm-10">
				<ef:input type="text" path="quantity" class="form-control"
					placeholder="Enter the quantity..." />
		
			</div>
		</div>
		<br><br><div class="form-group">
			<label class="control-label col-sm-2" for="enter cost">cost
			</label>
			<div class="col-sm-10">
				<ef:input type="text" path="cost" class="form-control"
					placeholder="Enter the cost..." />
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="file">Select an image:
			</label>
			<div class="col-sm-10">
				<ef:input type="file" path="file" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="dob">Percentage
				Discount </label>
			<div class="col-sm-10">
				<ef:input type="text" path="discount" class="form-control"
					placeholder="Enter discount amount..." />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-danger">Add</button>
			</div>
		</div>
	</ef:form>

	<table class="table table-hover">
		<thead><tr>
			<th>Id</th>
			<th>Product Name</th>
			<th>Product Description</th>
			<th>Quantity</th>
			<th>Image</th>
			<th>Category</th>
			<th>cost</th>
			<th>Percentage Discount</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr></thead>
		<c:forEach items="${products}" var="product">
			<tr>
			<c:url value="/resources/images/${product.id}.jpg" var="url"/>
				<td>${product.id}</td>
				<td>${product.pname}</td>
				<td>${product.pdes}</td>
				<td>${product.quantity}</td>
				<td><img src="${url}" width="150" align="middle" height="150"></td>
				<td>${product.pcat.name}</td>
				<td>${product.cost}</td>
				<td>${product.discount}</td>
				
				
				<td><a href="${context}/editproduct/${product.id}"><button
							type="submit" class="btn btn-basic">Edit</button></a></td>
				<td><a href="${context}/deleteproduct/${product.id}"><button type="submit"
							class="btn btn-basic">Delete</button></a></td>
		
			</tr>
		</c:forEach>
	</table>
</body>
</html>