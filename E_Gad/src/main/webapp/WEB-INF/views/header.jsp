<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<c:set value="${pageContext.request.contextPath}" var="context"></c:set>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="${context}/resources/bootstrap/css/bootstrap.min.css">

<!-- Latest compiled JavaScript -->
<script src="${context}/resources/bootstrap/jquery.min.js"></script>

<!-- jQuery library -->
<script src="${context}/resources/bootstrap/js/bootstrap.min.js"></script>



</head>
<body>
	<div class>
	<style>
	 .navbar {
      margin-bottom: 0;
      background-color:#DCDCDC;
      z-index: 9999;
      border: 0;
      font-size: 12px !important;
      line-height: 1.42857143 !important;
      letter-spacing: 4px;
      border-radius: 0;
      font-family: Montserrat, sans-serif;
  }
	</style>
		<nav class="navbar navbar-default">
		<div class="container-fluid">

			<ul class="nav navbar-nav">
				<li class="active"><a href="${context}/index">HOME</a></li>
				<security:authorize access="hasAuthority('USER')">
				    <li><a href="${context}/about us">About us</a></li>
					<li><a href="${context}/fproduct">Product</a></li>	
					<li> <a href="${context}/cart"><span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li> 
					<li><a href="${context}/extras">Extras</a></li>
				</security:authorize>
				<security:authorize access="hasAuthority('ADMIN')">
					<li><a href="${context}/product">ADD PRODUCT</a></li>
					<li><a href="${context}/user">AVAILABLE USER LIST</a></li>
					<li><a href="${context}/category">ADD CATEGORY</a></li>
				</security:authorize>
				
			</ul>
         
			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="isAnonymous()">
					<li><a href="register"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="login"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</security:authorize>
			
			<security:authorize access="isAuthenticated()">
				<li><a href="" style="text-align: right; color: black;">Welcome
					
					<security:authentication property="principal.username"/> To E-gADD...</a></li>
					<li><a href="logout" style="text-align: center; color: black;">
					<span class="glyphicon glyphicon-log-out"
						style="text-align: center; color: black;"></span>Logout</a></li>

</security:authorize> 
			</ul>
			
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" style="width: 500px;" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			
		</div>
		</nav>
	</div>




</body>
</html>