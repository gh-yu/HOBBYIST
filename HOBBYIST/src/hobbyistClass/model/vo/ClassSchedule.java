package hobbyistClass.model.vo;

import java.sql.Date;

public class ClassSchedule {
	
	private int classScheduleNo; // 클래스 스케줄 넘버
	private int classScheduleDay; // 클래스 스케줄 일자 (0 ~ 6)
	private Date classStartTime; // 클래스 수업시간 (2시간)
	private int classNo; // 클래스 번호 
/* private String className; // 클래스 이름 
	private String classContent; // 클래스 소개 내용
	private Date classTime; // 클래스 시각?  
	private int classFee; // 클래스 비용
	private String memberGrade; // 멤버 등급 (튜터, 튜티 구분)
	private String memberEmail; // 멤버 이메일 */
	
	public ClassSchedule() {}

	public ClassSchedule(int classScheduleNo, int classScheduleDay, Date classStartTime, int classNo,
			String className, String classContent, Date classTime, int classFee, String memberGrade,
			String memberEmail) {
		super();
		this.classScheduleNo = classScheduleNo;
		this.classScheduleDay = classScheduleDay;
		this.classStartTime = classStartTime;
		this.classNo = classNo;
//		this.className = className;
//		this.classContent = classContent;
//		this.classTime = classTime;
//		this.classFee = classFee;
//		this.memberGrade = memberGrade;
//		this.memberEmail = memberEmail;
	}

	public int getClassScheduleNo() {
		return classScheduleNo;
	}

	public void setClassScheduleNo(int classScheduleNo) {
		this.classScheduleNo = classScheduleNo;
	}

	public int getClassScheduleDay() {
		return classScheduleDay;
	}

	public void setClassScheduleDay(int classScheduleDay) {
		this.classScheduleDay = classScheduleDay;
	}

	public Date getClassStartTime() {
		return classStartTime;
	}

	public void setClassStartTime(Date classStartTime) {
		this.classStartTime = classStartTime;
	}

	public int getClassNo() {
		return classNo;
	}

	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}

//	public String getClassName() {
//		return className;
//	}
//
//	public void setClassName(String className) {
//		this.className = className;
//	}
//
//	public String getClassContent() {
//		return classContent;
//	}
//
//	public void setClassContent(String classContent) {
//		this.classContent = classContent;
//	}
//
//	public Date getClassTime() {
//		return classTime;
//	}
//
//	public void setClassTime(Date classTime) {
//		this.classTime = classTime;
//	}
//
//	public int getClassFee() {
//		return classFee;
//	}
//
//	public void setClassFee(int classFee) {
//		this.classFee = classFee;
//	}
//
//	public String getMemberGrade() {
//		return memberGrade;
//	}
//
//	public void setMemberGrade(String memberGrade) {
//		this.memberGrade = memberGrade;
//	}
//
//	public String getMemberEmail() {
//		return memberEmail;
//	}
//
//	public void setMemberEmail(String memberEmail) {
//		this.memberEmail = memberEmail;
//	}

	
	

}