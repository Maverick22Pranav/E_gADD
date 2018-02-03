<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="header.jsp"%>
<title>Login Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
	background-color: #eeebd9;
	-webkit-font-smoothing: antialiased;
	font: normal 14px Roboto, arial, sans-serif;
}

.container {
	padding: 25px;
	position: fixed;
}

.form-login {
	background-color: #EDEDED;
	padding-top: 10px;
	padding-bottom: 20px;
	padding-left: 20px;
	padding-right: 20px;
	border-radius: 15px;
	border-color: #d2d2d2;
	border-width: 5px;
	box-shadow: 0 1px 0 #cfcfcf;
}

h4 {
	border: 0 solid #fff;
	border-bottom-width: 1px;
	padding-bottom: 10px;
	text-align: center;
}

.form-control {
	border-radius: 10px;
}

.wrapper {
	text-align: center;
}


</style>

</head>
<body background="resources/images/key back.jpg">


	<c:if test="${not empty message}">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<div class="alert alert-info">${message}</div>
			</div>
		</div>
	</c:if>

	<div align="center">
		<h2>LOGIN FORM</h2>
	</div>
	<br>
	<br>
	<br>
<centre>
	<form id="loginform" action="login" method="post">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-5 col-md-3">
					<div class="form-login">
						<h4><em>Welcome to E-gADD</em></h4>
						<input type="text" name="username"
							class="form-control input-sm chat-input" placeholder="username" />
						<br> <input type="password" name="password"
							class="form-control input-sm chat-input" placeholder="password" />
						<br>
						<div class="wrapper">
							<input type="submit" id="btn-login" class="btn btn-success"
								value="submit">
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	</centre>
</body>
</html>

