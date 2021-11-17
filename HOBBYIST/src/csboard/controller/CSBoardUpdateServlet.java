package csBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import csBoard.model.service.CSBoardService;
import csBoard.model.vo.RequestBoard;

/**
 * Servlet implementation class CSBoardUpdateServlet
 */
@WebServlet("/updateBoard.cs")
public class CSBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CSBoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		String contactEmail = request.getParameter("contactEmail");
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		
		RequestBoard board = new RequestBoard();
		board.setReqTitle(title);
		board.setReqCategory(category);
		board.setReqContent(content);
		board.setContactEmail(contactEmail);
		board.setReqNo(rNo);
		
		int result = new CSBoardService().updateBoard(board);
		System.out.println("controller" + result);
		if (result > 0) {
			response.sendRedirect("detail.cs?rNo=" + rNo);
		} else {
			request.setAttribute("msg", "1:1문의글 수정 실패");
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
