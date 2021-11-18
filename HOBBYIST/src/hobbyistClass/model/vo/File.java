package hobbyistClass.model.vo;

import java.sql.Date;

public class File {
	private int fileNo; // 자동으로 생성된 번호
	private String filePath;
	private Date uploadDate;
	private String originName;
	private String changeName;
	private int fileThumbYn; // 0이면 썸네일, 1이면 일반사진
	private String fileTablename; 
	private int boardNo; // 파일이 속한 게시글 번호
	private int status; // 삭제를 했냐 안했냐의 여부
	
	public File() {}

	public File(int fileNo, String filePath, Date uploadDate, String originName, String changeName, int fileThumbYn,
			String fileTablename, int boardNo, int status) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.originName = originName;
		this.changeName = changeName;
		this.fileThumbYn = fileThumbYn;
		this.fileTablename = fileTablename;
		this.boardNo = boardNo;
		this.status = status;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getFileThumbYn() {
		return fileThumbYn;
	}

	public void setFileThumbYn(int fileThumbYn) {
		this.fileThumbYn = fileThumbYn;
	}

	public String getFileTablename() {
		return fileTablename;
	}

	public void setFileTablename(String fileTablename) {
		this.fileTablename = fileTablename;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "File [fileNo=" + fileNo + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", originName="
				+ originName + ", changeName=" + changeName + ", fileThumbYn=" + fileThumbYn + ", fileTablename="
				+ fileTablename + ", boardNo=" + boardNo + ", status=" + status + "]";
	}
}
