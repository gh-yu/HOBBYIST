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

import tutee.model.servuce.TuteeService;
import tutee.model.vo.TuteeClass;

/**
 * Servlet implementation class CountTuteeMaxServlet
 */
@WebServlet("/countTuteeMax.te")
public class CountTuteeMaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountTuteeMaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		
		String time = request.getParameter("time");
		
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		
		Date revDate = null;
		String[] splitDate = date.split("-");
		int year = Integer.parseInt(splitDate[0]);
		int month = Integer.parseInt(splitDate[1]) - 1;
		int day = Integer.parseInt(splitDate[2]);
		
		String[] splitTime = time.split(":");
		int hour = Integer.parseInt(splitTime[0]);
		int minute = Integer.parseInt(splitTime[1]);		
		
		revDate = new Date(new GregorianCalendar(year, month, day, hour, minute).getTimeInMillis());
		
		TuteeClass tc = new TuteeClass(0, revDate, time, null, null, null, cNo, null);
		
		int enTuteeCount = new TuteeService().countEnrollTuteeNum(tc);
		
		PrintWriter out = response.getWriter();
		out.print(enTuteeCount);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
