<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="af" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Address</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.col-sm-10
{
color:AliceBlue;
font-family:Georgia;
}
.col-sm-2
{
color:Green;
font-family:Georgia;
}
h2
{
color:Brown;
font-family:Georgia;
}
</style>

</head>
<c:set value="${pageContext.request.contextPath}" var="context"></c:set>
<body background="resources/images/yello back.jpg">

<%@include file="header.jsp" %>
<center><h2>ADDRESS DETAILS</h2></center>
	<af:form class="form-horizontal" action="${context}/address1/${user.id}" method="post"
		modelAttribute="address">
		<af:hidden path="id" />
		<div class="form-group">
			<label class="control-label col-sm-2" for="doorno">Door no:</label>
			<div class="col-sm-10">
				<af:input type="text" path="doorno" class="form-control"
					placeholder="Enter doorno" />
			<af:errors path="doorno"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="street">StreetName:</label>
			<div class="col-sm-10">
				<af:input type="text" path="streetname" class="form-control"
					placeholder="Enter streetname" />
					<af:errors path="streetname"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="city">City:</label>
			<div class="col-sm-10">
				<af:input type="text" path="city" class="form-control"
					placeholder="Enter city" />
						<af:errors path="city"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="state">State:</label>
			<div class="col-sm-10">
				<af:input type="text" path="state" class="form-control"
					placeholder="Enter state" />
					<af:errors path="state"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pincode">Pincode:</label>
			<div class="col-sm-10">
				<af:input type="text" path="pincode" class="form-control"
					placeholder="Enter pincode" />
					<af:errors path="pincode"/>	
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-danger">Submit</button>
			</div>
		</div>
	</af:form>
</body>
</html>

