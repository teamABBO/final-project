package com.kosta.abbo.event.sevice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.abbo.event.dao.EventDao;
import com.kosta.abbo.event.domain.Criteria;
import com.kosta.abbo.event.domain.Event;
import com.kosta.abbo.event.domain.SearchCriteria;

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
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public Event read(int eventId) {
		dao.hit(eventId);
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
	 * 행사 목록
	 * @return
	 */
	@Override
	public List<Event> list() {
		return dao.list();
	}

	/**페이징*/ 
	@Override
	public List<Event> listCriteria(Criteria cri) {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) {
		return dao.countPaging(cri);
	}

	/** 검색 */
	@Override
	public List<Event> listSearchCriteria(SearchCriteria cri) {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return dao.listSearchCount(cri);
	}


}
