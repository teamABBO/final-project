package com.kosta.abbo.plan.domain;

public class Plan {
	private int planId; 	// 스케줄시퀀스
	private String day; 	// 스케줄요일
	private String title; 	// 스케줄제목
	private double x; 		// 스케줄위도
	private double y; 		// 스케줄경도
	private String open; 	// 오픈시간
	private String close; 	// 마감시간
	private int userId; 	// 회원번호

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

	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
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

	@Override
	public String toString() {
		return "Plan [planId=" + planId + ", day=" + day + ", title=" + title + ", x=" + x + ", y=" + y + ", open="
				+ open + ", close=" + close + ", userId=" + userId + "]";
	}
}