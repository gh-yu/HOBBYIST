package tutor.model.vo;

import java.sql.Date;

public class Tutor {
	private int tutorNo;
	private String tutorNickName;
	private Date tutorEnrollDate;
	private String tutorBankAccount;
	private String tutorReport;
	private String tutorSns;
	private String tutorImgPath;
	private Date tutorImgUpdate;
	private String tutorImgName;
	private int tutorImagSize;
	private String memberEmail;			// MEMBER테이블에서 JOIN
	private String memberPhone;
	
	public Tutor() {}

	public Tutor(int tutorNo, String tutorNickName, Date tutorEnrollDate, String tutorBankAccount, String tutorReport,
			String tutorSns, String tutorImgPath, Date tutorImgUpdate, String tutorImgName, int tutorImagSize,
			String memberEmail, String memberPhone) {
		super();
		this.tutorNo = tutorNo;
		this.tutorNickName = tutorNickName;
		this.tutorEnrollDate = tutorEnrollDate;
		this.tutorBankAccount = tutorBankAccount;
		this.tutorReport = tutorReport;
		this.tutorSns = tutorSns;
		this.tutorImgPath = tutorImgPath;
		this.tutorImgUpdate = tutorImgUpdate;
		this.tutorImgName = tutorImgName;
		this.tutorImagSize = tutorImagSize;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
	}

	public int getTutorNo() {
		return tutorNo;
	}

	public void setTutorNo(int tutorNo) {
		this.tutorNo = tutorNo;
	}

	public String getTutorNickName() {
		return tutorNickName;
	}

	public void setTutorNickName(String tutorNickName) {
		this.tutorNickName = tutorNickName;
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

	public String getTutorSns() {
		return tutorSns;
	}

	public void setTutorSns(String tutorSns) {
		this.tutorSns = tutorSns;
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

	public int getTutorImagSize() {
		return tutorImagSize;
	}

	public void setTutorImagSize(int tutorImagSize) {
		this.tutorImagSize = tutorImagSize;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getTutorPhone() {
		return memberPhone;
	}

	public void setTutorPhone(String tutorPhone) {
		this.memberPhone = tutorPhone;
	}

	@Override
	public String toString() {
		return "Tutor [tutorNo=" + tutorNo + ", tutorNickName=" + tutorNickName + ", tutorEnrollDate=" + tutorEnrollDate
				+ ", tutorBankAccount=" + tutorBankAccount + ", tutorReport=" + tutorReport + ", tutorSns=" + tutorSns
				+ ", tutorImgPath=" + tutorImgPath + ", tutorImgUpdate=" + tutorImgUpdate + ", tutorImgName="
				+ tutorImgName + ", tutorImagSize=" + tutorImagSize + ", memberEmail=" + memberEmail + ", tutorPhone="
				+ memberPhone + "]";
	}
}

	