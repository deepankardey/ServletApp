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
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/holder.min.js"></script>

  </head>
  <style>
	#success_message{ display: none;}
  </style>
  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">IMCS</a>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
          	<li><a href="Home.jsp">Home</a></li>
            <li><a href="ShowCustomer.jsp">Show Customers</a></li>
            <li><a href="AddCustomer.jsp">Add Customer</a></li>
            <li><a href="AddProduct.jsp">Add Product</a></li>
            <li class="active"><a href="Order.jsp">Place Order</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Enter Customer Details</h1>
			<div class="container">
		    <form class="well form-horizontal" action="../FormUpload" method="post"  id="contact_form">
			<fieldset>
			
			<!-- first name -->
          	<div class="form-group">
			  <label class="col-md-4 control-label">Product Name</label>  
				<div class="col-md-4 inputGroupContainer">
				  <div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				  <input  name="product_name" placeholder="Product Name" class="form-control"  type="text">
			      </div>
			  </div>
			</div>
			
			<!-- middle name -->
          	<div class="form-group">
			  <label class="col-md-4 control-label">Customer Name</label>  
				<div class="col-md-4 inputGroupContainer">
				  <div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				  <input  name="customer_name" placeholder="Customer Name" class="form-control"  type="text">
			      </div>
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" >Quantity</label> 
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			  <input name="quantity" placeholder="Quantity" class="form-control"  type="text">
			    </div>
			  </div>
			</div>
			
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label"></label>
			  <div class="col-md-4">
			    <button type="submit" class="btn btn-warning" >Place Order </span></button>
			  </div>
			</div>

			</fieldset>
			</form>
			</div>
        </div>
      </div>
    </div>

  </body>
  <script >
  
  </script>
</html>
