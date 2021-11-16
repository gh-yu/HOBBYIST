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
 * Servlet implementation class CSBoardInsertServlet
 */
@WebServlet("/insert.cs")
public class CSBoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CSBoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String category = request.getParameter("category").trim();
		String nickName = request.getParameter("nickNmae");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		
		System.out.println(category);
		RequestBoard board = new RequestBoard();
		board.setReqTitle(title);
		board.setReqCategory(category);
		board.setNickName(nickName);
		board.setReqWriter(email);
		board.setReqContent(content);
		
		int result = new CSBoardService().insertBoard(board);
		
		if (result > 0) {
			response.sendRedirect("list.cs");
		} else {
			request.setAttribute("msg", "게시글 작성 실패");
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
