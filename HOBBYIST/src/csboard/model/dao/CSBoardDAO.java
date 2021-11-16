package csBoard.model.dao;

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
import static common.JDBCTemplate.close;

import csBoard.model.vo.PageInfo;
import csBoard.model.vo.RequestBoard;
import member.model.dao.MemberDAO;

public class CSBoardDAO {

	private Properties prop = null;
	
	public CSBoardDAO() {
		
		prop = new Properties();
		
		String fileName = MemberDAO.class.getResource("/sql/csboard-query.properties").getPath();
		
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
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if (rset.next()) {
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
	
	public ArrayList<RequestBoard> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<RequestBoard> list = null;
		
		String query = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<RequestBoard>();
			while(rset.next()) {
				RequestBoard rb = new RequestBoard(rset.getInt("REQ_NO"),
												   rset.getString("REQ_CATEGORY"),
												   rset.getString("REQ_TITLE"),
												   rset.getString("REQ_CONTENT"),
												   rset.getString("MEMBER_EMAIL"),
												   rset.getString("MEMBER_NICKNAME"),
												   rset.getDate("REQ_CREATE_DATE"),
												   rset.getDate("REQ_MODIFY_DATE"),
												   rset.getInt("REQ_STATUS"),
												   rset.getString("REQ_REPLY_STATUS"));
				list.add(rb);
												   
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public RequestBoard selectBoard(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		RequestBoard rb = null;
		
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNo);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				rb = new RequestBoard(rset.getInt("REQ_NO"),
									   rset.getString("REQ_CATEGORY"),
									   rset.getString("REQ_TITLE"),
									   rset.getString("REQ_CONTENT"),
									   rset.getString("MEMBER_EMAIL"),
									   rset.getString("MEMBER_NICKNAME"),
									   rset.getDate("REQ_CREATE_DATE"),
									   rset.getDate("REQ_MODIFY_DATE"),
									   rset.getInt("REQ_STATUS"),
									   rset.getString("REQ_REPLY_STATUS"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rb;
	}

	public int insertBoard(Connection conn, RequestBoard board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getReqCategory());
			pstmt.setString(2, board.getReqTitle());
			pstmt.setString(3, board.getReqContent());
			pstmt.setString(4, board.getReqWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// String query = "SELECT * FROM CS_REQ_BOARD JOIN FILES ON(BOARD_NO = REQ_NO) WHERE FILE_TABLE_NAME = 'CS_REQ_BOARD' AND STATUS = 1";
	
	
	// 게시판 작성 및 수정시 들어온 사진이 있으면 파일 테이블 조인 및 업데이트 같이 해야함, else 게시판만 insert, update
}
