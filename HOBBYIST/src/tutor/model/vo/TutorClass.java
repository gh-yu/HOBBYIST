package tutor.model.vo;

import java.sql.Date;

public class TutorClass {

	private int tutorNo;
	private Date tutorEnrollDate;
	private String tutorBankAccount;
	private String tutorReport;
	private String tutorSNS;
	private String tutorImgPath;
	private Date tutorImgUpdate;
	private String tutorImgName;
	private int tutorImgSize;
	private String MemberEmail;
	private String MemberGrade;
	
	public TutorClass( ) {}
	

	public TutorClass(int tutorNo, Date tutorEnrollDate, String tutorBankAccount, String tutorReport, String tutorSNS,
			String tutorImgPath, Date tutorImgUpdate, String tutorImgName, int tutorImgSize, String memberEmail,
			String memberGrade ) {
		super();
		this.tutorNo = tutorNo;
		this.tutorEnrollDate = tutorEnrollDate;
		this.tutorBankAccount = tutorBankAccount;
		this.tutorReport = tutorReport;
		this.tutorSNS = tutorSNS;
		this.tutorImgPath = tutorImgPath;
		this.tutorImgUpdate = tutorImgUpdate;
		this.tutorImgName = tutorImgName;
		this.tutorImgSize = tutorImgSize;
		MemberEmail = memberEmail;
		MemberGrade = memberGrade;
		
	}

	public int getTutorNo() {
		return tutorNo;
	}
	public void setTutorNo(int tutorNo) {
		this.tutorNo = tutorNo;
	}
	public Date getTutorEnrollDate() {
		return tutorEnrollDate;
	}
	public void setTutorEnrollDate(Date tutorEnrollDate) {
		this.tutorEnrollDate = tutorEnrollDate;
	}
	public String getTutorBankAccount() {
		return tutorBankAccount;
	}
	public void setTutorBankAccount(String tutorBankAccount) {
		this.tutorBankAccount = tutorBankAccount;
	}
	public String getTutorReport() {
		return tutorReport;
	}
	public void setTutorReport(String tutorReport) {
		this.tutorReport = tutorReport;
	}
	public String getTutorSNS() {
		return tutorSNS;
	}
	public void setTutorSNS(String tutorSNS) {
		this.tutorSNS = tutorSNS;
	}
	public String getTutorImgPath() {
		return tutorImgPath;
	}
	public void setTutorImgPath(String tutorImgPath) {
		this.tutorImgPath = tutorImgPath;
	}
	public Date getTutorImgUpdate() {
		return tutorImgUpdate;
	}
	public void setTutorImgUpdate(Date tutorImgUpdate) {
		this.tutorImgUpdate = tutorImgUpdate;
	}
	public String getTutorImgName() {
		return tutorImgName;
	}
	public void setTutorImgName(String tutorImgName) {
		this.tutorImgName = tutorImgName;
	}
	public int getTutorImgSize() {
		return tutorImgSize;
	}
	public void setTutorImgSize(int tutorImgSize) {
		this.tutorImgSize = tutorImgSize;
	}
	public String getMemberEmail() {
		return MemberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		MemberEmail = memberEmail;
	}
	public String getMemberGrade() {
		return MemberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		MemberGrade = memberGrade;
	}
	@Override
	public String toString() {
		return "TutorClass [tutorNo=" + tutorNo + ", tutorEnrollDate=" + tutorEnrollDate + ", tutorBankAccount="
				+ tutorBankAccount + ", tutorReport=" + tutorReport + ", tutorSNS=" + tutorSNS + ", tutorImgPath="
				+ tutorImgPath + ", tutorImgUpdate=" + tutorImgUpdate + ", tutorImgName=" + tutorImgName
				+ ", tutorImgSize=" + tutorImgSize + ", MemberEmail=" + MemberEmail + ", MemberGrade=" + MemberGrade
				+ "]";
	}
	
	
	
}