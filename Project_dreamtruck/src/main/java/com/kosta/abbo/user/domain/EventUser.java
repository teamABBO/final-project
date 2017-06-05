package com.kosta.abbo.user.domain;

public class EventUser extends NormalUser {
	private String eventEmail; 	// 이메일
	private String eventDep; 	// 관련부서

	public EventUser() {
		setType("event");
	}

	public String getEventEmail() {
		return eventEmail;
	}

	public void setEventEmail(String eventEmail) {
		this.eventEmail = eventEmail;
	}

	public String getEventDep() {
		return eventDep;
	}

	public void setEventDep(String eventDep) {
		this.eventDep = eventDep;
	}

	@Override
	public String toString() {
		return "EventUser [userId=" + super.getUserId() + ", id=" + super.getId() + ", name=" + super.getName()
				+ ", type=" + super.getType() + ", pw=" + super.getPw() + ", phone=" + super.getPhone() + ", regdat="
				+ super.getRegdat() + ", likeArea=" + super.getLikeArea() + "]" + "eventEmail=" + eventEmail
				+ ", eventDep=" + eventDep + "]";
	}

}