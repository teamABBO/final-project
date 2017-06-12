package com.kosta.abbo.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.page.domain.Criteria;
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
		SqlSession.insert(namespace+".create", review);
	}
	
	/**
	 * 리뷰 수정
	 * @param review
	 */
	@Override
	public void update(Review review) {
		SqlSession.update(namespace+".update", review);
	}
	
	/**
	 * 리뷰 삭제
	 * @param reviewId
	 */
	@Override
	public void delete(int reviewId) {
		SqlSession.delete(namespace+".delete", reviewId);
	}
	
	/**
	 * 리뷰 목록
	 * @return
	 */
	@Override
	public List<Review> list(int targetId) throws Exception {
		return SqlSession.selectList(namespace+".list", targetId);
	}

	
	/**
	 * 리뷰목록 페이징
	 */
	@Override
	public List<Review> listPage(int targetId, Criteria cri) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("targetId", targetId);
		paramMap.put("cri", cri);
		
		
		return SqlSession.selectList(namespace+".listPage", paramMap);
	}

	@Override
	public int count(int targetId) throws Exception {
		return SqlSession.selectOne(namespace+".count", targetId);
	}
	
}
