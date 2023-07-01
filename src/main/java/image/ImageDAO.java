package image;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import user.User;


public class ImageDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public List<ImageVO> list() throws Exception{
		List<ImageVO> list = null;
		try {
			int i=0;
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			String sql="select i.userId,i.content,i.visit,i.no,i.title,i.price,i.fileName,u.userNickName,i.region,i.writeDate "+
					"from image i,user u "+
					"where (u.userId=i.userId) order by i.no desc";
			
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					if(list ==null ) {
							list=new ArrayList<ImageVO>();
					}
					ImageVO vo = new ImageVO();
					vo.setNo(rs.getInt("no"));
					vo.setVisit(rs.getInt("visit"));
					vo.setTitle(rs.getString("title"));
					vo.setPrice(rs.getString("price"));
					vo.setUserNickname(rs.getString("userNickname"));
					vo.setRegion(rs.getString("region"));
					vo.setWriteDate(rs.getString("writeDate"));
					vo.setFileName(rs.getString("fileName"));
					vo.setUserId(rs.getString("userId"));
					vo.setContent(rs.getString("content"));

					list.add(vo);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertIMG(ImageVO vo) {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			
			String SQL="insert into image(title,price,region,content,userId,fileName) "
					+"value(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(SQL);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getPrice());
			pstmt.setString(3, vo.getRegion());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getUserId());
			pstmt.setString(6, vo.getFileName());
			
			pstmt.executeUpdate();
			return 0;
		
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<ImageVO> sellerInfo(String userId) {

		List<ImageVO> list = null;
		try {

			int i=0;
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			String sql="select * "+
					"from image "+
					"WHERE (userId = ? ) order by no desc";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					if(list ==null ) {
							list=new ArrayList<ImageVO>();
					}
					ImageVO vo = new ImageVO();
					vo.setNo(rs.getInt("no"));
					vo.setVisit(rs.getInt("visit"));
					vo.setTitle(rs.getString("title"));
					vo.setPrice(rs.getString("price"));
					vo.setRegion(rs.getString("region"));
					vo.setWriteDate(rs.getString("writeDate"));
					vo.setFileName(rs.getString("fileName"));
					vo.setUserId(rs.getString("userId"));
					vo.setContent(rs.getString("content"));

					list.add(vo);
				}
			}else {
				return null;
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int changeIMG(String no) {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			
			String SQL="update image set visit='1' where no=?";
			pstmt=con.prepareStatement(SQL);
			
			pstmt.setInt(1, Integer.parseInt(no));
			pstmt.executeUpdate();
			return 0;
		
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int delIMG(String no) {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			
			String SQL="delete from image where no=?";
			pstmt=con.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(no));
			pstmt.executeUpdate();
			return 0;
		
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int editIMG(ImageVO vo) {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			
			String SQL="update image set title = ?,content = ?,  price = ?, fileName = ?,region = ?,userId = ? where no=?";
			pstmt=con.prepareStatement(SQL);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getPrice());
			pstmt.setString(4, vo.getFileName());
			pstmt.setString(5, vo.getRegion());
			pstmt.setString(6, vo.getUserId());
			pstmt.setInt(7, vo.getNo());
			
			pstmt.executeUpdate();
			return 0;
		
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int editIMG2(ImageVO vo) {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			
			String SQL="update image set title = ?,content = ?,  price = ?, region = ?,userId = ? where no=?";
			pstmt=con.prepareStatement(SQL);
			
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getPrice());
			pstmt.setString(4, vo.getRegion());
			pstmt.setString(5, vo.getUserId());
			pstmt.setInt(6, vo.getNo());
			
			pstmt.executeUpdate();
			return 0;
		
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<ImageVO> search(String title) {

		List<ImageVO> list = null;
		try {

			
			int i=0;
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			String sql="select * from image where title like ? or title like ? or title like ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "%"+title+"%");
			pstmt.setString(2, title+"%");
			pstmt.setString(3, "%"+title);
			rs=pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					if(list ==null ) {
							list=new ArrayList<ImageVO>();
					}
					ImageVO vo = new ImageVO();
					vo.setNo(rs.getInt("no"));
					vo.setVisit(rs.getInt("visit"));
					vo.setTitle(rs.getString("title"));
					vo.setPrice(rs.getString("price"));
					vo.setRegion(rs.getString("region"));
					vo.setWriteDate(rs.getString("writeDate"));
					vo.setFileName(rs.getString("fileName"));
					vo.setUserId(rs.getString("userId"));
					vo.setContent(rs.getString("content"));

					list.add(vo);
				}
			}else {
				return null;
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ImageVO select(String no) {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbId="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL,dbId,dbPassword);
			
			String SQL="select * from image where no=?";
			

			pstmt=con.prepareStatement(SQL);
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			
			ImageVO vo = new ImageVO();
			vo.setNo(rs.getInt("no"));
			vo.setVisit(rs.getInt("visit"));
			vo.setTitle(rs.getString("title"));
			vo.setPrice(rs.getString("price"));
			vo.setUserNickname(rs.getString("userNickname"));
			vo.setRegion(rs.getString("region"));
			vo.setWriteDate(rs.getString("writeDate"));
			vo.setFileName(rs.getString("fileName"));
			vo.setUserId(rs.getString("userId"));
			vo.setContent(rs.getString("content"));
			
			return vo;
		
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

