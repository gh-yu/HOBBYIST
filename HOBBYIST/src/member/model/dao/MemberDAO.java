package member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


import static common.JDBCTemplate.close;

import member.model.vo.Member;

public class MemberDAO {
	private Properties prop = null;
	
	public MemberDAO() {
		
		prop = new Properties();
		
		String fileName = MemberDAO.class.getResource("/sql/query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userEmail, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_EMAIL = ? AND MEMBER_PWD = ? AND MEMBER_STATUS = 1";
			
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("MEMBER_EMAIL"), 
								rset.getString("MEMBER_NAME"), 
								rset.getString("MEMBER_NICKNAME"), 
								rset.getString("MEMBER_PHONE"), 
								rset.getString("MEMBER_PWD"), 
								rset.getDate("MEMBER_ENROLL_DATE"), 
								rset.getInt("MEMBER_STATUS"), 
								rset.getString("MEMBER_GRADE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public int updateMember(Connection conn, Member newInfo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MEMBER SET MEMBER_NICKNAME = ?, MEMBER_PHONE = ? WHERE MEMBER_EMAIL = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newInfo.getNickName());
			pstmt.setString(2, newInfo.getPhone());
			pstmt.setString(3, newInfo.getUserEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int checkNick(Connection conn, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM MEMBER WHERE MEMBER_NICKNAME = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickName);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt("COUNT(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public Member selectMember(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = "SELECT * FROM MEMBER WHERE MEMBER_EMAIL = ? AND MEMBER_STATUS = 1";
			
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("MEMBER_EMAIL"), 
								rset.getString("MEMBER_NAME"), 
								rset.getString("MEMBER_NICKNAME"), 
								rset.getString("MEMBER_PHONE"), 
								rset.getString("MEMBER_PWD"), 
								rset.getDate("MEMBER_ENROLL_DATE"), 
								rset.getInt("MEMBER_STATUS"), 
								rset.getString("MEMBER_GRADE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}


}
