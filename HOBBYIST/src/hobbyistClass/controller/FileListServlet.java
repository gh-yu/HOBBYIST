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
 * Servlet implementation class FileListServlet
 */
@WebServlet("/classopenlist.th")
public class FileListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HClassService hService = new HClassService();
		
		// 게시판 리스트 가져오기
		ArrayList<HClass> cList = hService.selectTList(1);
		
		// 파일 리스트 가져오기
		ArrayList<HClassFile> cfList = hService.selectTList(2);
		
		String page = null;
		if (cList != null && cfList != null) {
			request.setAttribute("cList", cList);
			request.setAttribute("cfList", cfList);
			page = "WEB-INF/views/thumbnail/thumbnailList.jsp";
		} else {
			request.setAttribute("msg", "사진게시판 조회 실패");
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
