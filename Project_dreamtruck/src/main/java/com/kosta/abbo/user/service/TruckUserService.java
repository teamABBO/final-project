package com.kosta.abbo.user.service;

import java.util.List;

import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.domain.TruckUser;

public interface TruckUserService {
	
	
	/**
	 * 트럭회원 등록
	 * @param truckUser
	 */
	public void create(TruckUser truckUser);
	
	/**
	 * 트럭회원 상세보기
	 * @param id user의 유니크
	 * @return
	 */
	public TruckUser read(int userId) throws Exception;
	
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
	public List<TruckUser> list() throws Exception;
	
	
	/**
	 * 트럭회원 페이징 처리
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public List<TruckUser> listCriteria(Criteria cri) throws Exception;

	
	/**
	 * 토탈카운트 처리
	 */
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<TruckUser> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
