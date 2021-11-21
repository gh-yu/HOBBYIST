package tutor.model.dao;

import static common.JDBCTemplate.close;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import tutor.model.vo.Files;
import tutor.model.vo.Tutor;

public class TutorDAO {
	private Properties prop = null;
	
	public TutorDAO() {
			
			prop = new Properties();
			
			String fileName = TutorDAO.class.getResource("/sql/tutor-query.properties").getPath();
			
			try {
				prop.load(new FileReader(fileName));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	
	// 튜터 정보 넘기기
	public int insertTutor(Connection conn, Tutor tutor, String memberEmail) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTutor");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tutor.getTutorReport());
			pstmt.setString(2, tutor.getTutorSns());
			pstmt.setString(3, memberEmail);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertFiles(Connection conn, ArrayList<Files> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFiles");
		
		try {
			for(int i=0; i<fileList.size(); i++) {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fileList.get(i).getOriginName());
			pstmt.setString(2, fileList.get(i).getChangeName());
			pstmt.setString(3, fileList.get(i).getFilePath());
			
			result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Tutor selectTutor(Connection conn, String memberEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Tutor t = null;

		String query = prop.getProperty("selectTutor");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberEmail);

			rset = pstmt.executeQuery();
			t = new Tutor();
			if (rset.next()) {
				t = new Tutor(rset.getInt("TUTOR_NO"),
							  rset.getDate("TUTOR_ENROLL_DATE"),
							  rset.getString("TUTOR_BANK_ACCOUNT"),
						      rset.getString("TUTOR_REPORT"), 
							  rset.getString("TUTOR_SNS"), 
							  rset.getString("TUTOR_IMG_PATH"), 
							  rset.getDate("TUTOR_IMG_UPDATE"), 
							  rset.getString("TUTOR_IMG_ORIGIN_NAME"), 
							  rset.getString("TUTOR_IMG_CHANGE_NAME"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return t;
	}

}
