package tutee.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static common.JDBCTemplate.close;
import tutee.model.vo.LikeClass;
import tutor.model.dao.TutorDAO;

public class TuteeDAO {
	private Properties prop = null;
	
	public TuteeDAO() {
			
			prop = new Properties();
			
			String fileName = TutorDAO.class.getResource("/sql/tutee-query.properties").getPath();
			
			try {
				prop.load(new FileReader(fileName));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	
	public ArrayList<LikeClass> selectLikeClass(Connection conn, String memberEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<LikeClass> list = null;
		
		String query = prop.getProperty("selectLikeClass");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberEmail);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<LikeClass>();
			while(rset.next()) {
				list.add(new LikeClass(rset.getInt("CLASS_NO"),
									   rset.getString("MEMBER_EMAIL"),
									   rset.getDate("CLIP_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	public int deleteLikeClass(Connection conn, String memberEmail, int likedCNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteLikeClass");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberEmail);
			pstmt.setInt(2, likedCNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertLikeClass(Connection conn, String memberEmail, int cNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertLikeClass");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cNo);
			pstmt.setString(2, memberEmail);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
