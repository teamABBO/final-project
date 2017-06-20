package com.kosta.abbo.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.review.dao.ReviewDao;
import com.kosta.abbo.review.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDao dao;

	/**
	 * 리뷰 등록
	 * 
	 * @param review
	 */
	@Override
	public void create(Review review) throws Exception {
		dao.create(review);
	}

	/**
	 * 리뷰 수정
	 * 
	 * @param review
	 */
	@Override
	public void update(Review review) throws Exception {
		dao.update(review);
	}

	/**
	 * 리뷰 삭제
	 * 
	 * @param reviewId
	 */
	@Override
	public void delete(int reviewId) throws Exception {
		dao.delete(reviewId);
	}

	/**
	 * 리뷰 목록
	 * 
	 * @return
	 */
	@Override
	public List<Review> list(int targetId) throws Exception {
		return dao.list(targetId);
	}

	/**
	 * 리뷰목록 페이징
	 */
	@Override
	public List<Review> listReviewPage(int targetId, Criteria cri) throws Exception {
		return dao.listPage(targetId, cri);
	}

	/**
	 * 리뷰 카운트
	 */
	@Override
	public int count(int targetId) throws Exception {
		return dao.count(targetId);
	}

}
