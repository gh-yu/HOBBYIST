package csBoard.model.vo;

import java.sql.Date;

public class CsBoard {
	
	private int reqNo;
	private String  reqCategory;
	private String reqTitle;
	private String reqContent;
	private Date reqDate;
	private int reqStatus;
	private String memberEmail;
	
	public CsBoard() {}

	public CsBoard(int reqNo, String reqCategory, String reqTitle, String reqContent, Date reqDate, int reqStatus,
			String memberEmail) {
		super();
		this.reqNo = reqNo;
		this.reqCategory = reqCategory;
		this.reqTitle = reqTitle;
		this.reqContent = reqContent;
		this.reqDate = reqDate;
		this.reqStatus = reqStatus;
		this.memberEmail = memberEmail;
	}

	public int getReqNo() {
		return reqNo;
	}

	public void setReqNo(int reqNo) {
		this.reqNo = reqNo;
	}

	public String getReqCategory() {
		return reqCategory;
	}

	public void setReqCategory(String reqCategory) {
		this.reqCategory = reqCategory;
	}

	public String getReqTitle() {
		return reqTitle;
	}

	public void setReqTitle(String reqTitle) {
		this.reqTitle = reqTitle;
	}

	public String getReqContent() {
		return reqContent;
	}

	public void setReqContent(String reqContent) {
		this.reqContent = reqContent;
	}

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public int getReqStatus() {
		return reqStatus;
	}

	public void setReqStatus(int reqStatus) {
		this.reqStatus = reqStatus;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	@Override
	public String toString() {
		return "CsBoard [reqNo=" + reqNo + ", reqCategory=" + reqCategory + ", reqTitle=" + reqTitle + ", reqContent="
				+ reqContent + ", reqDate=" + reqDate + ", reqStatus=" + reqStatus + ", memberEmail=" + memberEmail
				+ "]";
	}
	
	

}