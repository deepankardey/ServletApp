package com.imcs.hibernate.services;

import java.util.List;

import com.imcs.hibernate.dao.OrderDao;
import com.imcs.hibernate.entity.Customers;
import com.imcs.hibernate.entity.OrderProduct;
import com.imcs.hibernate.entity.Orders;
import com.imcs.hibernate.exception.CustomException;
import com.imcs.hibernate.interfaces.OrderDaoInterface;
import com.imcs.hibernate.interfaces.OrderServiceInterface;

public class OrderServiceImpl implements OrderServiceInterface {
	
	OrderDaoInterface orderDao = new OrderDao();

	public boolean addOrder(OrderProduct orderProduct) throws CustomException {
		return orderDao.addOrder(orderProduct);
	}

	public Orders loadOrder(int id) throws CustomException {
		return orderDao.loadOrder(id);
	}

	public boolean updateOrder(Orders order) throws CustomException {
		return orderDao.updateOrder(order);
	}

	public boolean deleteOrder(int id) throws CustomException {
		return orderDao.deleteOrder(id);
	}

	public List<Orders> loadAllOrders() throws CustomException {
		return orderDao.loadAllOrders();
	}

	public List<Customers> loadOrdersByCustomerId(Customers customer) throws CustomException {
		return orderDao.loadOrdersByCustomerId(customer);
	}
	

}
