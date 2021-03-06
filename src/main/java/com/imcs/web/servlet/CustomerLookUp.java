package com.imcs.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imcs.hibernate.entity.Customers;
import com.imcs.hibernate.interfaces.CustomerServiceInterface;
import com.imcs.hibernate.services.CustomerServiceImpl;

/**
 * Servlet implementation class CustomerLookUp
 */
public class CustomerLookUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustomerServiceInterface customerService = null;
	public void init() {
		customerService = new CustomerServiceImpl();
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customers customer = null;
		List<Customers> custList = null;
		String customerId = request.getParameter("customer_id");
		if(customerId!=null && !customerId.equalsIgnoreCase("")) {
			customer = customerService.loadCustomer(Integer.parseInt(customerId));
			custList = new ArrayList<Customers>();
			custList.add(customer);
			request.setAttribute("customerList", custList);
		}
		else {
			custList = customerService.loadAllCustomers();
			request.setAttribute("customerList", custList);
			
		}
		RequestDispatcher view = request.getRequestDispatcher("view/ShowCustomer.jsp");
		view.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Customers> custList = null;
		Customers customer = null;
		String customerId = request.getParameter("id");
		if(customerId!=null && !customerId.equalsIgnoreCase("")) {
			customer = customerService.loadCustomer(Integer.parseInt(customerId));
			custList = new ArrayList<Customers>();
			custList.add(customer);
			request.setAttribute("customerList", custList);
			RequestDispatcher view = request.getRequestDispatcher("view/UpdateCustomer.jsp");
			view.forward(request, response);
		}
	}

}
