package com.imcs.hibernate.interfaces;

import java.util.List;

import com.imcs.hibernate.entity.Products;

import trng.imcs.hib.excp.CustomException;

public interface ProductServiceInterface {
	public List<Products> loadAllProducts()throws CustomException;
}
