package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import image.ImageVO;
import msg.MsgVO;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbId,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int login(String userId, String userPassword) {
		String SQL = "select userPassword from user where userId=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1;
				else
					return 0;
			}
			return -1; //아이디가없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(User user) {
		String SQL="insert into user value(?,?,?,?)";
	
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserNickname());
			pstmt.setString(4, user.getUserPhone());
			return pstmt.executeUpdate();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public User info(User user) {
		String SQL="select * from user where userId=?";

		try {
			pstmt=conn.prepareStatement(SQL);
			System.out.print(user.getUserId());
			pstmt.setString(1, user.getUserId());
			ResultSet rs = null;
			
	
			rs= pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					user.setUserNickname(rs.getString("userNickname"));
					user.setUserPhone(rs.getString("userPhoner"));
				}
			}
			
			return user;
		}
		catch(Exception e){
			e.printStackTrace();
			return user;
		}	
	}
	public void nick_c(User user) {
		String SQL="update user set userNickname = ? where userId=?";

		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserNickname());
			pstmt.setString(2, user.getUserId());
			pstmt.executeUpdate();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}	
	}
	
	public void pw_c(User user) {
		String SQL="update user set userPassword = ? where userId=?";

		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserId());
			pstmt.executeUpdate();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}	
	}
	
	public void ph_c(User user) {
		String SQL="update user set userPhoner = ? where userId=?";

		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPhone());
			pstmt.setString(2, user.getUserId());
			pstmt.executeUpdate();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}	
	}
	
	public void u_c(User user) {
		String SQL="delete from user where userId = ?";

		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.executeUpdate();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}	
	}
}
