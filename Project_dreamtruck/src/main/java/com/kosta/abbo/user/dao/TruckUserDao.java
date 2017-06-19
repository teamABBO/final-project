
package com.kosta.abbo.user.dao;

import java.util.List;

import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.domain.TruckUser;

public interface TruckUserDao {

	/**
	 * 트럭회원 등록
	 * 
	 * @param TruckUser
	 */
	public void create(TruckUser truckUser);

	/**
	 * 트럭회원 상세보기
	 * 
	 * @param truckUserId
	 * @return
	 */
	public TruckUser read(int userId);

	/**
	 * 트럭회원 수정
	 * 
	 * @param truckUser
	 */
	public void update(TruckUser truckUser);

	/**
	 * 트럭회원 목록
	 * 
	 * @return
	 */
	public List<TruckUser> list();

	/**
	 * 트럭회원목록 페이징처리
	 * 
	 */
	public List<TruckUser> listPage(int page) throws Exception;

	/**
	 * 페이징처리 페이지 넘버 받기
	 */
	public List<TruckUser> listCriteria(Criteria cri) throws Exception;

	/**
	 * 토탈카운트 반환
	 * 
	 * @param cri
	 * @return
	 * @throws Exception
	 */
	public int countPaging(Criteria cri) throws Exception;

	public List<TruckUser> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
