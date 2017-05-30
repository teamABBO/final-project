package com.kosta.abbo.review.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.review.domain.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Inject
	private SqlSession SqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.ReviewMapper";
	
	/**
	 * 리뷰 등록
	 * @param review
	 */
	@Override
	public void create(Review review) {
		
	}
	
	/**
	 * 리뷰 상세보기
	 * @param reviewId
	 * @return
	 */
	@Override
	public Review read(int reviewId) {
		return null;
	}
	
	/**
	 * 리뷰 수정
	 * @param review
	 */
	@Override
	public void update(Review review) {
		
	}
	
	/**
	 * 리뷰 삭제
	 * @param reviewId
	 */
	@Override
	public void delete(int reviewId) {
		
	}
	
	/**
	 * 리뷰 목록
	 * @return
	 */
	@Override
	public List<Review> list() {
		return null;
	}
	
}
