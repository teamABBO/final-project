package com.kosta.abbo.user.domain;

public class NormalUser {
	private int userId; 	// 회원 seq
	private String id; 		// 회원 아이디
	private String name; 	// 회원 이름
	private String type; 	// 회원 종류 (normal : 일반회원, truck : 트럭운영자, event : 행사운영자)
	private String pw; 		// 비밀번호
	private String phone; 	// 전화번호
	private String regdate; 	// 회원가입 날짜
	private int likeArea; 	// 관심 지역

	public NormalUser() {
		type = "normal";
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getLikeArea() {
		return likeArea;
	}

	public void setLikeArea(int likeArea) {
		this.likeArea = likeArea;
	}

	@Override
	public String toString() {
		return "NormalUser [userId=" + userId + ", id=" + id + ", name=" + name + ", type=" + type + ", pw=" + pw
				+ ", phone=" + phone + ", regdate=" + regdate + ", likeArea=" + likeArea + "]";
	}

}
