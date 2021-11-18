package tutor.model.dao;

import static common.JDBCTemplate.close;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import hobbyistClass.model.vo.HClass;
//import tutor.model.vo.Attachment;
import tutor.model.vo.TutorClass;



public class TutorClassDAO {
	
	private Properties prop = null;
	
//	public int insertTutorClass(Connection conn, TutorClass tutorclass) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query = "";
//
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, tutorclass.getCategoryNo());
////			pstmt.setString(2, tutorclass.gett());
//			pstmt.setString(3, tutorclass.getBoardContent());
//			pstmt.setString(4, tutorclass.getBoardWriter());
//
//			result = pstmt.executeUpdate();
//			
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//
//		return result;
//	}
//	
//	
//	
//	
//	
//	public int classOpen(Connection conn, TutorClass tc) {
//		
//		PreparedStatement pstmt = null;
//		int result = 0;
//				
//		String query = "INSERT INTO TUTOR VALUES(?, ?, ?, ?, ?, ?,?,?,?,?,?)";
//
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, tc.getTutorNo());
//			pstmt.setDate(2, tc.getTutorEnrollDate());
//			pstmt.setString(3, tc.getTutorBankAccount());
//			pstmt.setString(4, tc.getTutorReport());
//			pstmt.setString(5, tc.getTutorSNS());
//			pstmt.setString(6, tc.getTutorImgPath());
//			pstmt.setDate(7, tc.getTutorImgUpdate());
//			pstmt.setString(8, tc.getTutorImgName());
//			pstmt.setInt(9, tc.getTutorImgSize());
//			pstmt.setString(10, tc.getMemberEmail());
//			pstmt.setString(11, tc.getMemberGrade());
//			
//			result = pstmt.executeUpdate();
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//
//		return result;
//	}
//	
//	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
//		PreparedStatement pstmt = null;
//		int result = 0; 
//		
//		String query = prop.getProperty("insertAttachment");
//		try {
//			pstmt = conn.prepareStatement(query);
//
//			for (int i = 0; i < fileList.size(); i++) {
//				
//				pstmt.setString(1, fileList.get(i).getOriginName());
//				pstmt.setString(2, fileList.get(i).getChangeName());
//				pstmt.setString(3, fileList.get(i).getFilePath());
//				pstmt.setString(4, fileList.get(i).getFileThumbYN());
//				
//				result += pstmt.executeUpdate();				
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}

	
}
