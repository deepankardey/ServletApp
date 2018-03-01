<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div>
          <a class="navbar-brand" href="#">IMCS</a>
      	  <a style="float: right">Welcome, ${sessionScope.userInfo.firstName}</a> 
        </div>
      </div>
          <a style="float: right" href="${pageContext.request.contextPath}/LogOut">Log Out&nbsp;&nbsp;&nbsp;</a>
    </nav>
</body>
</html>