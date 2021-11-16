package faq.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import faq.model.DAO.FAQDAO;
import faq.model.vo.FAQ;

public class FAQService {

	private FAQDAO fDAO = new FAQDAO();
	
	public ArrayList<FAQ> selectList() {
		Connection conn = getConnection();
		
		ArrayList<FAQ> list = fDAO.selectList(conn);
		
		close(conn);
		
		return list;
	}

	public int insertFAQ(FAQ f) {
		Connection conn = getConnection();
		
		int result = fDAO.insertFAQ(conn,f);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
