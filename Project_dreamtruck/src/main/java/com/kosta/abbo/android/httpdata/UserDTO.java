package com.kosta.abbo.android.httpdata;

public class UserDTO {

	private int userId; 	// 회원 seq
	private String id; 		// 회원 아이디
	private String name; 	// 회원 이름
	private String type; 	// 회원 종류 (normal : 일반회원, truck : 트럭운영자, event : 행사운영자)
	private String pw; 		// 비밀번호
	private int phone; 	// 전화번호
	private String regdat; 	// 회원가입 날짜
	private int likeArea; 	// 관심 지역
	private String truckNum; 	// 차량번호
	private String truckImg; 	// 트럭 이미지
	private String truckName; 	// 트럭 상호명
	private String truckFood; 	// 음식 종류
	private String truckInfo; 	// 트럭 내용
	private String truckDoc; 	// 서류 등록여부 (o : 등록, x : 미등록)
	private String truckArea; 	// 영업지역
	private int truckLikecnt;	// 관심트럭(팔로워) 수
	private String eventEmail; 	// 이메일
	private String eventDep; 	// 관련부서
	
	
	public UserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserDTO(int userId, String id, String name, String type, String pw, int phone, String regdat,
			int likeArea, String truckNum, String truckImg, String truckName, String truckFood, String truckInfo,
			String truckDoc, String truckArea, int truckLikecnt, String eventEmail, String eventDep) {
		super();
		this.userId = userId;
		this.id = id;
		this.name = name;
		this.type = type;
		this.pw = pw;
		this.phone = phone;
		this.regdat = regdat;
		this.likeArea = likeArea;
		this.truckNum = truckNum;
		this.truckImg = truckImg;
		this.truckName = truckName;
		this.truckFood = truckFood;
		this.truckInfo = truckInfo;
		this.truckDoc = truckDoc;
		this.truckArea = truckArea;
		this.truckLikecnt = truckLikecnt;
		this.eventEmail = eventEmail;
		this.eventDep = eventDep;
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


	public int getPhone() {
		return phone;
	}


	public void setPhone(int phone) {
		this.phone = phone;
	}


	public String getRegdat() {
		return regdat;
	}


	public void setRegdat(String regdat) {
		this.regdat = regdat;
	}


	public int getLikeArea() {
		return likeArea;
	}


	public void setLikeArea(int likeArea) {
		this.likeArea = likeArea;
	}


	public String getTruckNum() {
		return truckNum;
	}


	public void setTruckNum(String truckNum) {
		this.truckNum = truckNum;
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


	public String getTruckInfo() {
		return truckInfo;
	}


	public void setTruckInfo(String truckInfo) {
		this.truckInfo = truckInfo;
	}


	public String getTruckDoc() {
		return truckDoc;
	}


	public void setTruckDoc(String truckDoc) {
		this.truckDoc = truckDoc;
	}


	public String getTruckArea() {
		return truckArea;
	}


	public void setTruckArea(String truckArea) {
		this.truckArea = truckArea;
	}


	public int getTruckLikecnt() {
		return truckLikecnt;
	}


	public void setTruckLikecnt(int truckLikecnt) {
		this.truckLikecnt = truckLikecnt;
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
		return "UserDTO [userId=" + userId + ", id=" + id + ", name=" + name + ", type=" + type + ", pw=" + pw
				+ ", phone=" + phone + ", regdat=" + regdat + ", likeArea=" + likeArea + ", truckNum=" + truckNum
				+ ", truckImg=" + truckImg + ", truckName=" + truckName + ", truckFood=" + truckFood + ", truckInfo="
				+ truckInfo + ", truckDoc=" + truckDoc + ", truckArea=" + truckArea + ", truckLikecnt=" + truckLikecnt
				+ ", eventEmail=" + eventEmail + ", eventDep=" + eventDep + "]";
	}
	
	
	
	
}
