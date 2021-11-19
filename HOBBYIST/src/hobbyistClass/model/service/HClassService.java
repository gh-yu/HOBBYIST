package hobbyistClass.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hobbyistClass.model.dao.HClassDAO;
import hobbyistClass.model.vo.ApvPageInfo;
import hobbyistClass.model.vo.HClassFiles;
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

	public int insertThumbnail(HClass h, ArrayList<HClassFiles> fileList) {
		Connection conn = getConnection();
		
		int result1 = hDAO.insertClass(conn, h);
		int result2 = hDAO.insertFile(conn, fileList);
		
//		System.out.println("result1 "+result1);
//		System.out.println("result2 "+result2);
		if (result1 > 0 && result2 >= fileList.size()) { // 게시글 insert됐고, 파일 갯수만큼 insert가 되었으면
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
//		System.out.println("result1 "+result1);
//		System.out.println("result2 "+result2);
		return result1 + result2;
	}
	
	public ArrayList selectTList(int i) { // 반환형에 제네릭 빼기 (Board와 AttachMent 중 하나가 반환되기 때문)
		Connection conn = getConnection();
		
		ArrayList list  = null;
		if (i == 1) { // 게시판 목록 가져올 때는 매개변수에 1이라는 값이 들어옴
			list = hDAO.selecBList(conn);
		} else { // 파일 목록 가져올 때는 매개변수에 2라는 값이 들어옴
			list = hDAO.selectFList(conn);
		}
		System.out.println("list "+list);
		close(conn); 
		
		return list;
	}
	
	public ArrayList<HClassFiles> selectThumnail(int bId) {
		Connection conn = getConnection();
		ArrayList<HClassFiles> list = hDAO.selectTumbnail(bId, conn);
		close(conn);
		return list;
	}
	
	public HClass selectBoard(int bId, String upd) {
		Connection conn = getConnection();
		
		int result = 0;
		if (!(upd != null && upd.equals("Y"))) { // upd가 쿼리스트링에 없으면 조회수 업데이트
			result = hDAO.updateHClassCount(conn, bId);
		}
		
		HClass h = hDAO.selectHClass(conn, bId); 
		if(result > 0 && h != null) { // 조회수 증가를 시켰을 때만 commit (조회수 증가 update문 이용하기 때문)
				commit(conn);
		} else {
				rollback(conn);
		}
		
		close(conn);
		
		return h;
	}
	
}
