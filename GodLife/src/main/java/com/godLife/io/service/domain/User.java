package com.godLife.io.service.domain;

//==>회원정보를 모델링(추상화/캡슐화)한 Bean
public class User {
	
	//field
	
	private String userEmail;
	private String pwd;
	private String role;
	private String nick;
	private String regDate;
	private int categNo;
	private String profileImg;
	private String intro;
	private String phone;
	private int redCardCount;
	private String accountStatus;
	private int reportCount;
	private int totalPoint;
	
	//아래 추가 
	private String categName;
	
	//병문오빠 추가 
	private int redCouponCount;
	private int certiCouponCount;
	
	
	///Constructor
	public User() {
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getNick() {
		return nick;
	}


	public void setNick(String nick) {
		this.nick = nick;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public int getCategNo() {
		return categNo;
	}


	public void setCategNo(int categNo) {
		this.categNo = categNo;
	}


	public String getProfileImg() {
		return profileImg;
	}


	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}


	public String getIntro() {
		return intro;
	}


	public void setIntro(String intro) {
		this.intro = intro;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getRedCardCount() {
		return redCardCount;
	}


	public void setRedCardCount(int redCardCount) {
		this.redCardCount = redCardCount;
	}


	public String getAccountStatus() {
		return accountStatus;
	}


	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}


	public int getReportCount() {
		return reportCount;
	}


	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}


	public int getTotalPoint() {
		return totalPoint;
	}


	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}


	public String getCategName() {
		return categName;
	}


	public void setCategName(String categName) {
		this.categName = categName;
	}


	public int getRedCouponCount() {
		return redCouponCount;
	}


	public void setRedCouponCount(int redCouponCount) {
		this.redCouponCount = redCouponCount;
	}


	public int getCertiCouponCount() {
		return certiCouponCount;
	}


	public void setCertiCouponCount(int certiCouponCount) {
		this.certiCouponCount = certiCouponCount;
	}


	
	
	

	

}

