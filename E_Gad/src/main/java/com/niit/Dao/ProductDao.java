package com.niit.Dao;

import java.util.List;

import com.niit.pojo.Product;

public interface ProductDao 
{
	public void addProduct(Product product);
	public Product getProductById(int id);
	public List <Product>getAllProduct();
	public void delete(int id);

}


