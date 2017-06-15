package com.kosta.abbo.user.dao;

import java.util.List;

import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.domain.EventUser;

public interface EventUserDao {
	
	/**
	 * 행사회원 등록
	 * @param EventUser
	 */
	public void create(EventUser eventUser);
	
	/**
	 * 행사회원 상세보기
	 * @param eventUserId
	 * @return
	 */
	public EventUser read(int userId);
	
	/**
	 * 행사회원 수정
	 * @param eventUser
	 */
	public void update(EventUser eventUser);
	
	/**
	 * 행사회원 삭제
	 * @param eventUserId
	 */
	public void delete(int userId);
	
	/**
	 * 행사회원 목록
	 * @return
	 */
	public List<EventUser> list(int userId);
	
	/**
	 * 페이징 
	 * @param page
	 * @return
	 */
	public List<EventUser> listPage(int page);
	
	/**
	 * 페이징
	 * @param cri
	 * @return
	 */
	public List<EventUser> listCriteria(Criteria cri);
	
	public int countPaging(Criteria cri);
	
	
	/** 검색 */
	public List<EventUser> listSearch(SearchCriteria cri);
	public int listSearchCount(SearchCriteria cri);
	
	/** 조회수 */
	public void hit(int userId);

}
