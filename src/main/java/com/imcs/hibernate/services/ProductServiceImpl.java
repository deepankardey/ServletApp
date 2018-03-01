package com.imcs.hibernate.services;

import java.util.List;

import com.imcs.hibernate.dao.ProductDao;
import com.imcs.hibernate.entity.Products;
import com.imcs.hibernate.exception.CustomException;
import com.imcs.hibernate.interfaces.ProductDaoInterface;
import com.imcs.hibernate.interfaces.ProductServiceInterface;

public class ProductServiceImpl implements ProductServiceInterface {
	
	ProductDaoInterface productDao = new ProductDao();

	public List<Products> loadAllProducts() throws CustomException {
		return productDao.loadAllProducts();
	}

	public Products loadProduct(String productName) throws CustomException {
		return productDao.loadProduct(productName);
	}

}
