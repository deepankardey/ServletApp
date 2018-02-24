package com.imcs.web.servlet;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imcs.hibernate.entity.Customers;
import com.imcs.hibernate.interfaces.CustomerServiceInterface;
import com.imcs.hibernate.interfaces.OrderServiceInterface;
import com.imcs.hibernate.services.CustomerServiceImpl;
import com.imcs.hibernate.services.OrderServiceImpl;
import com.imcs.web.util.CustomerUtil;

/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/FileUpload")
public class FormUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*CustomerServiceInterface customerServiceImpl = null; 
	OrderServiceInterface orderServiceImpl = null; */
	public void init() throws ServletException {
		/*customerServiceImpl = new CustomerServiceImpl();
		orderServiceImpl = new OrderServiceImpl();*/
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			Customers customer = CustomerUtil.processCustomer(request);
			/*if(customer.getId()==null){
				try {
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
					if(customerServiceImpl.updateCustomer(customer))
						request.setAttribute("message", "Record Updated.");
					else
						request.setAttribute("message", "Record Not Updated.");
				} catch (Exception e) {
					request.setAttribute("message", "Error Occured.");
					e.printStackTrace();
				}
			}*/
		
		
		RequestDispatcher view = request.getRequestDispatcher("view/Success.jsp");
		view.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String id = request.getParameter("id");*/
		/*if(id == null){
			ArrayList<Customer> list = dao.getAllCustomer();
			request.setAttribute("customerList", list);
			RequestDispatcher view = request.getRequestDispatcher("view/ShowCustomer.jsp");
			view.forward(request, response);
		}else{
			ArrayList<Customer> list = dao.getCustomer(Integer.parseInt(id));
			request.setAttribute("customerList", list);
			RequestDispatcher view = request.getRequestDispatcher("view/UpdateCustomer.jsp");
			view.forward(request, response);
		}*/
	}
	
	

}