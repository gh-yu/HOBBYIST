package classNotice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classNotice.model.service.ClassNoticeService;
import classNotice.model.vo.ClassNotice;
import hobbyistClass.model.service.HClassService;
import hobbyistClass.model.vo.HClass;
import tutor.model.vo.Tutor;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/classNoticedetail.no")
public class ClassNoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassNoticeDetailServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeNo = Integer.parseInt(request.getParameter("cNo"));
		
		ClassNotice notice = new ClassNoticeService().selectClassNotice(noticeNo); 
				
		String page = null;
		if (notice != null) {
			HClass c = new HClassService().selectClass(notice.getClassNo());
			Tutor t = new HClassService().selectClassTutor(c.getTutorNo());
			
			if (c != null && t != null) {
				request.setAttribute("classnotice", notice);
				request.setAttribute("c", c);
				request.setAttribute("t", t);
				page = "WEB-INF/views/tutor/noticeDetail.jsp";
			} else {
				request.setAttribute("msg", "공지사항 상세조회 실패");
				page = "WEB-INF/views/common/errorPage.jsp";
			}
		} else {
			request.setAttribute("msg", "공지사항 상세조회 실패");
			page = "WEB-INF/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
