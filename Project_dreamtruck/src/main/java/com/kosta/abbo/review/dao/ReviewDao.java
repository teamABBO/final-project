package com.kosta.abbo.review.dao;

import java.util.List;

import com.kosta.abbo.review.domain.Review;

public interface ReviewDao {
	
	/**
	 * 리뷰 등록
	 * @param Review
	 */
	public void create(Review review);
	
	/**
	 * 리뷰 상세보기
	 * @param reviewId
	 * @return
	 */
	public Review read(int reviewId);
	
	/**
	 * 리뷰 수정
	 * @param review
	 */
	public void update(Review review);
	
	/**
	 * 리뷰 삭제
	 * @param reviewId
	 */
	public void delete(int reviewId);
	
	/**
	 * 리뷰 목록
	 * @return
	 */
	public List<Review> list();

}
