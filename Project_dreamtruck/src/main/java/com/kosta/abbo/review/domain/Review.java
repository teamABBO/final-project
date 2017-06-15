package com.kosta.abbo.review.domain;

public class Review {
	private int reviewId; 	// 리뷰시퀀스
	private String regdate; // 리뷰날짜
	private String content; // 리뷰내용
	private int star; 		// 리뷰별점
	private int writerId; 	// 리뷰작성자
	private int targetId; 	// 리뷰대상
	private String writerName;
	

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public Review() {
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getWriterId() {
		return writerId;
	}

	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}

	public int getTargetId() {
		return targetId;
	}

	public void setTargetId(int targetId) {
		this.targetId = targetId;
	}

	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", regdate=" + regdate + ", content=" + content + ", star=" + star
				+ ", writerId=" + writerId + ", targetId=" + targetId + ", writerName=" + writerName + "]";
	}

	
	
}
