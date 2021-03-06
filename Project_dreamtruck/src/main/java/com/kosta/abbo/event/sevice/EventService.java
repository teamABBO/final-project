package com.kosta.abbo.event.sevice;

import java.util.List;

import com.kosta.abbo.event.domain.Criteria;
import com.kosta.abbo.event.domain.Event;
import com.kosta.abbo.event.domain.SearchCriteria;

public interface EventService {
	
	/**
	 * 행사 등록
	 * @param event
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
	 * 행사 목록
	 * @return
	 */
	public List<Event> list();
	
	/** 페이징 */
	public List<Event> listCriteria(Criteria cri);
	public int listCountCriteria(Criteria cri);
	

	/** 검색 */
	public List<Event> listSearchCriteria(SearchCriteria cri);
	public int listSearchCount(SearchCriteria cri);





}
