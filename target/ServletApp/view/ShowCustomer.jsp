<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>IMCS Week 1</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/dashboard.css" >
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/dashboard.css" >
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/holder.min.js"></script>

  </head>
  <style>
	#success_message{ display: none;}
  </style>
  <body>

    <jsp:include page="Header.jsp" />

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
          	<li><a href="${pageContext.request.contextPath}/view/Home.jsp">Home</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/view/ShowCustomer.jsp">Show Customers</a></li>
            <li ><a href="${pageContext.request.contextPath}/view/AddCustomer.jsp">Add Customer</a></li>
            <li><a href="${pageContext.request.contextPath}/view/PlaceOrder.jsp">Place Order</a></li>
            <li><a href="${pageContext.request.contextPath}/view/ShowOrders.jsp">Show Order</a></li>
          </ul>
        </div>
        
        <!-- Text input-->
        <form class="well form-horizontal" action="${pageContext.request.contextPath}/CustomerLookUp" method="get"  id="contact_form">
		    <div class="input-group" style="margin-left: 75%;display: inline-flex;">
		  		<input name="customer_id" placeholder="Customer ID" class="form-control"  type="text">
		  		<button type="submit" class="btn btn-warning" >Search </span></button>
		    </div>
	    </form>
		
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		    	<table border=1 id ="listTable" class="listTable table table-striped">
			    	<thead class="table-header">
			            <tr>
			            	<th>ID</th>
			            	<th>First Name</th>
			            	<th>Middle Name</th>
			            	<th>Last Name</th>
			            	<th>Email</th>
			                <th>Company</th>
			            </tr>
			        </thead>
			        <tbody class="table-body">
			            <c:forEach items="${customerList}" var="user" varStatus="count">
				                <tr style="color:black;">
				                	<td><a href="${pageContext.request.contextPath}/CustomerLookUp?id=${user.id}&showFullDetails=true"><c:out value="${user.id}" /></a></td>
				                	<td><c:out value="${user.firstName}" /></td>
				                	<td><c:out value="${user.middleName}" /></td>
				                	<td><c:out value="${user.lastName}" /></td>
				                    <td><c:out value="${user.email}" /></td>
				                    <td><c:out value="${user.company}" /></td>
				                </tr>
			            </c:forEach>
			        </tbody>
			    </table>
		    </div>
        
        
      </div>
    </div>

  </body>
  <script >
 
  </script>
</html>
