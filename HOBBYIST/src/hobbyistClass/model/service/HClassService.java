package hobbyistClass.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import hobbyistClass.model.dao.HClassDAO;
import hobbyistClass.model.vo.ApvPageInfo;
import hobbyistClass.model.vo.HClass;
import hobbyistClass.model.vo.HClassFiles;

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

	public ArrayList<HClass> selectApvList(int classNo) {
		Connection conn = getConnection();
		
		ArrayList<HClass> apvList = hDAO.selectApvList(conn, classNo);
		
		close(conn);
		
		return apvList;
	}

//	public int confirmClass(HClass hList) {
//		Connection conn = getConnection();
//		
//		int result = hDAO.confirmClass(conn, hList);
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
	
	public ArrayList<HClass> selectClassListOrderByLike() {
		Connection conn = getConnection();
		
		ArrayList<HClass> list = hDAO.selectClassListOrderByLike(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<HClass> selectClassList() {
		// TODO Auto-generated method stub
		return null;
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
	
	public int insertThumbnail(HClass h, ArrayList<HClassFiles> fileList) {
        Connection conn = getConnection();

        int result1 = hDAO.insertClass(conn, h);
        int result2 = hDAO.insertFile(conn, fileList);

//        System.out.println("result1 "+result1);
//        System.out.println("result2 "+result2);
        if (result1 > 0 && result2 >= fileList.size()) { // 寃뚯떆湲� insert�릱怨�, �뙆�씪 媛��닔留뚰겮 insert媛� �릺�뿀�쑝硫�
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);
//        System.out.println("result1 "+result1);
//        System.out.println("result2 "+result2);
        return result1 + result2;
    }

	public int confirmClass(int classNo) {
		Connection conn = getConnection();
		
		int result = hDAO.confirmClass(conn, classNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int rejectClass(int classNo) {
		Connection conn = getConnection();
		
		int result = hDAO.rejectClass(conn, classNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return list;

	}

	public ArrayList<HClass> selectClassList() {
		// TODO Auto-generated method stub
		return null;
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
//		
//		return result;
//	}
	
	public ArrayList selectTList(int i) { // 諛섑솚�삎�뿉 �젣�꽕由� 鍮쇨린 (Board�� AttachMent 以� �븯�굹媛� 諛섑솚�릺湲� �븣臾�)
        Connection conn = getConnection();

        ArrayList list  = null;
        if (i == 1) { // 寃뚯떆�뙋 紐⑸줉 媛��졇�삱 �븣�뒗 留ㅺ컻蹂��닔�뿉 1�씠�씪�뒗 媛믪씠 �뱾�뼱�샂
            list = hDAO.selecBList(conn);
        } else { // �뙆�씪 紐⑸줉 媛��졇�삱 �븣�뒗 留ㅺ컻蹂��닔�뿉 2�씪�뒗 媛믪씠 �뱾�뼱�샂
            list = hDAO.selectFList(conn);
        }
        System.out.println("list "+list);
        close(conn); 

        return list;
    }
	
	public int insertThumbnail(HClass h, ArrayList<HClassFiles> fileList) {
        Connection conn = getConnection();

        int result1 = hDAO.insertClass(conn, h);
        int result2 = hDAO.insertFile(conn, fileList);

//        System.out.println("result1 "+result1);
//        System.out.println("result2 "+result2);
        if (result1 > 0 && result2 >= fileList.size()) { // 寃뚯떆湲� insert�릱怨�, �뙆�씪 媛��닔留뚰겮 insert媛� �릺�뿀�쑝硫�
            commit(conn);
        } else {
            rollback(conn);
        }

        close(conn);
//        System.out.println("result1 "+result1);
//        System.out.println("result2 "+result2);
        return result1 + result2;
    }

		return result;
	}


}
