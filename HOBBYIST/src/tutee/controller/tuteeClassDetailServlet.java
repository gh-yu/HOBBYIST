package tutee.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classNotice.model.service.ClassNoticeService;
import classNotice.model.vo.ClassNotice;
import hobbyistClass.model.service.HClassService;
import hobbyistClass.model.vo.HClass;
import hobbyistClass.model.vo.HClassFile;
import member.model.vo.Member;
import tutee.model.servuce.TuteeService;
import tutee.model.vo.TuteeClass;
import tutor.model.vo.Tutor;

/**
 * Servlet implementation class tuteeClassDetailServlet
 */
@WebServlet("/detail.te")
public class TuteeClassDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TuteeClassDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		
		HClassService hService = new HClassService();
		
		HClass c = hService.selectClass(cNo);
		
		ArrayList<HClassFile> fileList = hService.selectDetailFileList(cNo);
		
		Tutor tutor = hService.selectClassTutor(c.getTutorNo());
		
		String memberEmail = ((Member)request.getSession().getAttribute("loginUser")).getMemberEmail();	
		ArrayList<TuteeClass> tuteeSchedule = new TuteeService().selectTuteeSchedule(cNo, memberEmail);
		ArrayList<ClassNotice> list = new ClassNoticeService().selectClassList();
		
		String page = null;
		if (c != null && fileList != null && tutor != null && tuteeSchedule != null && list != null) {
			
			page = "WEB-INF/views/tutee/tuteeClassDetail.jsp";
			request.setAttribute("c", c);
			request.setAttribute("fileList", fileList);
			request.setAttribute("tutor", tutor);
			request.setAttribute("tuteeSchedule", tuteeSchedule);
			request.setAttribute("list", list);
			
		} else {
			request.setAttribute("msg", "튜티의 클래스 상세보기 실패");
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
