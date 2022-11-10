package kr.co.purplaying.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.purplaying.domain.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	
	private static final int FAIL = 0;
	@Autowired
	DataSource ds;
	
	@Override
	public UserDto selectUser(String id) {
		UserDto user = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 
		String sql = "select * from t_user where user_id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new UserDto();
				user.setUser_Id(rs.getString(1));
				user.setPwd(rs.getString(2));
				user.setName(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setBirth(new Date(rs.getDate(5).getTime()));
				user.setSns(rs.getString(6));
				user.setReg_date(new Date(rs.getTimestamp(7).getTime()));
			}
		} catch (SQLException e) {
			return null;
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return user;
	}
	
	@Override
	public void deleteAll() throws Exception {
		Connection conn = ds.getConnection();
		String sql = "delete from t_user";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
	}
	
	@Override
	public int insertUser(UserDto user) {
		Connection conn = null;
		PreparedStatement pstmt=null;
		
		String sql = "insert into t_user values(?,?,?,?,?,?, now() )";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUser_Id());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			pstmt.setDate(5, new java.sql.Date(user.getBirth().getTime()));
			pstmt.setString(6, user.getSns());
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			return FAIL;
		}finally {
			close(pstmt,conn);
		}
				
	}
	
	private void close(AutoCloseable...closeables) {
		for(AutoCloseable autoCloseable : closeables) {
			try {
				if(autoCloseable!=null) {
					autoCloseable.close();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public int updateUser(UserDto user) {
		int rowCnt = FAIL;
		String sql = "update t_user " + "set pwd=?, name=?, email=?, birth=?, sns=?, reg_date= ? "+"where id=?";
		
		//try-with-resources
		try(
				Connection conn = ds.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
			pstmt.setString(1, user.getPwd());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getEmail());
			pstmt.setDate(4, new java.sql.Date(user.getBirth().getTime()));
			pstmt.setString(5, user.getSns());
			pstmt.setTimestamp(6, new Timestamp(user.getReg_date().getTime()));
			pstmt.setString(7, user.getUser_Id());
			
			rowCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return FAIL;
		}
		
		
		return rowCnt;
	}
	
	
}//class end
































