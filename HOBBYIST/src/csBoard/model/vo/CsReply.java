package csBoard.model.vo;

import java.sql.Date;

public class CsReply{
	
	private int replyNo;
	private String replyBoardCount;
	private Date replyDate;
	private int reqNo;
	
	public CsReply() {}

	public CsReply(int replyNo, String replyBoardCount, Date replyDate, int reqNo) {
		super();
		this.replyNo = replyNo;
		this.replyBoardCount = replyBoardCount;
		this.replyDate = replyDate;
		this.reqNo = reqNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyBoardCount() {
		return replyBoardCount;
	}

	public void setReplyBoardCount(String replyBoardCount) {
		this.replyBoardCount = replyBoardCount;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public int getReqNo() {
		return reqNo;
	}

	public void setReqNo(int reqNo) {
		this.reqNo = reqNo;
	}

	@Override
	public String toString() {
		return "CsReply [replyNo=" + replyNo + ", replyBoardCount=" + replyBoardCount + ", replyDate=" + replyDate
				+ ", reqNo=" + reqNo + "]";
	}
	
	
	

}