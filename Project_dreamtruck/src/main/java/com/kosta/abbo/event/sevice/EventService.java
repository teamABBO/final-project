package com.kosta.abbo.event.sevice;

import java.util.List;

import com.kosta.abbo.event.domain.Event;

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
	 * 행사 삭제
	 * @param eventId
	 */
	public void delete(int eventId);
	
	/**
	 * 행사 목록
	 * @return
	 */
	public List<Event> list();

}
