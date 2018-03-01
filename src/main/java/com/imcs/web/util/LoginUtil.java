package com.imcs.web.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.imcs.hibernate.entity.Customers;

public class LoginUtil {
	public static boolean isUserLoggedIn(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Customers customer = (Customers)session.getAttribute("userInfo");
		if(customer!=null)
			return true;
		else
			return false;
	}
}
