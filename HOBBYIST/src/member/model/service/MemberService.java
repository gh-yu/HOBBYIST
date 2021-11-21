package member.model.service;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;


public class MemberService{

	private MemberDAO mDAO = new MemberDAO();
	
	public int login(String userEmail, String userPwd) {
		Connection conn = getConnection();
		
		int result = mDAO.login(conn, userEmail, userPwd);
		
		close(conn);
		
		return result;
	}
	
	public Member loginMember(String userEmail, String userPwd) {
		Connection conn = getConnection();
		
		Member m = mDAO.loginMember(conn, userEmail, userPwd);
		
		close(conn);
		
		return m;
	}
	
	public int join(Member member) {
		Connection conn = getConnection();
		
		int result = mDAO.join(conn, member);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateMember(Member newInfo) {
		Connection conn = getConnection();
		
		int result = mDAO.updateMember(conn, newInfo);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}


	public int checkNick(String nickName) {
		Connection conn = getConnection();
		
		int result = mDAO.checkNick(conn, nickName);
		
		close(conn);
		
		return result;		
		
	}

	public Member selectMember(String email) {
		Connection conn = getConnection();
		
		Member m = mDAO.selectMember(conn, email);
		
		close(conn);
		
		return m;
	}

	public int deleteMember(String memberEmail) {
		Connection conn = getConnection();
		
		int result = mDAO.deleteMember(conn, memberEmail);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updatePwd(HashMap<String, String> map) {
		Connection conn = getConnection();
		
		int result = mDAO.updatePwd(conn, map);
		if(result > 0){
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public ArrayList<Member> MemberCount() {
		Connection conn = getConnection();
		
		ArrayList<Member> mList = mDAO.countMember(conn);
				
		close(conn);
		return mList;
	}

}