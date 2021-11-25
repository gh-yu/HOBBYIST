package tutee.model.vo;

import java.sql.Date;

public class LikeClass {
	private int classNo;
	private String ClassName;
 	private String memberEmail;
	private Date clipDate;
	
	public LikeClass() {}

	public LikeClass(int classNo, String className, String memberEmail, Date clipDate) {
		super();
		this.classNo = classNo;
		ClassName = className;
		this.memberEmail = memberEmail;
		this.clipDate = clipDate;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public String getClassName() {
		return ClassName;
	}

	public void setClassName(String className) {
		ClassName = className;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public Date getClipDate() {
		return clipDate;
	}

	public void setClipDate(Date clipDate) {
		this.clipDate = clipDate;
	}

	@Override
	public String toString() {
		return "LikeClass [classNo=" + classNo + ", ClassName=" + ClassName + ", memberEmail=" + memberEmail
				+ ", clipDate=" + clipDate + "]";
	}

}