package com.kosta.abbo.liketruck.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.liketruck.domain.Liketruck;

@Repository
public class LiketruckDaoImpl implements LiketruckDao {

	@Inject
	private SqlSession SqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.LiketruckMapper";
	
	/**
	 * 관심트럭 등록
	 * @param liketruck
	 */
	@Override
	public void create(Liketruck liketruck) {
		
	}
	
	/**
	 * 관심트럭 상세보기
	 * @param liketruckId
	 * @return
	 */
	@Override
	public Liketruck read(int liketruckId) {
		return null;
	}
	
	/**
	 * 관심트럭 수정
	 * @param liketruck
	 */
	@Override
	public void update(Liketruck liketruck) {
		
	}
	
	/**
	 * 관심트럭 삭제
	 * @param liketruckId
	 */
	@Override
	public void delete(int liketruckId) {
		
	}
	
	/**
	 * 관심트럭 목록
	 * @return
	 */
	@Override
	public List<Liketruck> list() {
		return null;
	}
	
}
