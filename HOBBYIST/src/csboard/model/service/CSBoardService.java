package csboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import csboard.model.dao.CSBoardDAO;
import csboard.model.vo.RequestBoard;

public class CSBoardService {

	private CSBoardDAO cDAO = new CSBoardDAO();
	
	public ArrayList<RequestBoard> selectList() {
		Connection conn = getConnection();
		
		ArrayList<RequestBoard> list = cDAO.selectList(conn);
		
		close(conn);
		
		return list;
	}
	
	public int getListCount() {
		
		
		
		return 0;
	}



}
