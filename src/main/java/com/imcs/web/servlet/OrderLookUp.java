package com.imcs.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.imcs.hibernate.entity.OrderProduct;
import com.imcs.hibernate.entity.Orders;
import com.imcs.hibernate.interfaces.OrderServiceInterface;
import com.imcs.hibernate.services.OrderServiceImpl;
import com.imcs.web.util.LoginUtil;

/**
 * Servlet implementation class OrderLookUp
 */
public class OrderLookUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	OrderServiceInterface orderService = null;
	public void init() {
		orderService = new OrderServiceImpl();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Orders> orderList = null;
		Orders order = null;
		//Check if User already logged in or not
		if(!LoginUtil.isUserLoggedIn(request)) {
			HttpSession session = request.getSession(false);
			if(session!=null)
				session.invalidate();
			RequestDispatcher view = request.getRequestDispatcher("view/Login.jsp");
			view.forward(request, response);
		}
				
		String showFullDetails = request.getParameter("showFullDetails");
		if(showFullDetails!=null && showFullDetails.equalsIgnoreCase("true")) {
			String orderId = request.getParameter("id");
			if(orderId!=null && !orderId.equalsIgnoreCase("")) {
				order = orderService.loadOrder(Integer.parseInt(orderId));
				Set<OrderProduct> orderProduct = order.getOrderProducts();
				System.out.println(orderProduct);
				/*orderList = new ArrayList<Orders>();
				orderList.add(order);*/
				request.setAttribute("order", order);
				request.setAttribute("orderProductList", orderProduct);
				RequestDispatcher view = request.getRequestDispatcher("view/OrderDetails.jsp");
				view.forward(request, response);
			}
		}else {
			String orderId = request.getParameter("orderId");
			if(orderId!=null && !orderId.equalsIgnoreCase("")) {
				order = orderService.loadOrder(Integer.parseInt(orderId));
				orderList = new ArrayList<Orders>();
				orderList.add(order);
				request.setAttribute("orderList", orderList);
			}
			else {
				orderList = orderService.loadAllOrders();
				request.setAttribute("orderList", orderList);
			}
			RequestDispatcher view = request.getRequestDispatcher("view/ShowOrders.jsp");
			view.forward(request, response);
			
		}
	}

}
