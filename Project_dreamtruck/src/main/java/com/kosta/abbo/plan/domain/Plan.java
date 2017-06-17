package com.kosta.abbo.plan.domain;

public class Plan {
	private int planId; 	// 스케줄시퀀스
	private String day; 	// 스케줄요일
	private String title; 	// 스케줄제목
	private String x; 		// 스케줄위도
	private String y; 		// 스케줄경도
	private String open; 	// 오픈시간
	private String close; 	// 마감시간
	private int userId; 	// 회원번호
	private String regdate;
	
	/* 트럭지도를 위한 추가 변수 */
	private String truckImg;
	private String truckName;
	private String truckFood;
	private String phone;
	private String email;
	private String id;

	public Plan() {
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public String getClose() {
		return close;
	}

	public void setClose(String close) {
		this.close = close;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getTruckImg() {
		return truckImg;
	}

	public void setTruckImg(String truckImg) {
		this.truckImg = truckImg;
	}

	public String getTruckName() {
		return truckName;
	}

	public void setTruckName(String truckName) {
		this.truckName = truckName;
	}

	public String getTruckFood() {
		return truckFood;
	}

	public void setTruckFood(String truckFood) {
		this.truckFood = truckFood;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Plan [planId=" + planId + ", day=" + day + ", title=" + title + ", x=" + x + ", y=" + y + ", open="
				+ open + ", close=" + close + ", userId=" + userId + ", regdate=" + regdate + ", truckImg=" + truckImg
				+ ", truckName=" + truckName + ", truckFood=" + truckFood + ", phone=" + phone + ", email=" + email
				+ ", id=" + id + "]";
	}

	
}
