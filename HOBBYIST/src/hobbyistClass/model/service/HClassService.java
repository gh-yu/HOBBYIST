package hobbyistClass.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hobbyistClass.model.dao.HClassDAO;
import hobbyistClass.model.vo.ApvPageInfo;
import hobbyistClass.model.vo.HClass;
import hobbyistClass.model.vo.HClassFile;

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
	public int insertThumbnail(HClass h, ArrayList<HClassFile> fileList) {
		Connection conn = getConnection();
		
		int result1 = hDAO.insertClass(conn, h);
		System.out.println("result1" + result1);
		int result2 = hDAO.insertFile(conn, fileList);
		System.out.println("result2" + result2);
		if (result1 > 0 && result2 >= fileList.size()) { 
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result1 + result2;
	}
	
	public ArrayList selectTList(int i) { 
		Connection conn = getConnection();
		
		ArrayList list  = null;
		if (i == 1) { 
			list = hDAO.selecBList(conn);
		} else { 
			list = hDAO.selectFList(conn);
		}
		System.out.println("list "+list);
		close(conn); 
		
		return list;
	}
	
	public ArrayList<HClassFile> selectThumnail(int bId) {
		Connection conn = getConnection();
		ArrayList<HClassFile> list = hDAO.selectTumbnail(bId, conn);
		close(conn);
		return list;
	}
	
	public HClass selectBoard(int bId, String upd) {
		Connection conn = getConnection();
		
		int result = 0;
		if (!(upd != null && upd.equals("Y"))) { // upd媛� 荑쇰━�뒪�듃留곸뿉 �뾾�쑝硫� 議고쉶�닔 �뾽�뜲�씠�듃
			result = hDAO.updateHClassCount(conn, bId);
		}
		
		HClass h = hDAO.selectHClass(conn, bId); 
		if(result > 0 && h != null) { // 議고쉶�닔 利앷�瑜� �떆耳곗쓣 �븣留� commit (議고쉶�닔 利앷� update臾� �씠�슜�븯湲� �븣臾�)
				commit(conn);
		} else {
				rollback(conn);
		}
		
		close(conn);
		
		return h;
	}
	
	public int updateHClass(int bId, int cateId, String title, String content) {
		Connection conn = getConnection();
		
		int result = hDAO.updateHClass(conn, bId, cateId, title, content);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<HClass> selectList() {
Connection conn = getConnection();
		
		ArrayList<HClass> list = hDAO.selectList(conn);
		
		close(conn);
		
		return list;
	}

}
