package com.imcs.hibernate.interfaces;

import java.util.List;

import com.imcs.hibernate.entity.Products;
import com.imcs.hibernate.exception.CustomException;

public interface ProductServiceInterface {
	public List<Products> loadAllProducts()throws CustomException;
	public Products loadProduct(String productName)throws CustomException;
}
