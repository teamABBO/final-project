package com.kosta.abbo.liketruck.dao;

import java.util.List;

import com.kosta.abbo.liketruck.domain.Liketruck;
import com.kosta.abbo.page.domain.SearchCriteria;

public interface LiketruckDao {
	
	/**
	 * 관심트럭 등록
	 * @param Liketruck
	 */
	public void create(int userId, int truckId);
	
	/**
	 * 관심트럭 수정
	 * @param liketruck
	 */
	public void update(int truckId);
	
	/**
	 * 관심트럭 체크
	 */
	public int checkliketruck(int userId, int truckId);
	
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
	public void delete(int userId, int truckId);
	
	/**
	 * 관심트럭 삭제 시 마이너스 카운트
	 */
	public void minuscount(int truckId);
	
	/**
	 * 관심트럭 목록
	 * @return
	 */
	public List<Liketruck> list(int userId);
	
	/**
	 * 검색 기능 추가 
	 */
	public List<Liketruck> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;

}
