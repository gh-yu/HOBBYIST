package member.model.vo;

import java.sql.Date;

public class Member {
	
	private String userEmail;
	private String userName;
	private String nickName;
	private String phone;
	private String pwd;
	private Date enrollDate;
	private int status;
	private String grade;
	
	public Member() {}

	
	
	public Member(String userEmail, String userName, String nickName, String phone) {
		super();
		this.userEmail = userEmail;
		this.userName = userName;
		this.nickName = nickName;
		this.phone = phone;
	}



	public Member(String userEmail, String userName, String nickName, String phone, String pwd, Date enrollDate,
			int status, String grade) {
		super();
		this.userEmail = userEmail;
		this.userName = userName;
		this.nickName = nickName;
		this.phone = phone;
		this.pwd = pwd;
		this.enrollDate = enrollDate;
		this.status = status;
		this.grade = grade;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Member [userEmail=" + userEmail + ", userName=" + userName + ", nickName=" + nickName + ", phone="
				+ phone + ", pwd=" + pwd + ", enrollDate=" + enrollDate + ", status=" + status + ", grade=" + grade
				+ "]";
	}

	
}
