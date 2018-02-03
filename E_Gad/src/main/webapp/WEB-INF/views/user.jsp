<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="af" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>User details</title>
</head>
<c:set value="${pageContext.request.contextPath}" var="context"></c:set>
<body>
<%@include file="header.jsp" %>
	<h2><center>USER DETAILS</center></h2>
	<af:form class="form-horizontal" method="post" modelAttribute="user"/>
		
	<table class="table table-hover">
	<thead>	<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Dob</th>
			<th>E-mail</th>
			<th>Password</th>
			<th>Contact</th>
			<th>Gender</th>
		</tr></thead>
		<c:forEach items="${users}" var="user">
			<tr>
				<td>${user.id}</td>
				<td>${user.username}</td>
				<td>${user.dob}</td>
				<td>${user.email}</td>
				<td>${user.password}</td>
				<td>${user.contact}</td>
			    <td>${user.gender}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
