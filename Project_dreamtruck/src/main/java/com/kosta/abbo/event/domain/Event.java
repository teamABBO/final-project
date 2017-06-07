package com.kosta.abbo.event.domain;

public class Event {
	private int eventId; 		// 행사 seq
	private int duration; 		//행사 기간
	private String img; 		// 행사 이미지
	private String startDate; 	// 행사 시작 날짜
	private String content; 	// 행사 내용
	private String title; 		// 행사 제목
	private String regdate; 	// 등록 날짜
	private int guId; 			// 위치 번호
	private String userId; 		// 등록자
	private String writer;
	private int hit;			// 조회수
	private int recruit;			// 모집트럭수

	public Event() {
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getGuId() {
		return guId;
	}

	public void setGuId(int guId) {
		this.guId = guId;
	}

	

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRecruit() {
		return recruit;
	}

	public void setRecruit(int recruit) {
		this.recruit = recruit;
	}

	@Override
	public String toString() {
		return "Event [eventId=" + eventId + ", duration=" + duration + ", img=" + img + ", startDate=" + startDate
				+ ", content=" + content + ", title=" + title + ", regdate=" + regdate + ", guId=" + guId + ", userId="
				+ userId + ", hit=" + hit + ", recruit=" + recruit +", writer=" + writer +"]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	

}
