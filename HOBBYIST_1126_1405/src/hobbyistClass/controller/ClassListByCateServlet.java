package hobbyistClass.controller;

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

/**
 * Servlet implementation class ClassListByCateServlet
 */
@WebServlet("/classListByCate")
public class ClassListByCateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassListByCateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cateName = request.getParameter("cate");
		System.out.println(cateName);
		
		HClassService hService = new HClassService();
		ArrayList<HClass> classList = hService.selectClassListByCate(cateName);
		ArrayList<HClassFile> fileList = hService.selectFileList();

		String page = null;
		if (classList != null && fileList != null) {
			request.setAttribute("classCateList", classList);
			request.setAttribute("fileList", fileList);
			page = "WEB-INF/views/hobbyistClass/classByCtegory.jsp";
			
		} else {
			request.setAttribute("msg", "클래스 리스트 조회 실패");
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