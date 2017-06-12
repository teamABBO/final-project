package com.kosta.abbo.review.service;

import java.util.List;

import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.review.domain.Review;

public interface ReviewService {
	
	/**
	 * 리뷰 등록
	 * @param review
	 */
	public void create(Review review) throws Exception;
	
	/**
	 * 리뷰 수정
	 * @param review
	 */
	public void update(Review review) throws Exception;
	
	/**
	 * 리뷰 삭제
	 * @param reviewId
	 */
	public void delete(int reviewId) throws Exception;
	
	/**
	 * 리뷰 목록
	 * @return
	 */
	public List<Review> list(int targetId) throws Exception;

	
	/**
	 * 리뷰 목록 페이징
	 * @param targetId
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public List<Review> listReviewPage(int targetId, Criteria cri) throws Exception;
	
	public int count(int targetId) throws Exception;
}
