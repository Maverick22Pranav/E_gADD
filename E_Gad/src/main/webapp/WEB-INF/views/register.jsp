<%@taglib prefix="af" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Registeration</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
    function Validate() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("cpassword").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
<style>
.col-sm-10
{
color:darkgreen ;
font-family:sans-serif;
}
.col-sm-2
{
color:black;
font-family:Georgia;
}
h2
{
color:crimson;
font-family:Georgia;
}
</style>


</head>
<body >
<%@include file="header.jsp" %>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<div class="container">
  <h2>REGISTRATION FORM</h2>
  <c:set value="${pageContext.request.contextPath}" var="context"></c:set>
  <af:form class="form-horizontal" action="${context}/address" modelAttribute="user">
  <af:hidden path="id" />
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Name:</label>
      <div class="col-sm-10">
        <af:input type="text" class="form-control" id="name" placeholder="Enter name" path="username"/>
        <af:errors path="username"/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="dob">DOB:</label>
      <div class="col-sm-10">
        <af:input type="text" class="form-control" id="dob" placeholder="Enter dob" path="dob"/>
      <af:errors path="dob"/>      
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">E-mail:</label>
      <div class="col-sm-10">
        <af:input type="email" class="form-control" id="email" placeholder="Enter email" path="email"/> 
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="enterpassword">Enter Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="password" placeholder="Enter password" />
</div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="cpassword">Confirm Password:</label>
      <div class="col-sm-10">          
        <af:input type="password" class="form-control" id="cpassword" placeholder="Confirm password" path="password"/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="dob">Contact number:</label>
      <div class="col-sm-10">
        <af:input type="text" class="form-control" id="number" placeholder="Enter number" path="contact"/>
      <af:errors path="contact"/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="gender">Gender:</label>
      <div class="col-sm-10">          
        <af:input type="text" class="form-control" id="gender" placeholder="Enter gender" path="gender"/>
      </div>
    </div>
     <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-danger" id="btnsubmit" onclick="return Validate()">Address</button>
      </div>
    </div> 
  </af:form>
</div>

</body>
</html>


