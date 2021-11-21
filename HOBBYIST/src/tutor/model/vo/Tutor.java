package tutor.model.vo;

import java.sql.Date;

public class Tutor {
	private int tutorNo;
	private Date tutorEnrollDate;
	private String tutorBankAccount;
	private String tutorReport;
	private String tutorSns;
	private String tutorImgPath;
	private Date tutorImgUpdate;
	private String tutorImgOriginName;
	private String tutorImgChangeName;
	
	public Tutor() {}

	public Tutor(int tutorNo, Date tutorEnrollDate, String tutorBankAccount, String tutorReport, String tutorSns,
			String tutorImgPath, Date tutorImgUpdate, String tutorImgOriginName, String tutorImgChangeName) {
		super();
		this.tutorNo = tutorNo;
		this.tutorEnrollDate = tutorEnrollDate;
		this.tutorBankAccount = tutorBankAccount;
		this.tutorReport = tutorReport;
		this.tutorSns = tutorSns;
		this.tutorImgPath = tutorImgPath;
		this.tutorImgUpdate = tutorImgUpdate;
		this.tutorImgOriginName = tutorImgOriginName;
		this.tutorImgChangeName = tutorImgChangeName;
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

	public String getTutorImgOriginName() {
		return tutorImgOriginName;
	}

	public void setTutorImgOriginName(String tutorImgOriginName) {
		this.tutorImgOriginName = tutorImgOriginName;
	}

	public String getTutorImgChangeName() {
		return tutorImgChangeName;
	}

	public void setTutorImgChangeName(String tutorImgChangeName) {
		this.tutorImgChangeName = tutorImgChangeName;
	}

	@Override
	public String toString() {
		return "Tutor [tutorNo=" + tutorNo + ", tutorEnrollDate=" + tutorEnrollDate + ", tutorBankAccount="
				+ tutorBankAccount + ", tutorReport=" + tutorReport + ", tutorSns=" + tutorSns + ", tutorImgPath="
				+ tutorImgPath + ", tutorImgUpdate=" + tutorImgUpdate + ", tutorImgOriginName=" + tutorImgOriginName
				+ ", tutorImgChangeName=" + tutorImgChangeName + "]";
	}
	
}	