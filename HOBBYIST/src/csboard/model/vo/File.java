package csboard.model.vo;

import java.sql.Date;

public class File {
	private int fileId; // 자동으로 생성된 번호
	private int boardId; // 파일이 속한 게시글
	private String originName;
	private String changeName; // 변경된 파일명 ex. kakkoTalk
	private String filePath;
	private Date uploadDate;
	private int fileLevel; // 0이면 썸네일, 1이면 일반사진
	private int downloadCount; 
	private String status; // 삭제를 했냐 안했냐의 여부
	
	
}
