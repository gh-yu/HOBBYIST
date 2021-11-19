package hobbyistClass.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hobbyistClass.model.service.HClassService;
import hobbyistClass.model.vo.HClass;


/**
 * Servlet implementation class ClassApvServlet
 */
@WebServlet("/confirmClass.cl")
public class ClassConfrimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassConfrimServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		String date = request.getParameter("classEnrollDate");
		int classNo = Integer.parseInt(request.getParameter("classNo"));
//		int tutorNo = Integer.parseInt(request.getParameter("tutorNo"));
//		String categoryName = request.getParameter("categoryName");
//		String className = request.getParameter("className");
//		String classApvYn = request.getParameter("classApvYn");
////		String classApvDate = request.getParameter("classApvDate"); //form에서 넘겨받은 데이터 없음
//						
//		//request.getParameter("classEnrollDate")로 받으온 String 값을 Date로 변환하기 위함
//		String date = request.getParameter("classEnrollDate");
//		Date classEnrollDate = null;
//		Date classEndDate = null;
//		Date classStartDate = null;
//		
//		if(date.equals("")) {
//			classEnrollDate = new Date(new GregorianCalendar().getTimeInMillis());
//		} else {
//			String[] dateSplit = date.split("-");
//			int year = Integer.parseInt(dateSplit[0]);
//			int month = Integer.parseInt(dateSplit[1]) -1;
//			int day = Integer.parseInt(dateSplit[2]);
//			
//			classEnrollDate = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
//		}
//		
//		Date classApvDate = new Date(new GregorianCalendar().getTimeInMillis());
//
//		HClass h = new HClass(classNo, className, classEnrollDate, classEndDate, classApvDate, classApvYn, "", 0.0, 0, 0, "", 0, tutorNo, 0, classStartDate);
//		
		HClass apvList = new HClassService().selectApvList(classNo);
		request.setAttribute("apvList", apvList);
		
		int result = new HClassService().confirmClass(apvList);
		
		System.out.println(apvList);
		
		if(result > 0) {
			request.setAttribute("apvList", apvList);
			request.getRequestDispatcher("WEB-INF/views/admin/classApvList.jsp").forward(request, response);

		} else {
			request.setAttribute("msg", "클래스 승인 실패");
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
