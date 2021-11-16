package faq.model.DAO;

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
import faq.model.vo.FAQ;

public class FAQDAO {
	
	private Properties prop = null;
	
	public FAQDAO() {
		
		prop = new Properties();
		
		String fileName = FAQDAO.class.getResource("/sql/faq-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
//
	public ArrayList<FAQ> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<FAQ> list = null;
		
		String query = prop.getProperty("selectFaqList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<FAQ>();
			while(rset.next()) {
				
				list.add(new FAQ(rset.getInt("FAQ_NO"),
								rset.getString("FAQ_CATEGORY"),
								rset.getString("FAQ_TITLE"),
								rset.getString("FAQ_REPLY")));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	public int insertFAQ(Connection conn, FAQ f) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFAQ");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqReply());
			pstmt.setString(3, f.getFaqCategory());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
