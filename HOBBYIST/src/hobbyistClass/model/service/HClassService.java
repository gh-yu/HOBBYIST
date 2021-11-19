package hobbyistClass.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hobbyistClass.model.dao.HClassDAO;
import hobbyistClass.model.vo.ApvPageInfo;
import hobbyistClass.model.vo.HClass;

public class HClassService {

	private HClassDAO hDAO = new HClassDAO();
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = hDAO.getListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<HClass> selectApvList(ApvPageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<HClass> list = hDAO.selectApvList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public HClass selectApvList(int classNo) {
		Connection conn = getConnection();
		
		HClass apvList = hDAO.selectApvList(conn, classNo);
		
		close(conn);
		
		return apvList;
	}

	public int confirmClass(HClass apvList) {
		Connection conn = getConnection();
		
		int result = hDAO.confirmClass(conn, apvList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	
	public ArrayList<HClass> selectClassListOrderByLike() {
		Connection conn = getConnection();
		
		ArrayList<HClass> list = hDAO.selectClassListOrderByLike(conn);
		
		close(conn);
		
		return list;

	}
	
//	public int confirmClass(HClass h) {
//		Connection conn = getConnection();
//		
//		int result = hDAO.confirmClass(conn, h);
//		
//		if(result > 0) {
//			commit(conn);
//		} else {
//			rollback(conn);
//		}
//		
//		close(conn);
//		
//		return result;
//	}

//	public int confirmClass(int classNo) {
//		Connection conn = getConnection();
//		
//		int result = hDAO.confirmClass(conn, classNo);
//		
//		if(result > 0) {
//			commit(conn);
//		} else {
//			rollback(conn);
//		}
//		
//		close(conn);
//		
//		return result;
//	}



}
