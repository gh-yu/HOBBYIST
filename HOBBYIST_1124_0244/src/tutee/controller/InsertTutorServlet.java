package tutee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import tutor.model.service.TutorService;
import tutor.model.vo.Tutor;

/**
 * Servlet implementation class InsertTutorServlet
 */
@WebServlet("/insertTutee.me")
public class InsertTutorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTutorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 튜터 신청페이지에서 받아온 값 넘기기
		request.setCharacterEncoding("UTF-8");
		String tutorSns = request.getParameter("mySns");
		String tutorReport = request.getParameter("myReport");
		String memberEmail = ((Member)request.getSession().getAttribute("loginUser")).getMemberEmail();
		
		Tutor tutor = new Tutor(0, null, tutorReport, tutorSns, null, null, null, null);
		int result = new TutorService().insertTutor(tutor, memberEmail);
		
//		System.out.println(result);
		
		if(result > 1) {
			// 성공시 등급 B로 변경되어야
			Member loginUser = new MemberService().selectMember(memberEmail);
			request.getSession().setAttribute("loginUser", loginUser);
			
			request.getRequestDispatcher("WEB-INF/views/tutor/tutorInform.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "튜터 신청에 실패하였습니다");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
		
	}
		
		
		
		
//		HttpSession session = request.getSession();
//		Member loginUser = (Member)session.getAttribute("loginUser");
//		
//		String Sns = request.getParameter("tSns");
//		String Report = request.getParameter("tReport");
//		
//		Tutor tutor = new Tutor(0, null, null, Report, Sns, null, null, null, null);
//		int result = new TutorService().insertTutor(tutor);
//		
//		if(result > 0) {
//			session.setAttribute(name, value);
//			response.sendRedirect(request.getContextPath());
//		} else {
//			request.setAttribute("msg", "튜터 신청에 실패했습니다.");
//			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
//		}
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
