package tutor.model.service;

import tutor.model.dao.TutorDAO;
import tutor.model.vo.TutorInform;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

public class TutorService {

	private TutorDAO tDAO = new TutorDAO();
	
	public TutorInform selectTutor(String memberEmail) {
		Connection conn = getConnection();
		
		TutorInform tutor = tDAO.selectTutor(conn, memberEmail);
		
		close(conn);
		
		return tutor;
	}
		

}
