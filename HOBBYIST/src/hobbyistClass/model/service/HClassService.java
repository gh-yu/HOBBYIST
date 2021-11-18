package hobbyistClass.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hobbyistClass.model.vo.HClass;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

public class HClassService {

	public ArrayList<HClass> selectClassList() {
		Connection conn = getConnection();
		
		close(conn);
		return null;
	}

}
