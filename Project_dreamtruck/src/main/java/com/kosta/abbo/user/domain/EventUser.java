package com.kosta.abbo.user.domain;

public class EventUser extends NormalUser {
	private String eventDep; 	// 관련부서
	private int eventId;        // 이벤트
	private String content; 	// 행사 내용
	private String name; 		// 행사 내용
	private String title; 		// 행사 제목
	private String regdate; 	// 등록 날짜
	private String writer; 		// 작성자
	private int hit;			// 조회수
	private int recruit;		// 모집트럭수
	private int applierCnt;		// 신청트럭수

	public EventUser() {
		setType("event");
	}

	public String getName() {
		return name;
	}

	public String getWriter() {
		return writer;
	}

	public void setWritier(String writer) {
		this.writer = writer;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getApplierCnt() {
		return applierCnt;
	}

	public void setApplierCnt(int applierCnt) {
		this.applierCnt = applierCnt;
	}

	public int getEventId() {
		return eventId;
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

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventDep() {
		return eventDep;
	}

	public void setEventDep(String eventDep) {
		this.eventDep = eventDep;
	}

	@Override
	public String toString() {
		return "EventUser [eventDep=" + eventDep + ", eventId=" + eventId + ", content=" + content + ", namer="
				+ name + ", title=" + title + ", regdate=" + regdate + ", hit=" + hit + ", recruit=" + recruit
				+ ", applierCnt=" + applierCnt + "]";
	}


}