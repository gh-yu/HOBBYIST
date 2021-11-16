package csboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import csboard.model.dao.CSBoardDAO;
import csboard.model.vo.PageInfo;
import csboard.model.vo.Reply;
import csboard.model.vo.RequestBoard;

public class CSBoardService {

	private CSBoardDAO cDAO = new CSBoardDAO();

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = cDAO.getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<RequestBoard> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<RequestBoard> list = cDAO.selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public RequestBoard selectBoard(int rNo) {
		Connection conn = getConnection();
		
		RequestBoard rBoard = cDAO.selectBoard(conn, rNo);
		
		close(conn);
		
		return rBoard;
	}

	public ArrayList<Reply> selectReplyList(int rNo) {
		
		
		
		return null;
	}

	public int insertBoard(RequestBoard board) {
		Connection conn = getConnection();
		
		int result = cDAO.insertBoard(conn, board);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	

}
