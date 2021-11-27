package tutor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tutor.model.service.TutorService;
import tutor.model.vo.Tutor;

/**
 * Servlet implementation class TutorInformServlet
 */
@WebServlet("/tutorInform.me")
public class TutorInformServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorInformServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		Tutor tutor = (Tutor)session.getAttribute("tutor");
//		String memberEmail = tutor.getMemberEmail();
//		
//		Tutor t = new TutorService().selectTutor(memberEmail);
//		
//		request.setAttribute("tutor", t);
		request.getRequestDispatcher("WEB-INF/views/tutor/tutorInform.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
