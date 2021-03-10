package com.dao;

import java.sql.SQLException;
import java.util.List;

import com.model.Product;

public interface ProductDao {
	
	void insertProduct(Product product) throws SQLException;

	Product selectProduct(long productId);

	List<Product> selectAllProducts();

	boolean deleteProduct(int id) throws SQLException;

	boolean updateProduct(Product product) throws SQLException;

}
