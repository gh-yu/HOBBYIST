package tutor.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.dao.MemberDAO;
import tutor.model.vo.TutorInform;

public class TutorDAO {
	private Properties prop = null;
	
	public TutorDAO() {
		
		prop = new Properties();
		
		String fileName = MemberDAO.class.getResource("/sql/tutor-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public TutorInform selectTutor(Connection conn, String memberEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		TutorInform t = null;
		
		String query = prop.getProperty("selectTutor");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberEmail);
			
			rset = pstmt.executeQuery();
			t = new TutorInform();
			if (rset.next()) {
				t = new TutorInform(rset.getInt("TUTOR_NO"),
									rset.getDate("TUTOR_ENROLL_DATE"),
									rset.getString("TUTOR_BANK_ACCOUNT"),
									rset.getString("TUTOR_REPORT"), 
									rset.getString("TUTOR_SNS"), 
									rset.getString("TUTOR_IMG_PATH"), 
									rset.getDate("TUTOR_IMG_UPDATE"), 
									rset.getString("TUTOR_IMG_ORIGIN_NAME"), 
									rset.getString("TUTOR_IMG_CHANGE_NAME"),
									rset.getLong("TUTOR_IMG_SIZE"),
									rset.getString("MEMBER_EMAIL"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return t;
	}
	
}
