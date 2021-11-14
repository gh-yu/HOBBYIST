package csboard.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import csboard.model.vo.RequestBoard;
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
	
	public ArrayList<RequestBoard> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<RequestBoard> list = null;
		
		String query = prop.getProperty("selectList");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

	
	// String query = "SELECT * FROM CS_REQ_BOARD JOIN FILES ON(BOARD_NO = REQ_NO) WHERE FILE_TABLE_NAME = 'CS_REQ_BOARD' AND STATUS = 1";
	
	
	// 게시판 작성 및 수정시 들어온 사진이 있으면 파일 테이블 조인 및 업데이트 같이 해야함, else 게시판만 insert, update
}
