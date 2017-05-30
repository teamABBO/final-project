package com.kosta.abbo.event.sevice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.abbo.event.dao.EventDao;
import com.kosta.abbo.event.domain.Event;

@Service
public class EventServiceImpl implements EventService {
	
	@Inject
	private EventDao dao;

	/**
	 * 행사 등록
	 * @param event
	 */
	@Override
	public void create(Event event) {
		dao.create(event);
	}

	/**
	 * 행사 상세보기
	 * @param eventId
	 * @return
	 */
	@Override
	public Event read(int eventId) {
		return dao.read(eventId);
	}

	/**
	 * 행사 수정
	 * @param event
	 */
	@Override
	public void update(Event event) {
		dao.update(event);
	}

	/**
	 * 행사 삭제
	 * @param eventId
	 */
	@Override
	public void delete(int eventId) {
		dao.delete(eventId);
	}

	/**
	 * 행사 목록
	 * @return
	 */
	@Override
	public List<Event> list() {
		return dao.list();
	}

}
