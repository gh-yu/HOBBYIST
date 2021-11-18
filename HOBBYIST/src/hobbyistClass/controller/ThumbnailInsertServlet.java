package hobbyistClass.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.multi.MultiOptionPaneUI;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import hobbyistClass.model.service.HClassService;
import hobbyistClass.model.vo.Attachment;
import hobbyistClass.model.vo.HClass;
import member.model.vo.Member;


/**
 * Servlet implementation class ThumbnailInsertServlet
 */
@WebServlet("/thumbinsert.th")
public class ThumbnailInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbnailInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// form태그의 속성으로 encType="multipart/form-data" 설정하면 위와 같이 String으로 가져왔을때 인지하지 못함 -> MultipartRequest클래스 객체 생성하여 받아줘야 함
		
		// enctype(인코딩타입)이 multipart/form-date로 전송되었는지 확인 
		if (ServletFileUpload.isMultipartContent(request)) {
			
			// 파일 업로드 처리를 위한 변수 설정
			int maxSize = 1024*1024*10; 
			String root = request.getSession().getServletContext().getRealPath("/"); // 웹 서버 컨테이너 경로 추출 : WebContent
			String savePath = root + "thumbnail_uploadFiles/";
			
			File f = new File(savePath); 
			if (!f.exists()) { 
				f.mkdirs(); 
			}

			// MultipartRequest : 파일 형식 가져오려면 필요한 클래스 <- 이 클래스를 쓰려면 jar라이브러리 필요
			// cos.jar 라이브러리 먼저 lib폴더에 복사 후  -> MultipartRequest클래스 import 가능
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy()); // 매개변수 있는 생성자로만 생성 가능
			//매개변수 -> request, saveDirectory : 어디에 저장할 건지,  maxPostSize : 최대 크기, encoding : 인코딩타입, policy : 파일 이름 바꾸는 규약    
			
			ArrayList<String> saveFiles = new ArrayList<String>();		// 파일의 바뀐 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>();	// 파일의 원래 이름을 저장할 ArryaList
			
			// multiRequest.getFileNames() : request.getParameter()처럼 form에서 넘어온  file정보 가져옴, 전송 순서의 역순으로 가져옴 thumbnailImg4, ..3, ..2, ..1
			Enumeration<String> files = multiRequest.getFileNames(); // multiRequest.getFileNames()의 반환값 -> Enumeration : iterator와 기능이 같음 
			while(files.hasMoreElements()) {
				
				String name = files.nextElement(); // files.nextElement() 출력하면 thumbnailImg4, ..3, ..2, ..1 나옴
				
				if (multiRequest.getFilesystemName(name) != null) { // rename이 된 파일명(바뀐 파일명)을 가져옴, 사진이 들어가있지 않을때 null일 수도 있음, 사진 들어가있는 것만 가져오기 (!= null)
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}

			int category = Integer.parseInt(multiRequest.getParameter("category"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String startdate = multiRequest.getParameter("fromDate");
			String enddate = multiRequest.getParameter("toDate");
			double time = Double.parseDouble(multiRequest.getParameter("time"));            
			int min = Integer.parseInt(multiRequest.getParameter("min"));
			int max = Integer.parseInt(multiRequest.getParameter("max"));
			int fee = Integer.parseInt(multiRequest.getParameter("fee"));
			
			Date sdate = null;
			if(startdate.equals("")) { // 관리자가 date를 입력하지 않았을 경우 -> 오늘날짜로 넣음
				sdate = new Date(new GregorianCalendar().getTimeInMillis());
			} else {
				String[] splitDate = startdate.split("-");
				int year = Integer.parseInt(splitDate[0]);
				int month = Integer.parseInt(splitDate[1]) - 1;
				int day = Integer.parseInt(splitDate[2]);
			
				sdate = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
			}
			
			Date edate = null;
			if(enddate.equals("")) { // 관리자가 date를 입력하지 않았을 경우 -> 오늘날짜로 넣음
				edate = new Date(new GregorianCalendar().getTimeInMillis());
			} else {
				String[] splitDate = enddate.split("-");
				int year = Integer.parseInt(splitDate[0]);
				int month = Integer.parseInt(splitDate[1]) - 1;
				int day = Integer.parseInt(splitDate[2]);
			
				edate = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
			}
			
			
			
							
			HClass hc = new HClass(0, title, null, edate, null, null, "A", time, min, max, content, fee, null, category, startdate);
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			for(int i = originFiles.size() - 1; i >= 0; i--) { // 역순으로 파일 저장되어 있기 때문에 거기서 또 역순으로 저장하기
				Attachment a = new Attachment();
				a.setFilePath(savePath);
				a.setOriginName(originFiles.get(i));
				a.setChangeName(saveFiles.get(i));
				
				if (i == originFiles.size() - 1) { // 맨 끝에 저장된 사진이라면(맨 처음 입력받았던 썸네일 사진이라면)
					a.setFileStatus("Y"); // fileLevel이 0 이면 썸네일로 약속
				} else {
					a.setFileStatus("N");
				}
				
				fileList.add(a);
			}
			
			int result = new HClassService().inserThumbnail(hc, fileList); // DB 저장을 위해 게시판과 파일리스트를 보냄 
			
			if (result >= 1+fileList.size()) { // 게시판
				response.sendRedirect("list.th");
			} else {
				request.setAttribute("msg", "사진 게시글 저장 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			
				for (int i =0; i < saveFiles.size(); i++) {
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete(); // 만약 게시판이나 사진들 중 하나라도 insert가 안된게 있다면 저장된 파일들 다 삭제
				}
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
