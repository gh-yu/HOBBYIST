package csBoard.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import csBoard.model.dao.CSBoardDAO;
import csBoard.model.vo.PageInfo;
import csBoard.model.vo.Reply;
import csBoard.model.vo.RequestBoard;

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
		Connection conn = getConnection();
		
		ArrayList<Reply> list = cDAO.selectReplyList(conn, rNo);
		
		close(conn);
		
		return list;
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

	public int updateBoard(RequestBoard board) {
		Connection conn = getConnection();
		
		int result = cDAO.updateBoard(conn, board);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteBoard(int rNo) {
		Connection conn = getConnection();
		
		int result = cDAO.deleteBoard(conn, rNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;	
	}
	

}
