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
          	<li class="active"><a href="#">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/view/ShowCustomer.jsp">Show Customers</a></li>
            <li ><a href="${pageContext.request.contextPath}/view/AddCustomer.jsp">Add Customer</a></li>
            <li><a href="${pageContext.request.contextPath}/view/PlaceOrder.jsp">Place Order</a></li>
            <li><a href="${pageContext.request.contextPath}/view/ShowOrders.jsp">Show Order</a></li>
          </ul>
        </div>
      </div>
    </div>

  </body>
  <script >
 
  </script>
</html>
