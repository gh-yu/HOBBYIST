package hobbyistClass.model.vo;

import java.sql.Date;

public class HClassFiles {
	
	private int fileNo;			// 파일 생성 번호
	private String filePath;
	private Date fileUpload;
	private String originName;
	
	private String changeName;	// 변경된 파일명
	private long fileSize;
	private String fileThumbYn;		// Y는 썸네일 N이면 일반사진
	private String fileTableName;
	private int boardNo;		// 파일이 속한 게시글
	
	public HClassFiles() {}

	public HClassFiles(int fileNo, String filePath, Date fileUpload, String originName, String changeName, long fileSize,
			String fileThumbYn, String fileTableName, int boardNo) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileUpload = fileUpload;
		this.originName = originName;
		this.changeName = changeName;
		this.fileSize = fileSize;
		this.fileThumbYn = fileThumbYn;
		this.fileTableName = fileTableName;
		this.boardNo = boardNo;
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

	public Date getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(Date fileUpload) {
		this.fileUpload = fileUpload;
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

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileThumbYn() {
		return fileThumbYn;
	}

	public void setFileThumbYn(String fileThumbYn) {
		this.fileThumbYn = fileThumbYn;
	}

	public String getFileTableName() {
		return fileTableName;
	}

	public void setFileTableName(String fileTableName) {
		this.fileTableName = fileTableName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "File [fileNo=" + fileNo + ", filePath=" + filePath + ", fileUpload=" + fileUpload + ", originName="
				+ originName + ", changeName=" + changeName + ", fileSize=" + fileSize + ", fileThumbYn=" + fileThumbYn
				+ ", fileTableName=" + fileTableName + ", boardNo=" + boardNo + "]";
	}
	
	

}