package member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import member.model.vo.Member;

public class MemberDAO {
	private Connection conn = null;
	private Properties prop = null;
	
	public MemberDAO() {
		
		prop = new Properties();
		
		String fileName = MemberDAO.class.getResource("/sql/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 로그인
	public int login(Connection conn, String memberEmail, String memberPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT MEMBER_PWD FROM MEMBER WHERE MEMBER_EMAIL = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberEmail);
			rset = pstmt.executeQuery();
			if(rset.next()) {
					if(rset.getString(1).equals(memberPwd)) 
						return 1; // 로그인 성공
					 else 
						return 0;	// 비밀번호 불일치
					
				}
				return -1;	// 아이디 없음
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return -2;
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
								rset.getInt("Kakao_No"),
								rset.getString("MEMBER_ENROLL_TYPE"), 
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
	
	// 회원가입
		public int join(Connection conn, Member member) {
			PreparedStatement pstmt = null;
			
			int result = 0;
			String query = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?, 0, DEFAULT, SYSDATE, DEFAULT, DEFAULT)";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, member.getMemberEmail());
				pstmt.setString(2, member.getMemberName());
				pstmt.setString(3, member.getMemberNickName());
				pstmt.setString(4, member.getMemberPhone());
				pstmt.setString(5, member.getMemberPwd());
//				pstmt.setInt(6, member.getKakaoNo());
//				pstmt.setString(7, member.getMemberEnrollType());
//				pstmt.setDate(8, member.getMemberEnrollDate());
//				pstmt.setInt(9, member.getMemberStatus());
//				pstmt.setString(10, member.getMemberGrade());
				
				result = pstmt.executeUpdate();
				
				if(result > 0) 
	                return result;
	             else 
	                return 0;

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return -1;	// 데이터베이스 오류
		}

	public int updateMember(Connection conn, Member newInfo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "UPDATE MEMBER SET MEMBER_NICKNAME = ?, MEMBER_PHONE = ? WHERE MEMBER_EMAIL = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newInfo.getMemberNickName());
			pstmt.setString(2, newInfo.getMemberPhone());
			pstmt.setString(3, newInfo.getMemberEmail());
			
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
								rset.getInt("Kakao_No"),
								rset.getString("MEMBER_ENROLL_TYPE"), 
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
