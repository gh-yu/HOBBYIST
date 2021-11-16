package classNotice.model.vo;

import java.sql.Date;

public class ClassNotice {

	private int classBoardNo;
	private String classBoardName;
	private String classBoardContent;
	private int classBoardViews;
	private Date classBoardDate;
	private int classBoardStatus;
	private int classNo;

	public ClassNotice() {
	}

	public ClassNotice(int classBoardNo, String classBoardName, String classBoardContent, int classBoardViews,
			Date classBoardDate, int classBoardStatus, int classNo) {
		super();
		this.classBoardNo = classBoardNo;
		this.classBoardName = classBoardName;
		this.classBoardContent = classBoardContent;
		this.classBoardViews = classBoardViews;
		this.classBoardDate = classBoardDate;
		this.classBoardStatus = classBoardStatus;
		this.classNo = classNo;
	}
	
	

	public int getClassBoardNo() {
		return classBoardNo;
	}

	public void setClassBoardNo(int classBoardNo) {
		this.classBoardNo = classBoardNo;
	}

	public String getClassBoardName() {
		return classBoardName;
	}

	public void setClassBoardName(String classBoardName) {
		this.classBoardName = classBoardName;
	}

	public String getClassBoardContent() {
		return classBoardContent;
	}

	public void setClassBoardContent(String classBoardContent) {
		this.classBoardContent = classBoardContent;
	}

	public int getClassBoardViews() {
		return classBoardViews;
	}

	public void setClassBoardViews(int classBoardViews) {
		this.classBoardViews = classBoardViews;
	}

	public Date getClassBoardDate() {
		return classBoardDate;
	}

	public void setClassBoardDate(Date classBoardDate) {
		this.classBoardDate = classBoardDate;
	}

	public int getClassBoardStatus() {
		return classBoardStatus;
	}

	public void setClassBoardStatus(int classBoardStatus) {
		this.classBoardStatus = classBoardStatus;
	}

	public int getclassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}


}