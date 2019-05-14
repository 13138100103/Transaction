package cc.product.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cc.product.dao.CartDAO;
import cc.product.dao.DataBaseUtils;
import cc.product.dao.domain.Product;

public class CartDAOImpl implements CartDAO {
	
	public void addproduct(Product pro,String user) {
		String sql = "insert into cart(name,p_name,p_price,p_picture) values(?,?,?,?)";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user);
			pstmt.setString(2, pro.getP_name());
			pstmt.setDouble(3, pro.getPrice());
			pstmt.setString(4, pro.getP_picture());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
		
	}

	public List<Product> querycart(String user) {
		String sql = "select * from cart where name=?";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Product> ProductList= null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user);
			rs = pstmt.executeQuery();
			ProductList=new ArrayList<Product>();
				
			while (rs.next()) {
				Product Product = new Product();
				Product.setP_soler(rs.getString("name"));
				Product.setP_name(rs.getString("p_name"));
				Product.setPrice(rs.getDouble("p_price"));
				Product.setP_picture(rs.getString("p_picture"));
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

}
