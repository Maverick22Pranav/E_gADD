<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Confirm Details</title>
		<link href="style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
	href="${context}/resources/bootstrap/css/bootstrap.min.css">

<!-- Latest compiled JavaScript -->
<script src="${context}/resources/bootstrap/jquery.min.js"></script>

<!-- jQuery library -->
<script src="${context}/resources/bootstrap/js/bootstrap.min.js"></script>

	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
	</head>
 
	<body>
	<%@include file="header.jsp" %>
		<div class="content">
			<fieldset>
				<center><h2> <p class="bg-info"><i>Confirm your Details</i></p></h2>
				<sf:form modelAttribute="userBean">
					<h4></h4><sf:label path="userId" ><h4><i>UserName </i></h4></sf:label>
					<sf:label path="userId" for="usr" type="text" style="width:350px;" class="form-control" id="usr">${userBean.userId}</sf:label>
					<br /><br />
					<sf:label path="mail"><h4><i>Email</i> </h4></sf:label>
					<sf:label path="userId" for="usr" type="text" style="width:350px;" class="form-control" id="usr">${userBean.mail}</sf:label>
					<span class="help-inline">  Where should we send invoices?</span>
					<br /><br /> 
					<sf:label path="door"><h4><i>Door no</i></h4> </sf:label>
					<sf:label path="userId" for="usr" type="text" style="width:350px;" class="form-control" id="usr">${userBean.door}</sf:label>
					<span class="help-inline">  Street Name and/or apartment number</span>
					<br /><br />
					<sf:label path="street"><h4><i>Street name</i></h4> </sf:label>
					<sf:label path="userId" for="usr" type="text" style="width:350px;" class="form-control" id="usr">${userBean.street}</sf:label>
					<span class="help-inline">  Street Name and/or apartment number</span>
					<br /><br />
					<sf:label path="city"><h4><i>City</i></h4> </sf:label>
					<sf:label path="userId" for="usr" type="text" style="width:350px;" class="form-control" id="usr">${userBean.city}</sf:label>
					<span class="help-inline">  City you live currently</span>
					<br /><br />
					<sf:label path="state"><h4><i>State </i></h4></sf:label>
					<sf:label path="userId" for="usr" type="text" style="width:350px;" class="form-control" id="usr">${userBean.state}</sf:label>
					<span class="help-inline"> State you live currently</span>
					<br /><br /></h4>
						<div class="control-group">
    				<sf:label path="userId" for="usr" style="width:350px;" class="control-label">	
    					<h4><i>Country</i></h4>
    				</sf:label>
    				<div class="controls">
    					<select name="country" id="country">
    						<option value="IN">India</option>
    						<option value="SA">Saudi Arabia</option>
    						<option value="SG">Singapore</option>
    						<option value="LK">Sri Lanka</option>
    						</select>
    				</div>
    			</div><br>
    			<br>
					<input name="_eventId_edit" type="submit" class="btn btn-warning" value="Edit" />
					<a href="success" class="btn btn-info" role="button">Billing address</a>
				</sf:form></center>
			</fieldset>
		</div>
	</body>
</html>