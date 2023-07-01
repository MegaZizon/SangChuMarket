package msg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class MsgDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public List<MsgVO> msgList(MsgVO vo) throws Exception{
		List<MsgVO> list = null;
		try {
			int i=0;
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			String sql="select * "+
					"from msg "+
					"WHERE (senderId = ? AND reciverId = ?) OR (senderId = ? AND reciverId = ?) order by no asc";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getSenderId());
			pstmt.setString(2, vo.getReciverId());
			pstmt.setString(3, vo.getReciverId());
			pstmt.setString(4, vo.getSenderId());
			
			rs=pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					if(list ==null ) {
							list=new ArrayList<MsgVO>();
					}
					MsgVO voo = new MsgVO();
					voo.setNo(rs.getInt("no"));
					voo.setIsRead(rs.getInt("isRead"));
					voo.setContent(rs.getString("content"));
					voo.setSenderId(rs.getString("senderId"));
					voo.setReciverId(rs.getString("reciverId"));
					voo.setContent(rs.getString("content"));

					list.add(voo);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertMsg(MsgVO vo) {
		String SQL="insert into msg(senderId,reciverId ,content) value(?,?,?)";
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			pstmt=con.prepareStatement(SQL);
			pstmt.setString(1, vo.getSenderId());
			pstmt.setString(2, vo.getReciverId());
			pstmt.setString(3, vo.getContent());
			
			System.out.printf(vo.getContent());
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public List<MsgVO> msgList2(MsgVO vo) throws Exception{
		List<MsgVO> list = null;
		try {
			int i=0;
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			String sql="select * "+
					"from msg "+
					"WHERE (senderId = ? ) OR (reciverId = ?) order by no desc";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getSenderId());
			pstmt.setString(2, vo.getSenderId());
			
			rs=pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					if(list ==null ) {
							list=new ArrayList<MsgVO>();
					}
					
					MsgVO voo = new MsgVO();
					voo.setNo(rs.getInt("no"));
					voo.setIsRead(rs.getInt("isRead"));
					voo.setContent(rs.getString("content"));
					voo.setSenderId(rs.getString("senderId"));
					voo.setReciverId(rs.getString("reciverId"));
					voo.setContent(rs.getString("content"));
					list.add(voo);
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public List<MsgVO> msgList3(List<MsgVO> s){
		ArrayList<String> temp = new ArrayList<String>();
		List<MsgVO> list2 = null;
		list2=new ArrayList<MsgVO>();
		int i=0,j=1;
		
	    for(MsgVO vooo:s) {// 중복 요소가 없는 경우 요소를 추가

	        if(  !(temp.contains(vooo.getReciverId())) ) {
	        		i=vooo.getNo();
		        	temp.add(vooo.getReciverId());
		    	    System.out.println(vooo.getReciverId());
		    	    list2.add(vooo);
	        }
	        
	        if(  (!temp.contains(vooo.getSenderId() ) ) ) {
	        		j=vooo.getNo();
	        		if(i==j) {
				        temp.add(vooo.getSenderId());
				        j++;
	        		}
	        		else {
			        	temp.add(vooo.getSenderId());
			    	    list2.add(vooo);
	        			
	        		}
	        }
	        
	    }
		return list2;
	}
	/*
	 * 
		
	 * 
	 * */
	
	public void msgRead(MsgVO vo) {
		List<MsgVO> list = null;
		try {
			int i=0;
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			String sql="update msg "+
					"set isRead = '1' "+
					"WHERE (senderId = ? ) and (reciverId = ?) order by no desc";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getSenderId());
			pstmt.setString(2, vo.getReciverId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
			
	}
	
	public boolean msgToMe(MsgVO vo) {

		try {
			int i=0;
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			String sql="select * "+
					"from msg "+
					"WHERE (reciverId = ? ) and (isRead = '0')";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, vo.getReciverId());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				i++;
			}
			
			if(i==0) {
				System.out.println("null");
				return false;
				
			}
			else {
				System.out.println("not null");
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
}