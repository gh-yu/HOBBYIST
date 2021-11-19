package hobbyistClass.model.dao;

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

import hobbyistClass.model.vo.ApvPageInfo;
import hobbyistClass.model.vo.HClass;

public class HClassDAO {

	private Properties prop = null;
	
	public HClassDAO() {
		
		prop = new Properties();
		String fileName = HClassDAO.class.getResource("/sql/class-query.properties").getPath();
			
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("countApvList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	public ArrayList<HClass> selectApvList(Connection conn, ApvPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HClass> apvList = null;
		
		String query = prop.getProperty("selectApvList");
		
		int startRow = (pi.getCurrentPage() -1) * pi.getListLimit() + 1;
		int endRow = startRow + pi.getListLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			apvList = new ArrayList<HClass>();

			while(rset.next()) {
								
				apvList.add(new HClass(rset.getDate("CLASS_ENROLL_DATE"), rset.getInt("CLASS_NO"), rset.getInt("TUTOR_NO"),
									rset.getString("CATEGORY_NAME"), rset.getString("CLASS_NAME"), rset.getString("CLASS_APV_YN"), 
									rset.getDate("CLASS_APV_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
//		System.out.println(apvList);
		return apvList;
	}

//	public int confirmClass(Connection conn, HClass h) {
//		PreparedStatement pstmt1 = null;
//		PreparedStatement pstmt2 = null;
//		ResultSet rset = null;
//		int result = 0;
//		
//		String query1 = prop.getProperty("selectClass");
//		String query2 = prop.getProperty("confirmClass");
//		
//		try {
//			pstmt1 = conn.prepareStatement(query1);
//			pstmt1.setInt(1, h.getClassNo());
//			rset = pstmt1.executeQuery();
//			
//			pstmt2 = conn.prepareStatement(query2);
//			pstmt2.setInt(1, h.getClassNo());
//			result = pstmt2.executeUpdate();
//			
//			if(rset.next()) {
//				h = new HClass(rset.getInt("CLASS_NO"), rset.getString("CLASS_NAME"), rset.getDate("CLASS_ENROLL_DATE"),
//								rset.getDate("CLASS_END_DATE"), rset.getDate("CLASS_APV_DATE"), rset.getString("CLASS_APV_YN"),
//								rset.getString("CLASS_STATUS"), rset.getDouble("CLASS_TIME"), rset.getInt("CLASS_TUTEE_MIN"),
//								rset.getInt("CLASS_TUTEE_MAX"), rset.getString("CLASS_CONTENT"), rset.getInt("CLASS_FEE"),
//								rset.getInt("TUTOR_NO"), rset.getInt("CLASS_CATEGORY_NO"), rset.getDate("CLASS_START_DATE"));
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt1);
//			close(pstmt2);
//		}
//		
//		return result;
//	}

	public HClass selectApvList(Connection conn, int classNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HClass apvList = null;
		
		String query = prop.getProperty("selectClass");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, classNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				apvList = new HClass(rset.getInt("CLASS_NO"), rset.getString("CLASS_NAME"), rset.getDate("CLASS_ENROLL_DATE"),
									rset.getDate("CLASS_END_DATE"), rset.getDate("CLASS_APV_DATE"), rset.getString("CLASS_APV_YN"),
									rset.getString("CLASS_STATUS"), rset.getDouble("CLASS_TIME"), rset.getInt("CLASS_TUTEE_MIN"),
									rset.getInt("CLASS_TUTEE_MAX"), rset.getString("CLASS_CONTENT"), rset.getInt("CLASS_FEE"),
									rset.getInt("TUTOR_NO"), rset.getDate("CLASS_START_DATE"), rset.getString("CATEGORY_NAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return apvList;
	}

	public int confirmClass(Connection conn, HClass apvList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("confirmClass");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, apvList.getClassNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

//	public int confirmClass(Connection conn, int classNo) {
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		String query = prop.getProperty("confirmClass");
//
//		try {
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, classNo);
//			
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		
//		return result;
//	}


	public ArrayList<HClass> selectClassListOrderByLike(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HClass> list = null;
		
		String query = prop.getProperty("selectClassListOrderByLike");
		
		try {
			stmt = conn.createStatement();
			rset  = stmt.executeQuery(query);
			
			list = new ArrayList<HClass>();
			while(rset.next()) {
				HClass c = new HClass(rset.getInt("CLASS_NO"), 
									  rset.getString("CLASS_NAME"),
									  rset.getDate("CLASS_ENROLL_DATE"),
									  rset.getDate("CLASS_END_DATE"),
									  rset.getDate("CLASS_APV_DATE"),
									  rset.getString("CLASS_APV_YN"),
									  rset.getString("CLASS_STATUS"),
									  rset.getDouble("CLASS_TIME"),
									  rset.getInt("CLASS_TUTEE_MIN"),
									  rset.getInt("CLASS_TUTEE_MAX"),
									  rset.getString("CLASS_CONTENT"),
									  rset.getInt("CLASS_FEE"),
									  rset.getInt("TUTOR_NO"),
									  rset.getDate("CLASS_START_DATE"),
									  rset.getString("CATEGORY_NAME"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
}
