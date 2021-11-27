package hobbyistClass.controller;

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
import hobbyistClass.model.vo.HClassSchedule;
import tutor.model.vo.Tutor;

/**
 * Servlet implementation class ClassOpenDetailServlet
 */
@WebServlet("/classManagement.tt")
public class ClassOpenDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassOpenDetailServlet() {
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
		
		System.out.println("cNo디테일 : " + cNo );
		
		ArrayList<HClassFile> fileList = hService.selectDetailFileList(cNo);
		
		ArrayList<HClassSchedule> sList = hService.selectScheduleList(cNo); 
				
		Tutor tutor = hService.selectClassTutor(c.getTutorNo());
		System.out.println("tutor :" +tutor );
		ArrayList<ClassNotice> list = new ClassNoticeService().selectClassList();
		
				
		String page = null;
		if (c != null && fileList != null && sList != null && tutor != null) {
			
			request.setAttribute("c", c);
			request.setAttribute("fileList", fileList);
			request.setAttribute("tutor", tutor);
			request.setAttribute("sList", sList);
			request.setAttribute("list", list);
			page = "WEB-INF/views/tutor/myPageClassManagement.jsp";
		
			 
		} else {
			request.setAttribute("msg", "클래스 상세보기 실패");
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
