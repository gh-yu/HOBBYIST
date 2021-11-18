package hobbyistClass.model.vo;

import java.sql.Date;

public class Attachment {
	private int fileNo; // 자동으로 생성된 번호
	private String filePath;
	private Date fileUpload;
	private String originName;
	private String changeName; // 변경된 파일명 ex. kakkoTalk
	private int fileSize;
	private String fileThumbYN; // 0이면 썸네일, 1이면 일반사진
	private int board_No;		// 파일이 속한 게시글
	private String fileStatus; // 삭제를 했냐 안했냐의 여부
	private int downloadCount;
	
	public Attachment() {}
	public Attachment(int fileNo, String filePath, Date fileUpload, String originName, String changeName, int fileSize,
			String fileThumbYN, int board_No, String fileStatus, int downloadCount) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileUpload = fileUpload;
		this.originName = originName;
		this.changeName = changeName;
		this.fileSize = fileSize;
		this.fileThumbYN = fileThumbYN;
		this.board_No = board_No;
		this.fileStatus = fileStatus;
		this.downloadCount = downloadCount;
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
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileThumbYN() {
		return fileThumbYN;
	}
	public void setFileThumbYN(String fileThumbYN) {
		this.fileThumbYN = fileThumbYN;
	}
	public int getBoard_No() {
		return board_No;
	}
	public void setBoard_No(int board_No) {
		this.board_No = board_No;
	}
	public String getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}
	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}
	
	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileUpload=" + fileUpload
				+ ", originName=" + originName + ", changeName=" + changeName + ", fileSize=" + fileSize
				+ ", fileThumbYN=" + fileThumbYN + ", board_No=" + board_No + ", fileStatus=" + fileStatus
				+ ", downloadCount=" + downloadCount + "]";
	}
	
	
	
	
}
