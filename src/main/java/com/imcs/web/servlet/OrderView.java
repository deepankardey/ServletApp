package com.imcs.web.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.imcs.hibernate.entity.Customers;
import com.imcs.hibernate.entity.OrderProduct;
import com.imcs.hibernate.entity.Orders;
import com.imcs.hibernate.entity.Products;
import com.imcs.hibernate.interfaces.CustomerServiceInterface;
import com.imcs.hibernate.interfaces.OrderServiceInterface;
import com.imcs.hibernate.interfaces.ProductServiceInterface;
import com.imcs.hibernate.services.CustomerServiceImpl;
import com.imcs.hibernate.services.OrderServiceImpl;
import com.imcs.hibernate.services.ProductServiceImpl;
import com.imcs.web.pojo.Customer;
import com.imcs.web.pojo.Product;

/**
 * Servlet implementation class OrderView
 */
public class OrderView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustomerServiceInterface customerService = null;
	ProductServiceInterface productService = null;
	OrderServiceInterface orderService = null;
	
	public void init() {
		customerService = new CustomerServiceImpl();
		productService = new ProductServiceImpl();
		orderService = new OrderServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json = null;
		String type = request.getParameter("type");
		if(type!=null && type.equalsIgnoreCase("customer")) {
			List<Customers> customerList = customerService.loadAllCustomers();
			Customer pojoCustomer = null;
			Set<Customer> customerSet = new HashSet<Customer>();
			for(Customers customer : customerList) {
				pojoCustomer = new Customer();
				pojoCustomer.setId(customer.getId());
				pojoCustomer.setFirstName(customer.getFirstName());
				pojoCustomer.setLastName(customer.getLastName());
				customerSet.add(pojoCustomer);
			}
			json= new Gson().toJson(customerSet);
			response.getWriter().write(json);
		}else {
			List<Products> productList = productService.loadAllProducts();
			Product pojoProduct = null;
			Set<Product> productSet = new HashSet<Product>();
			for(Products product : productList) {
				pojoProduct = new Product();
				pojoProduct.setId(product.getProductID());
				pojoProduct.setName(product.getName());
				pojoProduct.setPrice(product.getPrice());
				productSet.add(pojoProduct);
			}
			json= new Gson().toJson(productSet);
			response.getWriter().write(json);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean added = false;
		String customerId = request.getParameter("customer");
		String[] ProductList = request.getParameterValues("product");
		String[] ProductQuantityList = request.getParameterValues("qty");
		String message = request.getParameter("message");

		SimpleDateFormat sdf = new SimpleDateFormat("mm-dd-yyyy");
		Date invoiceDate = null;
		Date deliveryDate = null;
		Date paymentDueDate = null;

		Customers customer = customerService.loadCustomer(Integer.parseInt(customerId));
		Orders order = new Orders();
		
		try {
			invoiceDate = new Date();
			invoiceDate = sdf.parse(sdf.format(invoiceDate));  
			
			deliveryDate = new Date();
			deliveryDate = new Date(deliveryDate.getTime() + (1000 * 60 * 60 * 24));
			deliveryDate = sdf.parse(sdf.format(deliveryDate));
			
			paymentDueDate = new Date();
			paymentDueDate = new Date(paymentDueDate.getTime() + (1000 * 60 * 60 * 48));
			paymentDueDate = sdf.parse(sdf.format(paymentDueDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		order.setInvoiceCreationDate(invoiceDate);
		order.setDeliveryDueDate(deliveryDate);
		order.setPaymentDueDate(paymentDueDate);
		order.setCustomMessages(message);
		order.setCustomer(customer);
		for(int i=0;i<ProductList.length;i++) {
			Products product = productService.loadProduct(ProductList[i]);
			OrderProduct orderProduct = new OrderProduct();
			orderProduct.setOrders(order);
			orderProduct.setProducts(product);
			orderProduct.setQuantity(Integer.parseInt(ProductQuantityList[i]));
			added = orderService.addOrder(orderProduct);
		}
		if(added) {
			request.setAttribute("message", "Order Created.");
		}else {
			request.setAttribute("message", "Order Not Created.");
		}
		RequestDispatcher view = request.getRequestDispatcher("view/Success.jsp");
		view.forward(request, response);
	}
}
