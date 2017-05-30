package com.kosta.abbo.liketruck.domain;

public class Liketruck {
	private int liketruckId; 	// 관심트럭시퀀스
	private int truckId; 		// 관심트럭번호
	private int userId; 		// 회원번호

	public Liketruck() {
	}

	public int getLiketruckId() {
		return liketruckId;
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

	@Override
	public String toString() {
		return "Liketruck [liketruckId=" + liketruckId + ", truckId=" + truckId + ", userId=" + userId + "]";
	}
}
