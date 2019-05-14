package cc.product.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cc.product.dao.DataBaseUtils;
import cc.product.dao.ProductDAO;
import cc.product.dao.domain.Product;

public class ProductDAOImpl implements ProductDAO{

	public List<Product> queryAll() {
		String sql = "select * from product";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Product> ProductList= null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ProductList=new ArrayList<Product>();
				
			while (rs.next()) {
				Product Product = new Product();
				Product.setP_id(rs.getInt("p_id"));
				Product.setP_name(rs.getString("p_name"));
				Product.setPrice(rs.getDouble("p_price"));
				Product.setCategory(rs.getString("p_category"));
				Product.setP_description(rs.getString("p_description"));
				Product.setP_soler(rs.getString("p_soler"));
				Product.setHas_sold(rs.getInt("has_sold"));
				Product.setP_picture(rs.getString("p_picture"));
				Product.setP_hits(rs.getInt("p_hits"));
				ProductList.add(Product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(rs);
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
		return ProductList;
	}

	
	public List<Product> ProNotSold() {
		String sql = "select * from product where has_sold=?";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Product> ProductList= null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "0");
			rs = pstmt.executeQuery();
			ProductList=new ArrayList<Product>();
				
			while (rs.next()) {
				Product Product = new Product();
				Product.setP_id(rs.getInt("p_id"));
				Product.setP_name(rs.getString("p_name"));
				Product.setPrice(rs.getDouble("p_price"));
				Product.setCategory(rs.getString("p_category"));
				Product.setP_description(rs.getString("p_description"));
				Product.setP_soler(rs.getString("p_soler"));
				Product.setHas_sold(rs.getInt("has_sold"));
				Product.setP_picture(rs.getString("p_picture"));
				Product.setP_hits(rs.getInt("p_hits"));
				ProductList.add(Product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(rs);
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
		return ProductList;
	}

	public List<Product> ProHits() {
		String sql = "select * from product order by p_hits desc";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Product> ProductList= null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ProductList=new ArrayList<Product>();
				
			while (rs.next()) {
				Product Product = new Product();
				Product.setP_id(rs.getInt("p_id"));
				Product.setP_name(rs.getString("p_name"));
				Product.setPrice(rs.getDouble("p_price"));
				Product.setCategory(rs.getString("p_category"));
				Product.setP_description(rs.getString("p_description"));
				Product.setP_soler(rs.getString("p_soler"));
				Product.setHas_sold(rs.getInt("has_sold"));
				Product.setP_picture(rs.getString("p_picture"));
				Product.setP_hits(rs.getInt("p_hits"));
				ProductList.add(Product);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(rs);
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
		return ProductList;
	}

	public List<Product> querybycategory(String category) {
		String sql = "select * from product where p_category=? order by p_hits desc";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Product> ProductList= null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			ProductList=new ArrayList<Product>();
				
			while (rs.next()) {
				Product Product = new Product();
				Product.setP_id(rs.getInt("p_id"));
				Product.setP_name(rs.getString("p_name"));
				Product.setPrice(rs.getDouble("p_price"));
				Product.setCategory(rs.getString("p_category"));
				Product.setP_description(rs.getString("p_description"));
				Product.setP_soler(rs.getString("p_soler"));
				Product.setHas_sold(rs.getInt("has_sold"));
				Product.setP_picture(rs.getString("p_picture"));
				Product.setP_hits(rs.getInt("p_hits"));
				ProductList.add(Product);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(rs);
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
		return ProductList;
	}


	public Product proHits(String category) {
		String sql = "select * from product where p_category=? order by p_hits desc limit 1";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Product Product=new Product();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				Product.setP_id(rs.getInt("p_id"));
				Product.setP_name(rs.getString("p_name"));
				Product.setPrice(rs.getDouble("p_price"));
				Product.setCategory(rs.getString("p_category"));
				Product.setP_description(rs.getString("p_description"));
				Product.setP_soler(rs.getString("p_soler"));
				Product.setHas_sold(rs.getInt("has_sold"));
				Product.setP_picture(rs.getString("p_picture"));
				Product.setP_hits(rs.getInt("p_hits"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(rs);
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
		return Product;
	}

	public Product querybyid(String id) {
		String sql = "select * from product where p_id=?";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Product Product=new Product();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				Product.setP_id(rs.getInt("p_id"));
				Product.setP_name(rs.getString("p_name"));
				Product.setPrice(rs.getDouble("p_price"));
				Product.setCategory(rs.getString("p_category"));
				Product.setP_description(rs.getString("p_description"));
				Product.setP_soler(rs.getString("p_soler"));
				Product.setHas_sold(rs.getInt("has_sold"));
				Product.setP_picture(rs.getString("p_picture"));
				Product.setP_hits(rs.getInt("p_hits"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(rs);
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
		return Product;
	}


	public void deletebyid(String p_id) {
		String sql = "delete from product where p_id =?";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_id);
			pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
	
	}
}
