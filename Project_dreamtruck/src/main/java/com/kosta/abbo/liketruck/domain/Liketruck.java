package com.kosta.abbo.liketruck.domain;

public class Liketruck {
	private int liketruckId; 	// 관심트럭시퀀스
	private int truckId; 		// 관심트럭번호
	private int userId; 		// 회원번호
	private String id;			// 아이디
	private String truckImg; 	// 트럭 이미지
	private String truckName; 	// 트럭 상호명
	private String truckInfo; 	// 트럭 내용
	private int truckLikecnt;   // 관심 트럭 수 

	public Liketruck() {
	}
	

	public int getTruckLikecnt() {
		return truckLikecnt;
	}


	public void setTruckLikecnt(int truckLikecnt) {
		this.truckLikecnt = truckLikecnt;
	}





	public int getLiketruckId() {
		return liketruckId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setLiketruckId(int liketruckId) {
		this.liketruckId = liketruckId;
	}

	public int getTruckId() {
		return truckId;
	}

	public void setTruckId(int truckId) {
		this.truckId = truckId;
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

	public String getTruckInfo() {
		return truckInfo;
	}

	public void setTruckInfo(String truckInfo) {
		this.truckInfo = truckInfo;
	}

	@Override
	public String toString() {
		return "Liketruck [liketruckId=" + liketruckId + ", truckId=" + truckId + ", userId=" + userId + ", id=" + id
				+ ", truckImg=" + truckImg + ", truckName=" + truckName + ", truckInfo=" + truckInfo + ", truckLikecnt="
				+ truckLikecnt + "]";
	}

}
