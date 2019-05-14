package cc.product.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cc.product.dao.DataBaseUtils;
import cc.product.dao.UserDAO;
import cc.product.dao.domain.Account;




public class UserDAOImpl implements UserDAO {

	public void saveUser(Account act) {
		String sql = "insert into account(name,password,email) values(?,?,?)";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, act.getName());
			pstmt.setString(2, act.getPassword());
			pstmt.setString(3, act.getEmail());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
		
	}

	public boolean findUser (String username, String pwd) {

		String sql = "select * from account where name=? and password=?";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean T=false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				T=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(rs);
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
		return T;
	}

	public boolean checkUser(String username) {
		String sql = "select * from account where name=?";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean flag=true;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			DataBaseUtils.close(rs);
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
			return flag;
	}

	
	public List<Account> AllUser() {
		String sql = "select * from account";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Account> AccountList= null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			AccountList=new ArrayList<Account>();
				
			while (rs.next()) {
				Account Account = new Account();
				Account.setId(rs.getInt("id"));
				Account.setAddress(rs.getString("address"));
				Account.setName(rs.getString("name"));
				Account.setPhone(rs.getString("phone"));
				Account.setSex(rs.getString("sex"));
				Account.setEmail(rs.getString("email"));
				AccountList.add(Account);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(rs);
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
		return AccountList;
	}

	public void deleteById(String id) {
		String sql = "delete from account where id =?";
		Connection conn = DataBaseUtils.getConnection();
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DataBaseUtils.close(pstmt);
			DataBaseUtils.close(conn);

		}
	
		
	}
}
