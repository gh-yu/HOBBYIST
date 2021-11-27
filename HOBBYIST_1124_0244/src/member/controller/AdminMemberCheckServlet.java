package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hobbyistClass.model.service.HClassService;
import hobbyistClass.model.vo.ApvPageInfo;
import hobbyistClass.model.vo.HClass;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberCheckServlet
 */
@WebServlet("/memberCheck.admin")
public class AdminMemberCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> mList = new MemberService().MemberCount();
		
		String page = null;
		
		if(mList != null) {
			request.setAttribute("mList", mList);
			page = "WEB-INF/views/admin/MemberCheckList.jsp";
		} else {
			request.setAttribute("msg", "멤버 목록 내역 조회 실패");
			page = "WEB-INF/views/common/errorPage.jsp";
		}

		request.getRequestDispatcher(page).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
