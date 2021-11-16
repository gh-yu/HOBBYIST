package classNotice.model.dao;

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

import classNotice.model.vo.ClassNotice;

import static common.JDBCTemplate.close;

public class ClassNoticeDAO {

	private Properties prop = null;
	
	public ClassNoticeDAO() {
		prop = new Properties();
		
		String fileName = ClassNoticeDAO.class.getResource("/sql/notice/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	public ArrayList<ClassNotice> selecClasstList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ClassNotice> list = null;
		
		String query = prop.getProperty("selectClassList");
		// selectList=SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_WRITER, NICKNAME, NOTICE_COUNT, NOTICE_DATE, NOTICE.STATUS 
		// FROM NOTICE JOIN MEMBER ON(USER_ID = NOTICE_WRITER) WHERE NOTICE.STATUS = 'Y'
		// JOIN할때 컬럼명 겹치면 테이블명.컬럼명으로 어느 테이블의 컬럼인지 명시하기 (SQL Developer에서 쿼리문 오류 없는지 시험 삼아 실행해보기)
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<ClassNotice>();
			while(rset.next()) {
				list.add(new ClassNotice(rset.getInt("classBoardNo"),
						  			 rset.getString("classBoardName"),
						  			 rset.getString("classBoardContent"),
						  			 rset.getInt("classBoardViews"),
						  			 rset.getDate("classBoardDate"),
						  			 rset.getInt("classBoardStatus"),
						  			 rset.getInt("classNo")));				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int insertClassNotice(Connection conn, ClassNotice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertClassNotice");
		// insertNotice=INSERT INTO NOTICE VALUES(SEQ_NNO.NEXTVAL, ?, ?, ?, DEFAULT, ?, DEFAULT)
		
		try {
			pstmt = conn.prepareStatement(query);	
			pstmt.setString(1, n.getClassBoardName());
//			pstmt.setString(2, n.getNoticeContent());
//			pstmt.setString(3, n.getNoticeWriter());
//			pstmt.setDate(4, n.getNoticeDate());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateClassNoticeCount(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateClassNoticeCount");
		// updateCount=UPDATE NOTICE SET NOTICE_COUNT = NOTICE_COUNT + 1 WHERE NOTICE_NO = ?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ClassNotice selectClassNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ClassNotice n = null;
		
		String query = prop.getProperty("selecClasstNotice");
		// selectNotice=SELECT NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_WRITER, NICKNAME, NOTICE_COUNT, NOTICE_DATE, NOTICE.STATUS FROM NOTICE JOIN MEMBER ON(USER_ID = NOTICE_WRITER) 
		// WHERE NOTICE_NO = ? AND NOTICE.STATUS = 'Y' --> url의  쿼리스트링을 고쳐서 접근할 수 도 있기 때문에 STATUS가 Y인 것만 보이는 조건도 추가
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
//			n = new Notice();
			if(rset.next()) {
//				n.setNoticeTitle(rset.getString("notice_title"));
//				n.setNoticeContent(rset.getString("notice_content"));
//				n.setNoticeWriter(rset.getString("notice_writer"));
//				n.setNickname( rset.getString("nickname"));
//				n.setNoticeDate(rset.getDate("notice_date"));
				n = new ClassNotice(rset.getInt("classBoardNo"),
									rset.getString("classBoardName"),
									rset.getString("classBoardContent"),
									rset.getInt("classBoardViews"),
									rset.getDate("classBoardDate"),
									rset.getInt("classBoardStatus"),
									rset.getInt("classNo"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}

	public int updateClassNotice(Connection conn, ClassNotice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateClassNotice");
		// updateNotice=UPDATE NOTICE SET NOTICE_TITLE = ?, NOTICE_CONTENT = ?, NOTICE_DATE = ? WHERE NOTICE_NO = ?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getClassBoardName());
//			pstmt.setString(2, n.getNoticeContent());
//			pstmt.setDate(3, n.getNoticeDate());
//			pstmt.setInt(4, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteClassNotice(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteClassNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}




}