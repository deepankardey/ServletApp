package com.imcs.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imcs.hibernate.entity.Customers;
import com.imcs.hibernate.interfaces.CustomerServiceInterface;
import com.imcs.hibernate.services.CustomerServiceImpl;
import com.imcs.web.util.CustomerUtil;

/**
 * Servlet implementation class RegisterUser
 */
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustomerServiceInterface customerServiceImpl = null; 
	
	public void init() {
		customerServiceImpl = new CustomerServiceImpl();
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customers customer = CustomerUtil.processCustomer(request);
		try {
			if(customerServiceImpl.addCustomer(customer))
				request.setAttribute("message", "Registration Successful. Please use First and Last Name as your Username and Password respectively." );
			else
				request.setAttribute("message", "Registration Failed.");
		} catch (Exception e) {
			request.setAttribute("message", "Error Occured.");
			e.printStackTrace();
		}
		RequestDispatcher view = request.getRequestDispatcher("view/Login.jsp");
		view.forward(request, response);
	}

}
