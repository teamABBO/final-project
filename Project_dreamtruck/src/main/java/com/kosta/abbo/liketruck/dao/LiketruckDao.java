package com.kosta.abbo.liketruck.dao;

import java.util.List;

import com.kosta.abbo.liketruck.domain.Liketruck;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.domain.TruckUser;

public interface LiketruckDao {
	
	/**
	 * 관심트럭 등록
	 * @param Liketruck
	 */
	public void create(Liketruck liketruck);
	
	/**
	 * 관심트럭 수정
	 * @param liketruck
	 */
	public void update(Liketruck liketruck);
	
	/**
	 * 관심트럭 체크
	 */
	public void checkliketruck(int userId, int truckId);
	
	/**
	 * 관심트럭 상세보기
	 * @param liketruckId
	 * @return
	 */
	public Liketruck read(int liketruckId);
	
	
	
	/**
	 * 관심트럭 삭제
	 * @param liketruckId
	 */
	public void delete(int liketruckId);
	
	/**
	 * 관심트럭 목록
	 * @return
	 */
	public List<Liketruck> list(int userId);
	
	/*public List<Liketruck> listSearchCriteria(SearchCriteria cri, int userId) throws Exception;*/
	

}
