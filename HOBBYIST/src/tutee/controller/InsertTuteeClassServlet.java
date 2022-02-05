package tutee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hobbyistClass.model.service.HClassService;
import hobbyistClass.model.vo.HClass;
import member.model.vo.Member;
import tutee.model.servuce.TuteeService;
import tutee.model.vo.TuteeClass;

/**
 * Servlet implementation class InsertTuteeClassServlet
 */
@WebServlet("/applyClass.te")
public class InsertTuteeClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTuteeClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String revTime = request.getParameter("time");
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		String email = ((Member)request.getSession().getAttribute("loginUser")).getMemberEmail();
		
		String date = request.getParameter("date");
		
		Date revDate = null;
		String[] splitDate = date.split("-");
		int year = Integer.parseInt(splitDate[0]);
		int month = Integer.parseInt(splitDate[1]) - 1;
		int day = Integer.parseInt(splitDate[2]);
		
		String[] splitTime = revTime.split(":");
		int hour = Integer.parseInt(splitTime[0]);
		int minute = Integer.parseInt(splitTime[1]);
		
		revDate = new Date(new GregorianCalendar(year, month, day, hour, minute).getTimeInMillis());
		
		TuteeClass tc = new TuteeClass(0, revDate, revTime, null, null, null, cNo, email);
		
		int enTuteeCount = new TuteeService().countEnrollTuteeNum(tc);
		
		HClass c = new HClassService().selectClass(cNo);
		
		int result = 0;
		if (enTuteeCount >= c.getClassTuteeMax()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('선택하신 일정은 정원 초과입니다.')");
			script.println("history.back()");
			script.println("</script>");		
		} else {
			result = new TuteeService().insertTuteeClass(tc);
		}
		
		if (result > 0) {
			 response.sendRedirect("detail.hcl?cNo=" + cNo);
		} else {
			request.setAttribute("msg", "클래스 예약 등록 실패");
			request.getRequestDispatcher("WEB-INF/common/errorPage.jsp");
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
