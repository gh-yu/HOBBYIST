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
@WebServlet("/update.cs")
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
		String nickName = request.getParameter("nickNmae");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		
		RequestBoard board = new RequestBoard();
		board.setReqTitle(title);
		board.setReqCategory(category);
		board.setNickName(nickName);
		board.setReqWriter(email);
		board.setReqContent(content);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
