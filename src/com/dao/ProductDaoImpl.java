package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.model.Product;
import com.utils.JDBCUtils;

public class ProductDaoImpl implements ProductDao {
	
	private static final String INSERT_PRODUCTS_SQL = "INSERT INTO products"
			+ "  (name, type, price, quantity, target_date) VALUES " + " (?, ?, ?, ?, ?);";

	private static final String SELECT_PRODUCT_BY_ID = "select id, name, type, price, quantity, target_date from products where id =?";
	private static final String SELECT_ALL_PRODUCTS = "select * from products";
	private static final String DELETE_PRODUCT_BY_ID = "delete from products where id = ?;";
	private static final String UPDATE_PRODUCT = "update products set name = ?, type= ?, price =?, quantity =?, target_date =? where id = ?;";

	public ProductDaoImpl() {
	}

	@Override
	public void insertProduct(Product product) throws SQLException {
		System.out.println(INSERT_PRODUCTS_SQL);
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCTS_SQL)) {
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getType());
			preparedStatement.setInt(3, product.getPrice());
			preparedStatement.setInt(4, product.getQuantity());
			preparedStatement.setDate(5, JDBCUtils.getSQLDate(product.getTargetDate()));
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
	}

	@Override
	public Product selectProduct(long productId) {
		Product product = null;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);) {
			preparedStatement.setLong(1, productId);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				String type = rs.getString("type");
				int price = rs.getInt("price");
				int quantity = rs.getInt("quantity");
				LocalDate targetDate = rs.getDate("target_date").toLocalDate();
				product = new Product(id, name, type, price, quantity, targetDate);
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return product;
	}

	@Override
	public List<Product> selectAllProducts() {

		List<Product> products = new ArrayList<>();

		try (Connection connection = JDBCUtils.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				long id = rs.getLong("id");
				String name = rs.getString("name");
				String type = rs.getString("type");
				int price = rs.getInt("price");
				int quantity = rs.getInt("quantity");
				LocalDate targetDate = rs.getDate("target_date").toLocalDate();
				products.add(new Product(id, name, type, price, quantity, targetDate));
			}
		} catch (SQLException exception) {
			JDBCUtils.printSQLException(exception);
		}
		return products;
	}

	@Override
	public boolean deleteProduct(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateProduct(Product product) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT);) {
			statement.setString(1, product.getName());
			statement.setString(2, product.getType());
			statement.setInt(3, product.getPrice());
			statement.setInt(4, product.getQuantity());
			statement.setDate(5, JDBCUtils.getSQLDate(product.getTargetDate()));
			statement.setLong(6, product.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

}
