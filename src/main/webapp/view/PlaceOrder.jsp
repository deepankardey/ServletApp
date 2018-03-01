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
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/holder.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"/></script>

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
          	<li><a href="Home.jsp">Home</a></li>
            <li><a href="ShowCustomer.jsp">Show Customers</a></li>
            <li><a href="AddCustomer.jsp">Add Customer</a></li>
            <li class="active"><a href="PlaceOrder.jsp">Place Order</a></li>
            <li><a href="ShowOrders.jsp">Show Order</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Place Order</h1>
			<div class="container">
		    <form class="well form-horizontal" action="${pageContext.request.contextPath}/OrderView" method="post"  id="contact_form">
			<fieldset>
			
			<!-- Customer Name -->
          	<div class="form-group">
			  <label class="col-md-4 control-label">Customer Name</label>  
				<div class="col-md-4 inputGroupContainer">
				  <div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				  <select name="customer_name" placeholder="Customer Name" class="form-control" id="customerList">
				  </select>
			      </div>
			  </div>
			</div>
			
			<!-- Product Name -->
          	<div class="form-group">
			  <label class="col-md-4 control-label">Product Name</label>  
				<div class="col-md-4 inputGroupContainer">
				  <div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				  <select name="product_name" placeholder="Product Name" class="form-control" id="productList">
				  </select>
			      </div>
			  </div>
			</div>
			
			
			<!--Quantity-->
			<div class="form-group">
			  <label class="col-md-4 control-label" >Quantity</label> 
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			  <input name="quantity" class="form-control"  type="text" id="quantity" value="1">
			    </div>
			  </div>
			</div>
			
			<!-- Custom Message -->
			<div class="form-group">
			  <label class="col-md-4 control-label">Custom Message</label>
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
			        <textarea class="form-control" name="message" placeholder="Custom Message"></textarea>
			  </div>
			  </div>
			</div>
			
			<div style="display: inline-flex;margin-left: 36%;">
				<!-- Cart Button -->
				<div class="form-group">
				  <label class="col-md-4 control-label"></label>
				  <div class="col-md-4">
				    <input type="button" class="btn btn-warning" value="Add to Cart" id="addToCart" >
				  </div>
				</div>
				
				<!-- Submit Button -->
				<div class="form-group">
				  <label class="col-md-4 control-label"></label>
				  <div class="col-md-4">
				    <button type="submit" class="btn btn-warning" >Place Order</span></button>
				  </div>
				</div>
			</div>

			<table class="order-list" style="margin-left: 228px;">
				<thead>
					<tr>
						<td></td>
						<td>Product</td>
						<td>Price</td>
						<td>Quantity</td>
						<td>Total</td>
					</tr>
				</thead>

				<tbody>
				</tbody>
			</table>
			</fieldset>
			</form>
			</div>
        </div>
      </div>
    </div>

  </body>
  <script type="text/javascript">
  	$(document).ready(function(){
  		//alert('');
	    loadCustomerDropDown();
	    loadProductDropDown();
	});
  	
  	function loadCustomerDropDown(){
  		var context = "${pageContext.request.contextPath}";
		var URL = context.concat("/OrderView");
		$.ajax({
        type: "GET",
        url:URL,
        data:{'type':'customer'},
        dataType: "json",
        success:function(responseText){
        	$.each(responseText,function(i,item){
        			$('#customerList').append($("<option></option>").attr("value",item.id).text(item.firstName)); 
				});
			}
     });
	};
	
	function loadProductDropDown(){
		var context = "${pageContext.request.contextPath}";
		var URL = context.concat("/OrderView");
		$.ajax({
        type: "GET",
        url:URL,
        data:{'type':'product'},
        dataType: "json",
        success:function(responseText){
        	$.each(responseText,function(i,item){
        			$('#productList').append($("<option></option>").attr("value",item.name).text(item.name+'-'+item.price+'$')); 
				});
			}
     });
	};
	
	var count = 0;
	$("#addToCart").click(function(){
		  
		var newRow = $("<tr>");
				count++;
		        var cols = "";
		        cols += '<td><input type="hidden" readonly="readonly" name="customer" id="customer'+count+'"/></td>';
		        cols += '<td><input type="text" readonly="readonly" name="product" id="product'+count+'"/></td>';
		        cols += '<td><input type="text" readonly="readonly" name="price" id="price'+count+'"/></td>';
		        cols += '<td><input type="text" readonly="readonly" name="qty" id="qty'+count+'"/></td>';
		        cols += '<td><input type="text" readonly="readonly" name="total" id="total'+count+'"/></td>';
		        newRow.append(cols);
		  $("table.order-list").append(newRow);
		  var customer = $('#customerList').val();
		  var product = $('#productList').val();
		  var qty = $('#quantity').val();
		  var productAndPrice = $("#productList option:selected").text();
		  var price = productAndPrice.split('-')[1].split('$')[0];
		  $('#customer'+count).val(customer);
		  $('#product'+count).val(product);
		  $('#price'+count).val(price);
		  $('#qty'+count).val(qty);
		  $('#total'+count).val(qty*price);
		  $('#customerList').prop("disabled", true);
	});
  
	</script>
</html>
