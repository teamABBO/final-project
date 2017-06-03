package com.kosta.abbo.user.domain;

public class TruckUser extends NormalUser {
	private String truckNum; 	// 차량번호
	private String truckImg; 	// 트럭 이미지
	private String truckName; 	// 트럭 상호명
	private String truckFood; 	// 음식 종류
	private String truckInfo; 	// 트럭 내용
	private String truckDoc; 	// 서류 등록여부 (o : 등록, x : 미등록)
	private String truckArea; 	// 영업지역
	private int truckLikecnt;	// 관심트럭(팔로워) 수

	public TruckUser() {
		setType("truck");
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

	@Override
	public String toString() {
		return "TruckUser [userId=" + super.getUserId() + ", id=" + super.getId() + ", name=" + super.getName()
				+ ", type=" + super.getType() + ", pw=" + super.getPw() + ", phone=" + super.getPhone() + ", regdat="
				+ super.getRegdate() + ", likeArea=" + super.getLikeArea() + "truckNum=" + truckNum + ", truckImg="
				+ truckImg + ", truckName=" + truckName + ", truckFood=" + truckFood + ", truckInfo=" + truckInfo
				+ ", truckDoc=" + truckDoc + ", truckArea=" + truckArea + "truckLikecnt=" + truckLikecnt + "]";
	}

}
