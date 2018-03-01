package com.imcs.web.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.imcs.hibernate.entity.Customers;
import com.imcs.hibernate.interfaces.CustomerServiceInterface;
import com.imcs.hibernate.services.CustomerServiceImpl;
import com.imcs.web.util.CustomerUtil;
import com.imcs.web.util.LoginUtil;

/**
 * Servlet implementation class CustomerProcess
 */
public class CustomerProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	CustomerServiceInterface customerServiceImpl = null; 
	public void init() throws ServletException {
		customerServiceImpl = new CustomerServiceImpl();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Check if User already logged in or not
		if(!LoginUtil.isUserLoggedIn(request)) {
			HttpSession session = request.getSession(false);
			if(session!=null)
				session.invalidate();
			RequestDispatcher view = request.getRequestDispatcher("view/Login.jsp");
			view.forward(request, response);
		}
		Customers customer = CustomerUtil.processCustomer(request);
		if(customer.getId()==null){
			try {
				//System.out.println("hi");
				if(customerServiceImpl.addCustomer(customer))
					request.setAttribute("message", "Record Inserted.");
				else
					request.setAttribute("message", "Record Not Inserted.");
			} catch (Exception e) {
				request.setAttribute("message", "Error Occured.");
				e.printStackTrace();
			}
		}else{
			try {
				//System.out.println("hi");
				if(customerServiceImpl.updateCustomer(customer))
					request.setAttribute("message", "Record Updated.");
				else
					request.setAttribute("message", "Record Not Updated.");
			} catch (Exception e) {
				request.setAttribute("message", "Error Occured.");
				e.printStackTrace();
			}
		}
	
	
	RequestDispatcher view = request.getRequestDispatcher("view/Success.jsp");
	view.forward(request, response);
	}
	
}
