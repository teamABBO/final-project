package com.kosta.abbo.user.dao;

import java.util.List;

import com.kosta.abbo.user.domain.TruckUser;

public interface TruckUserDao {
	
	/**
	 * 트럭회원 등록
	 * @param TruckUser
	 */
	public void create(TruckUser truckUser);
	
	
	
	/**
	 * 트럭회원 상세보기
	 * @param truckUserId
	 * @return
	 */
	public TruckUser read(int truckUserId);
	
	
	
	/**
	 * 트럭회원 수정
	 * @param truckUser
	 */
	public void update(TruckUser truckUser);
	
	
	
	/**
	 * 트럭회원 삭제
	 * @param truckUserId
	 */
	public void delete(int truckUserId);
	
	
	
	/**
	 * 트럭회원 목록
	 * @return
	 */
	public List<TruckUser> list();

}
