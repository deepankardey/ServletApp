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
import com.imcs.web.util.LoginUtil;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustomerServiceInterface service = null;
	public void init() {
		service = new CustomerServiceImpl();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//If Not Logged In before then 
		String userName = request.getParameter("user");
		String password = request.getParameter("pass");
		Customers customer = service.validateCustomer(userName,password);
		System.out.println("loged in custoemr "+customer);
		if(customer!=null) {
			HttpSession userSession = request.getSession();
			userSession.setAttribute("userInfo",customer);
			validUser(request, response);
		}else {
			request.setAttribute("message", "Invalid Username/Password. Please try again.");
			invalidUser(request, response);
		}
	}
	
	private void validUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("view/Home.jsp");
		view.forward(request, response);
	}
	
	private void invalidUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("view/Login.jsp");
		view.include(request, response);
	} 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Check if User already logged in or not
		if(LoginUtil.isUserLoggedIn(request))
			validUser(request, response);
		else
			invalidUser(request, response);
	}

}
