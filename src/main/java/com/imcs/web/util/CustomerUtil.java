package com.imcs.web.util;

import javax.servlet.http.HttpServletRequest;

import com.imcs.hibernate.entity.Address;
import com.imcs.hibernate.entity.Customers;

public class CustomerUtil {
	public static Customers processCustomer(HttpServletRequest request) {
		Customers customer = new Customers();
		Address address = new Address();
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String firstName = request.getParameter("first_name");
		String middleName = request.getParameter("middle_name");
		String lastName = request.getParameter("last_name");
		String suffix = request.getParameter("suffix");
		String email = request.getParameter("email");
		String company = request.getParameter("company");
		String displayName = request.getParameter("display_name");
		String printOnCheck = request.getParameter("print_on_check");
		String billingStreet = request.getParameter("billing_street");
		String billingCity = request.getParameter("billing_city");
		String billingState = request.getParameter("billing_state");
		String billingZip = request.getParameter("billing_zip");
		String billingCountry = request.getParameter("shipping_country");
		String shippingStreet = request.getParameter("shipping_street");
		String shippingCity = request.getParameter("shipping_city");
		String shippingState = request.getParameter("shipping_state");
		String shippingZip = request.getParameter("shipping_zip");
		String shippingCountry = request.getParameter("shipping_country");
		String otherDetails = request.getParameter("other_details");
		if(id!=null)
			customer.setId(Integer.parseInt(id));
		customer.setTitle(title);
		customer.setFirstName(firstName);
		customer.setMiddleName(middleName);
		customer.setLastName(lastName);
		customer.setSuffix(suffix);
		customer.setEmail(email);
		customer.setCompany(company);
		customer.setDisplayName(displayName);
		customer.setPrintOnCheck(printOnCheck);
		customer.setOtherDetails(otherDetails);
		address.setBillingStreet(billingStreet);
		address.setBillingCity(billingCity);
		address.setBillingState(billingState);
		address.setBillingZip(Integer.parseInt(billingZip));
		address.setBillingCountry(billingCountry);
		address.setShippingStreet(shippingStreet);
		address.setShippingCity(shippingCity);
		address.setShippingState(shippingState);
		address.setShippingZip(Integer.parseInt(shippingZip));
		address.setShippingCountry(shippingCountry);
		customer.setAddress(address);
		return customer;
	}
}
