package com.kosta.abbo.applier.domain;

public class Applier {
	
	private int applierId; 	// 신청 seq
	private String success; // 참가 성공 여부(대기 : n, 성공 : o, 실패 : x)
	private String regdate; // 신청날짜
	private int userId; 	// 신청자
	private int eventId; 	// 행사번호
	
	public Applier() { }

	public int getApplierId() {
		return applierId;
	}

	public void setApplierId(int applierId) {
		this.applierId = applierId;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	@Override
	public String toString() {
		return "Applier [applierId=" + applierId + ", success=" + success + ", regdate=" + regdate + ", userId="
				+ userId + ", eventId=" + eventId + "]";
	}

}
