package com.kosta.abbo.event.dao;

import java.util.List;

import com.kosta.abbo.event.domain.Criteria;
import com.kosta.abbo.event.domain.Event;
import com.kosta.abbo.event.domain.SearchCriteria;

public interface EventDao {
	
	/**
	 * 행사 등록
	 * @param Event
	 */
	public void create(Event event);
	
	/**
	 * 행사 상세보기
	 * @param eventId
	 * @return
	 */
	public Event read(int eventId);
	
	/**
	 * 행사 수정
	 * @param event
	 */
	public void update(Event event);
	
	/**
	 * 행사 삭제
	 * @param eventId
	 */
	public void delete(int eventId);
	
	/**
	 * 행사 목록
	 * @return
	 */
	public List<Event> list();
	
	/**
	 * 페이징 
	 * @param page
	 * @return
	 */
	public List<Event> listPage(int page);
	
	/**
	 * 페이징
	 * @param cri
	 * @return
	 */
	public List<Event> listCriteria(Criteria cri);
	
	public int countPaging(Criteria cri);
	
	
	/** 검색 */
	public List<Event> listSearch(SearchCriteria cri);
	public int listSearchCount(SearchCriteria cri);
	
	/** 조회수 */
	public void hit(int eventId);
	
	
}
