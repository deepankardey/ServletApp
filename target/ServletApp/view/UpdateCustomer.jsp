<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Update Customer</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
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
            <li class="active"><a href="AddCustomer.jsp">Add Customer</a></li>
            <li><a href="AddProduct.jsp">Add Product</a></li>
            <li><a href="Order.jsp">Place Order</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Enter Customer Details</h1>
			<div class="container">
		    <form class="well form-horizontal" action="FormUpload" method="post"  id="contact_form">
			<fieldset>
			<c:forEach items="${customerList}" var="user" varStatus="count">
			
			<!-- customer id-->
          	
			<input  name="id" placeholder="First Name" class="form-control"  type="hidden" value="${user.id}">
			
			
			<!-- Title -->
			<div class="form-group"> 
				<label class="col-md-4 control-label">Title</label>
				<div class="col-md-4 selectContainer">
			    	<div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
			    	<select name="title" class="form-control selectpicker" value="${user.title}">
			      		<option value="Mr">Mr</option>
			      		<option value="Mr">Ms</option>
			   		</select>
			  		</div>
				</div>
			</div>
			
			<!-- first name -->
          	<div class="form-group">
			  <label class="col-md-4 control-label">First Name</label>  
				<div class="col-md-4 inputGroupContainer">
				  <div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				  <input  name="first_name" placeholder="First Name" class="form-control"  type="text" value="${user.firstName}">
			      </div>
			  </div>
			</div>
			
			<!-- middle name -->
          	<div class="form-group">
			  <label class="col-md-4 control-label">Middle Name</label>  
				<div class="col-md-4 inputGroupContainer">
				  <div class="input-group">
				  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				  <input  name="middle_name" placeholder="Middle Name" class="form-control"  type="text" value="${user.middleName}">
			      </div>
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label" >Last Name</label> 
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			  <input name="last_name" placeholder="Last Name" class="form-control"  type="text" value="${user.lastName}">
			    </div>
			  </div>
			</div>
			
			<!-- Suffix-->
			<div class="form-group">
			  <label class="col-md-4 control-label" >Suffix</label> 
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			  <input name="suffix" placeholder="Suffix" class="form-control"  type="text" value="${user.suffix}">
			    </div>
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label">E-Mail</label>  
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
			  <input name="email" placeholder="E-Mail Address" class="form-control"  type="text" value="${user.email}">
			    </div>
			  </div>
			</div>
			
			<!-- Company-->
			<div class="form-group">
			  <label class="col-md-4 control-label" >Company</label> 
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			  <input name="company" placeholder="Company" class="form-control"  type="text" value="${user.company}">
			    </div>
			  </div>
			</div>
			
			<!-- Display Name-->
			<div class="form-group">
			  <label class="col-md-4 control-label" >Display Name</label> 
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			  <input name="display_name" placeholder="Display Name" class="form-control"  type="text" value="${user.displayName}">
			    </div>
			  </div>
			</div>
			
			<!-- Print on check as-->
			<div class="form-group">
			  <label class="col-md-4 control-label" >Print on check</label> 
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			  <input name="print_on_check" placeholder="Print on check" class="form-control"  type="text" value="${user.printOnCheck}">
			    </div>
			  </div>
			</div>
			
			<!-- Street-->
			<div class="form-group">
			  <label class="col-md-4 control-label">Billing Street</label>  
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
			  		<input name="billing_street" placeholder="Billing Street" class="form-control" type="text" value="${user.billingStreet}">
			    </div>
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label">Billing City</label>  
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
			  <input name="billing_city" placeholder="Billing city" class="form-control"  type="text" value="${user.billingCity}">
			    </div>
			  </div>
			</div>
			
			<!-- Select Basic -->
			<div class="form-group"> 
			  <label class="col-md-4 control-label">Billing State</label>
			    <div class="col-md-4 selectContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
			        <select name="billing_state" class="form-control selectpicker" value="${user.billingState}">
					      <option value=" " >Please select your state</option>
				      <option value="Alabama">Alabama</option>
				      <option  value="Alabama">Alaska</option>
				      <option  value="Alaska" >Arizona</option>
				      <option  value="Arkansas" >Arkansas</option>
				      <option  value="California" >California</option>
				      <option  value="Colorado" >Colorado</option>
				      <option  value="Connecticut" >Connecticut</option>
				      <option  value="Delaware" >Delaware</option>
				      <option  value="District of Columbia" >District of Columbia</option>
				      <option  value="Florida"> Florida</option>
				      <option  value="Georgia" >Georgia</option>
				      <option  value="Hawaii" >Hawaii</option>
				      <option  value="daho" >daho</option>
				      <option  value="Illinois" >Illinois</option>
				      <option  value="Indiana" >Indiana</option>
				      <option  value="Iowa" >Iowa</option>
				      <option  value="Kansas"> Kansas</option>
				      <option  value="Kentucky" >Kentucky</option>
				      <option  value="Louisiana" >Louisiana</option>
				      <option  value="Maine">Maine</option>
				      <option  value="Maryland" >Maryland</option>
				      <option  value="Mass"> Mass</option>
				      <option  value="Michigan" >Michigan</option>
				      <option  value="Minnesota" >Minnesota</option>
				      <option  value="Mississippi">Mississippi</option>
				      <option  value="Missouri">Missouri</option>
				      <option  value="Montana">Montana</option>
				      <option  value="Nebraska">Nebraska</option>
				      <option  value="Nevada">Nevada</option>
				      <option  value="New Hampshire">New Hampshire</option>
				      <option  value="New Jersey">New Jersey</option>
				      <option  value="New Mexico">New Mexico</option>
				      <option  value="New York">New York</option>
				      <option  value="North Carolina">North Carolina</option>
				      <option  value="North Dakota">North Dakota</option>
				      <option  value="Ohio">Ohio</option>
				      <option  value="Oklahoma">Oklahoma</option>
				      <option  value="Oregon">Oregon</option>
				      <option  value="Pennsylvania">Pennsylvania</option>
				      <option  value="Rhode Island">Rhode Island</option>
				      <option  value="South Carolina">South Carolina</option>
				      <option  value="South Dakota">South Dakota</option>
				      <option  value="Tennessee">Tennessee</option>
				      <option  value="Texas">Texas</option>
				      <option  value="Uttah"> Uttah</option>
				      <option  value="Vermont">Vermont</option>
				      <option  value="Virginia">Virginia</option>
				      <option  value="Washington" >Washington</option>
				      <option  value="West Virginia" >West Virginia</option>
				      <option  value="Wisconsin">Wisconsin</option>
				      <option  value="Wyoming" >Wyoming</option>
			    </select>
			  </div>
			</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label">Billing Zip</label>  
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
			  <input name="billing_zip" placeholder="Zip Code" class="form-control"  type="text" value="${user.billingZip}">
			    </div>
			</div>
			</div>
			
			<!-- Country-->
			<div class="form-group">
			  <label class="col-md-4 control-label">Billing Country</label>  
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
			  <input name="billing_country" placeholder="Billing Country" class="form-control"  type="text" value="${user.billingCountry}">
			    </div>
			  </div>
			</div>
			
			<!-- Street-->
			<div class="form-group">
			  <label class="col-md-4 control-label">Shipping Street</label>  
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
			  		<input name="shipping_street" placeholder="Shipping Street" class="form-control" type="text" value="${user.shippingStreet}">
			    </div>
			  </div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label">Shipping City</label>  
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
			  <input name="shipping_city" placeholder="Shipping city" class="form-control"  type="text" value="${user.shippingCity}">
			    </div>
			  </div>
			</div>
			
			<!-- Select Basic -->
			<div class="form-group"> 
			  <label class="col-md-4 control-label">Shipping State</label>
			    <div class="col-md-4 selectContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
			        <select name="shipping_state" class="form-control selectpicker" value="${user.shippingState}">
					      <option value=" " >Please select your state</option>
				      <option value="Alabama">Alabama</option>
				      <option  value="Alabama">Alaska</option>
				      <option  value="Alaska" >Arizona</option>
				      <option  value="Arkansas" >Arkansas</option>
				      <option  value="California" >California</option>
				      <option  value="Colorado" >Colorado</option>
				      <option  value="Connecticut" >Connecticut</option>
				      <option  value="Delaware" >Delaware</option>
				      <option  value="District of Columbia" >District of Columbia</option>
				      <option  value="Florida"> Florida</option>
				      <option  value="Georgia" >Georgia</option>
				      <option  value="Hawaii" >Hawaii</option>
				      <option  value="daho" >daho</option>
				      <option  value="Illinois" >Illinois</option>
				      <option  value="Indiana" >Indiana</option>
				      <option  value="Iowa" >Iowa</option>
				      <option  value="Kansas"> Kansas</option>
				      <option  value="Kentucky" >Kentucky</option>
				      <option  value="Louisiana" >Louisiana</option>
				      <option  value="Maine">Maine</option>
				      <option  value="Maryland" >Maryland</option>
				      <option  value="Mass"> Mass</option>
				      <option  value="Michigan" >Michigan</option>
				      <option  value="Minnesota" >Minnesota</option>
				      <option  value="Mississippi">Mississippi</option>
				      <option  value="Missouri">Missouri</option>
				      <option  value="Montana">Montana</option>
				      <option  value="Nebraska">Nebraska</option>
				      <option  value="Nevada">Nevada</option>
				      <option  value="New Hampshire">New Hampshire</option>
				      <option  value="New Jersey">New Jersey</option>
				      <option  value="New Mexico">New Mexico</option>
				      <option  value="New York">New York</option>
				      <option  value="North Carolina">North Carolina</option>
				      <option  value="North Dakota">North Dakota</option>
				      <option  value="Ohio">Ohio</option>
				      <option  value="Oklahoma">Oklahoma</option>
				      <option  value="Oregon">Oregon</option>
				      <option  value="Pennsylvania">Pennsylvania</option>
				      <option  value="Rhode Island">Rhode Island</option>
				      <option  value="South Carolina">South Carolina</option>
				      <option  value="South Dakota">South Dakota</option>
				      <option  value="Tennessee">Tennessee</option>
				      <option  value="Texas">Texas</option>
				      <option  value="Uttah"> Uttah</option>
				      <option  value="Vermont">Vermont</option>
				      <option  value="Virginia">Virginia</option>
				      <option  value="Washington" >Washington</option>
				      <option  value="West Virginia" >West Virginia</option>
				      <option  value="Wisconsin">Wisconsin</option>
				      <option  value="Wyoming" >Wyoming</option>
			    </select>
			  </div>
			</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
			  <label class="col-md-4 control-label">Shipping Zip</label>  
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
			  <input name="shipping_zip" placeholder="Zip Code" class="form-control"  type="text" value="${user.shippingZip}">
			    </div>
			</div>
			</div>
			
			<!-- Country-->
			<div class="form-group">
			  <label class="col-md-4 control-label">Shipping Country</label>  
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
			  <input name="shipping_country" placeholder="Shipping Country" class="form-control"  type="text" value="${user.shippingCountry}">
			    </div>
			  </div>
			</div>
			
			<!-- Other Details -->
  
			<div class="form-group">
			  <label class="col-md-4 control-label">Other Details</label>
			    <div class="col-md-4 inputGroupContainer">
			    <div class="input-group">
			        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
			        	<textarea class="form-control" name="other_details" placeholder="Other Details" value="${user.otherDetails}"></textarea>
			  </div>
			  </div>
			</div>
			
			<!-- Button -->
			<div class="form-group">
			  <label class="col-md-4 control-label"></label>
			  <div class="col-md-4">
			    <button type="submit" class="btn btn-warning" >Save </span></button>
			  </div>
			</div>
			</c:forEach>
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
