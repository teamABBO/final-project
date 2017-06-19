package com.kosta.abbo.review.dao;

import java.util.List;

import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.review.domain.Review;

public interface ReviewDao {

	/**
	 * 리뷰 등록
	 * 
	 * @param Review
	 */
	public void create(Review review) throws Exception;

	/**
	 * 리뷰 수정
	 * 
	 * @param review
	 */
	public void update(Review review) throws Exception;

	/**
	 * 리뷰 삭제
	 * 
	 * @param reviewId
	 */
	public void delete(int reviewId) throws Exception;

	/**
	 * 리뷰 목록
	 * 
	 * @return
	 */
	public List<Review> list(int targetId) throws Exception;

	/**
	 * 리뷰목록 페이징
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Review> listPage(int targetId, Criteria cri) throws Exception;

	/**
	 * 리뷰 카운트
	 * 
	 * @param targetId
	 * @return
	 * @throws Exception
	 */
	public int count(int targetId) throws Exception;

}
