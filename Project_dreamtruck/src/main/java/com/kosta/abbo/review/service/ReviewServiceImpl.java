package com.kosta.abbo.review.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.abbo.review.dao.ReviewDao;
import com.kosta.abbo.review.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	private ReviewDao dao;

	/**
	 * 리뷰 등록
	 * @param review
	 */
	@Override
	public void create(Review review) {
		dao.create(review);
	}

	/**
	 * 리뷰 상세보기
	 * @param reviewId
	 * @return
	 */
	@Override
	public Review read(int reviewId) {
		return dao.read(reviewId);
	}

	/**
	 * 리뷰 수정
	 * @param review
	 */
	@Override
	public void update(Review review) {
		dao.update(review);
	}

	/**
	 * 리뷰 삭제
	 * @param reviewId
	 */
	@Override
	public void delete(int reviewId) {
		dao.delete(reviewId);
	}

	/**
	 * 리뷰 목록
	 * @return
	 */
	@Override
	public List<Review> list() {
		return dao.list();
	}

}
