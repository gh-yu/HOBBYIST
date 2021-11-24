package tutee.model.vo;

import java.sql.Date;

public class TuteeClass {
	
	private int tuteeClassNo;
	private Date tueeClassRevDate;
	private String tuteeClassStatus;
	private int classNo;
	private String memberEmail;
	
	public TuteeClass() {}

	public TuteeClass(int tuteeClassNo, Date tueeClassRevDate, String tuteeClassStatus, int classNo,
			String memberEmail) {
		super();
		this.tuteeClassNo = tuteeClassNo;
		this.tueeClassRevDate = tueeClassRevDate;
		this.tuteeClassStatus = tuteeClassStatus;
		this.classNo = classNo;
		this.memberEmail = memberEmail;
	}

	public int getTuteeClassNo() {
		return tuteeClassNo;
	}

	public void setTuteeClassNo(int tuteeClassNo) {
		this.tuteeClassNo = tuteeClassNo;
	}

	public Date getTueeClassRevDate() {
		return tueeClassRevDate;
	}

	public void setTueeClassRevDate(Date tueeClassRevDate) {
		this.tueeClassRevDate = tueeClassRevDate;
	}

	public String getTuteeClassStatus() {
		return tuteeClassStatus;
	}

	public void setTuteeClassStatus(String tuteeClassStatus) {
		this.tuteeClassStatus = tuteeClassStatus;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	@Override
	public String toString() {
		return "TuteeClass [tuteeClassNo=" + tuteeClassNo + ", tueeClassRevDate=" + tueeClassRevDate
				+ ", tuteeClassStatus=" + tuteeClassStatus + ", classNo=" + classNo + ", memberEmail=" + memberEmail
				+ "]";
	}
	
	

}