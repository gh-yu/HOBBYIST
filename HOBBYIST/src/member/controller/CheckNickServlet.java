package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class CheckNickFormServlet
 */
@WebServlet("/checkNick.me")
public class CheckNickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckNickServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputNickName = request.getParameter("nickName").trim();
		String originNickName =((Member)request.getSession().getAttribute("loginUser")).getNickName().trim();
	
		int result = 0;
		if (inputNickName.equals("")) {
			request.setAttribute("msg", "닉네임이 빈 칸입니다.");
		} else if (originNickName.equals(inputNickName)) {
			request.setAttribute("msg", "닉네임 변경 후 중복확인 버튼을 눌러주세요.");
		} else {
			result = new MemberService().checkNick(inputNickName);
			if (result > 0) {
				request.setAttribute("msg", "이미 사용 중인 닉네임입니다.");
			} else {
				request.setAttribute("msg", "사용 가능한 닉네임입니다.");
			}
		} 
		request.getSession().setAttribute("nickCheckResult", result);
		request.getRequestDispatcher("WEB-INF/views/member/checkNick.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
