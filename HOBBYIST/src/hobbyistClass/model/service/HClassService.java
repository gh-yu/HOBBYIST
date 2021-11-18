package hobbyistClass.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import hobbyistClass.model.dao.HClassDAO;
import hobbyistClass.model.vo.Attachment;
import hobbyistClass.model.vo.HClass;
import hobbyistClass.model.vo.PageInfo;

public class HClassService {

	private HClassDAO hcDAO = new HClassDAO();

//	public int getListCount() {
//		Connection conn = getConnection();
//
//		int listCount = hcDAO.getListCount(conn);
//
//		close(conn);
//
//		return listCount;
//	}

	public ArrayList<HClass> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<HClass> list = hcDAO.selectList(conn, pi);

		close(conn);

		return list;
	}

	public int insertBoard(HClass hClass) {
		Connection conn = getConnection();

		int result = hcDAO.insertBoard(conn, hClass);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public HClass selectBoard(int bId, String upd) {
		Connection conn = getConnection();

		int result = 0;
		if (!(upd != null && upd.equals("Y"))) { // upd가 쿼리스트링에 없으면 조회수 업데이트
			result = hcDAO.updateCount(conn, bId);
		}

		HClass hc = hcDAO.selectBoard(conn, bId);
		if (result > 0 && hc != null) { // 조회수 증가를 시켰을 때만 commit (조회수 증가 update문 이용하기 때문)
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return hc;
	}

	public int updateBoard(int bId, int cateId, String title, String content) {
		Connection conn = getConnection();

		int result = hcDAO.updateBoard(conn, bId, cateId, title, content);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int deleteBoard(int bId) {
		Connection conn = getConnection();

		int result = hcDAO.deleteBoard(conn, bId);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public ArrayList selectTList(int i) { // 반환형에 제네릭 빼기 (Board와 AttachMent 중 하나가 반환되기 때문)
		Connection conn = getConnection();

		ArrayList list = null;
		if (i == 1) { // 게시판 목록 가져올 때는 매개변수에 1이라는 값이 들어옴
			list = hcDAO.selecBList(conn);
		} else { // 파일 목록 가져올 때는 매개변수에 2라는 값이 들어옴
			list = hcDAO.selectFList(conn);
		}

		close(conn);

		return list;
	}

	public int inserThumbnail(HClass hc, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();

		int result1 = hcDAO.insertBoard(conn, hc);
		int result2 = hcDAO.insertAttachment(conn, fileList);

		if (result1 > 0 && result2 >= fileList.size()) { // 게시글 insert됐고, 파일 갯수만큼 insert가 되었으면
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 + result2;
	}

	public ArrayList<Attachment> selectThumnail(int bId) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = hcDAO.selectTumbnail(bId, conn);
		close(conn);
		return list;
	}
}
