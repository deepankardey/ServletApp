<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
    <title>IMCS</title>
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
            <li><a href="${pageContext.request.contextPath}/view/ShowCustomer.jsp">Show Customers</a></li>
            <li><a href="${pageContext.request.contextPath}/view/AddCustomer.jsp">Add Customer</a></li>
            <li><a href="${pageContext.request.contextPath}/view/PlaceOrder.jsp">Place Order</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/view/ShowOrders.jsp">Show Orders</a></li>
          </ul>
        </div>
		
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        
	        	<!-- Customer ID -->
	          	<div class="form-group">
				  <label class="col-md-4 control-label">Customer ID</label>  ${order.customer.id}
				</div>
				
				<!-- Customer Name -->
	          	<div class="form-group">
				  <label class="col-md-4 control-label">Customer Name</label>  ${order.customer.firstName}&nbsp;${order.customer.lastName}
				</div>
				
				<!-- Order ID -->
	          	<div class="form-group">
				  <label class="col-md-4 control-label">Order ID</label>  ${order.orderID}
				</div>
				
				<!-- invoiceCreationDate -->
	          	<div class="form-group">
				  <label class="col-md-4 control-label">Invoice Creation Date</label>  ${order.invoiceCreationDate}
				</div>
				
				<!-- deliveryDueDate -->
	          	<div class="form-group">
				  <label class="col-md-4 control-label">Delivery Due Date</label>  ${order.deliveryDueDate}
				</div>
				
				<!-- paymentDueDate -->
	          	<div class="form-group">
				  <label class="col-md-4 control-label">Payment Due Date</label>  ${order.paymentDueDate}
				</div>
				
				<!-- customMessages -->
	          	<div class="form-group">
				  <label class="col-md-4 control-label">Custom Messages</label>  ${order.customMessages}
				</div>
				
		    	<table border=1 id ="listTable" class="listTable table table-striped">
			    	<thead class="table-header">
			            <tr>
			            	<th>Name</th>
			            	<th>Price</th>
			                <th>Quantity</th>
			                <th>Total</th>
			            </tr>
			        </thead>
			        <tbody class="table-body">
			            <c:forEach items="${orderProductList}" var="orderProduct" varStatus="count">
				                <tr style="color:black;">
				                	<td><c:out value="${orderProduct.products.name}" /></td>
				                    <td><c:out value="${orderProduct.products.price} $" /></td>
				                    <td><c:out value="${orderProduct.quantity}" /></td>
				                    <td><c:out value="${orderProduct.quantity*orderProduct.products.price} $" /></td>
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
