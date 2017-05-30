package com.kosta.abbo.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.user.domain.TruckUser;

@Repository
public class TruckUserDaoImpl implements TruckUserDao {

	@Inject
	private SqlSession SqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.TruckUserMapper";
	
	/**
	 * 트럭회원 등록
	 * @param truckUser
	 */
	@Override
	public void create(TruckUser truckUser) {
		
	}
	
	/**
	 * 트럭회원 상세보기
	 * @param truckUserId
	 * @return
	 */
	@Override
	public TruckUser read(int truckUserId) {
		return null;
	}
	
	/**
	 * 트럭회원 수정
	 * @param truckUser
	 */
	@Override
	public void update(TruckUser truckUser) {
		
	}
	
	/**
	 * 트럭회원 삭제
	 * @param truckUserId
	 */
	@Override
	public void delete(int truckUserId) {
		
	}
	
	/**
	 * 트럭회원 목록
	 * @return
	 */
	@Override
	public List<TruckUser> list() {
		return null;
	}
	
}
