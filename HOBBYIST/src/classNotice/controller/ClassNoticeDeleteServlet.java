package classNotice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classNotice.model.service.ClassNoticeService;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/classNoticeDelete.no")
public class ClassNoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassNoticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int del = Integer.parseInt(request.getParameter("no"));
		int classno = Integer.parseInt(request.getParameter("cNo"));
	
		//System.out.println("cnodelete: "+del);
		int result = new ClassNoticeService().deleteClassNotice(del);

//		int cNoselect = new ClassNoticeService().selectcNo(classno);
		if(result > 0) {
			response.sendRedirect("classManagement.tt?cNo=" + classno);
//			request.getRequestDispatcher("WEB-INF/views/tutor/myPageClassManagement.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "공지사항 삭제 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
