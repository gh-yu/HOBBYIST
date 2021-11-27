package tutor.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import com.oreilly.servlet.MultipartRequest;
import common.MyFileRenamePolicy;
import member.model.vo.Member;
import tutor.model.service.TutorService;
import tutor.model.vo.Files;
import tutor.model.vo.Tutor;

/**
 * Servlet implementation class UpdateTutorServlet
 */
@WebServlet("/updateComplete.me")
public class UpdateTutorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTutorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
		
		int maxSize = 1024 * 1024 * 10;
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "uploadFiles/";
		
//		File f = new File(savePath); 
//		if(!f.exists()) {
//			f.mkdirs();
//		}
//		
		System.out.println("경로:"+savePath);
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
//		String saveFiles = null; // 파일의 바뀐 이름 저장
//		String originFiles = null;	// 파일의 원래 이름 저장
//		System.out.println(multiRequest);
//		Enumeration<String> files = multiRequest.getFileNames();
//		if(files.hasMoreElements()) {
//			String name = files.nextElement();
//			System.out.println("name:"+name);
//			
//			if(multiRequest.getFilesystemName(name)!=null) {	// name=null이면 사진이 없는 것
//				saveFiles = multiRequest.getFilesystemName(name);	
//				originFiles = multiRequest.getOriginalFileName(name);
//				
//			
//			}
//		}
		
		String fileName = multiRequest.getFilesystemName("target_img");
		String original = multiRequest.getOriginalFileName("profileImg");
		String type = multiRequest.getContentType("profileImg");
		File f = multiRequest.getFile("profileImg");
		if(!f.exists()) {
			f.mkdirs();
		}
		
		
//		System.out.println("파일즈:"+files);
//		System.out.println("files.nextElement():"+files.nextElement());
//		System.out.println("saveFiles:"+saveFiles);
//		System.out.println("originFiles:"+originFiles);
		System.out.println("파일네임:"+fileName);
		System.out.println("original:"+original);
		System.out.println("타입:"+type);
		
		String report = multiRequest.getParameter("report");
		String sns = multiRequest.getParameter("sns");
		String memberEmail = ((Member)request.getSession().getAttribute("loginUser")).getMemberEmail();
		
		System.out.println("myReport:"+report);
		System.out.println("mySns:"+sns);
		System.out.println("email:"+memberEmail);
		
		Tutor t = new Tutor(0, null, report, sns, savePath, null, original, fileName);
		
//		System.out.println("튜터"+t);
		
		int result = new TutorService().updateTutor(t, memberEmail);	// 입력한 정보 받아오기
		System.out.println("result:"+result);
		
		if(result > 0) {	// 받아온 정보 화면에 뿌리기 
			Tutor tutor = new TutorService().selectTutor(memberEmail);
			request.getSession().setAttribute("tutor", tutor);
			request.getRequestDispatcher("WEB-INF/views/tutor/tutorInform.jsp").forward(request, response);
//			response.sendRedirect("tutorInform.me");
		} else {
			request.setAttribute("msg", "튜터 정보 수정 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
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
