package com.kosta.abbo.docu.domain;

public class Docu {
	private int docuId; 		// 서류 seq
	private String path; 		// 서류 위치
	private String expdate; 	// 서류 만료 날짜
	private String docuName; 	// 서류 이름 (Deong, License, Saup, Youngup)
	private String regdate; 	// 서류 등록 날짜
	private int userId; 		// 회원번호

	public Docu() {
	}

	public int getDocuId() {
		return docuId;
	}

	public void setDocuId(int docuId) {
		this.docuId = docuId;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getExpdate() {
		return expdate;
	}

	public void setExpdate(String expdate) {
		this.expdate = expdate;
	}

	public String getDocuName() {
		return docuName;
	}

	public void setDocuName(String docuName) {
		this.docuName = docuName;
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

	@Override
	public String toString() {
		return "Docu [docuId=" + docuId + ", path=" + path + ", expdate=" + expdate + ", docuName=" + docuName
				+ ", regdate=" + regdate + ", userId=" + userId + "]";
	}

}
