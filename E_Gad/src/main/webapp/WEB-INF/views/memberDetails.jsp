<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Member Details</title>
		<link href="style.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		</head>
 <body>
	<%@include file="header.jsp" %>
		<center><div class="content">
			<fieldset>
				<h2> <p class="bg-info">Member Details</p></h2>
				<sf:form modelAttribute="userBean"><br />
					<sf:label path="userId" for="usr"><h3>UserName:</h3></sf:label>
					<sf:input path="userId" type="text" style="width:500px;" placeholder="Enter your name..." class="form-control" id="usr" /><br />
					
					<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('userId')}" var="err">
					  <div><span>${err.text}</span></div>
					</c:forEach><br />
					<sf:label path="mail" for="usr"><h3>Email </h3></sf:label>
					<sf:input path="mail" type="text" style="width:500px;" placeholder="Enter the email id.." class="form-control" id="usr"/><br />
					<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('mail')}" var="err">
					  <div><span>${err.text}</span></div>
					</c:forEach><br />
					<sf:label path="door" for="usr"><h3>Door no</h3></sf:label>
					<sf:input path="door" type="text"  placeholder="Enter the door number.." style="width:500px;" class="form-control" id="usr"/><br />
					<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('door')}" var="err">
					  <div><span>${err.text}</span></div>
					</c:forEach><br />
					<sf:label path="street" for="usr"><h3>Street name</h3> </sf:label>
					<sf:input path="street" type="text" style="width:500px;" placeholder="Enter street name..." class="form-control" id="usr"/><br />
					<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('street')}" var="err">
					  <div><span>${err.text}</span></div>
					</c:forEach><br />
					<sf:label path="city" for="usr"><h3>City</h3> </sf:label>
					<sf:input path="city" type="text" style="width:500px;" placeholder="Enter city..."  class="form-control" id="usr" /><br />
					<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('city')}" var="err">
					  <div><span>${err.text}</span></div>
					</c:forEach><br />
					<sf:label path="state" for="usr"><h3>State </h3></sf:label>
					<sf:input path="state" type="text" style="width:500px;" placeholder="Enter state..." class="form-control" id="usr" /><br />
					<c:forEach items="${flowRequestContext.messageContext.getMessagesBySource('state')}" var="err">
					  <div><span>${err.text}</span></div>
					</c:forEach><br />
					<input name="_eventId_submit" type="submit" value="Submit" class="btn btn-success"/><br />
				</sf:form>
				
			</fieldset></center>
		</div>
	</body>
</html>