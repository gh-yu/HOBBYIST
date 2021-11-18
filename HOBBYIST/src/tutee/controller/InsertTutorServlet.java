package tutee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tutor.model.service.TutorService;
import tutor.model.vo.Tutor;

/**
 * Servlet implementation class InsertTutorServlet
 */
@WebServlet("/tutorRegister.me")
public class InsertTutorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTutorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String NickName = request.getParameter("tNickName");
		String Phone = request.getParameter("tPhone");
		String Sns = request.getParameter("tSns");
		String Report = request.getParameter("tReport");
		
		Tutor tutor = new Tutor(0, NickName, null, null, Report, Sns, null, null, null, 0, null, Phone);
		int result = new TutorService().insertTutor(tutor);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "튜터 신청에 실패했습니다.");
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
