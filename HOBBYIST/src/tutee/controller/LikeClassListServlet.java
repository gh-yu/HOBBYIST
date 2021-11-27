package tutee.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hobbyistClass.model.service.HClassService;
import hobbyistClass.model.vo.HClass;
import hobbyistClass.model.vo.HClassFile;
import member.model.vo.Member;
import tutee.model.servuce.TuteeService;
import tutee.model.vo.LikeClass;

/**
 * Servlet implementation class LikeClassListServlet
 */
@WebServlet("/likedClass.te")
public class LikeClassListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeClassListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberEmail = ((Member)request.getSession().getAttribute("loginUser")).getMemberEmail();
		
		ArrayList<LikeClass> lcList = new TuteeService().selectLikeClass(memberEmail);
		
		ArrayList<HClassFile> fileList = new HClassService().selectFileList();

		String page = null;
		if (lcList != null && fileList != null) {
			page = "WEB-INF/views/tutee/likeClassList.jsp";
			request.setAttribute("lcList", lcList);
			request.setAttribute("fileList", fileList);
		} else {
			request.setAttribute("msg", "찜한 클래스 리스트 조회 실패");
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