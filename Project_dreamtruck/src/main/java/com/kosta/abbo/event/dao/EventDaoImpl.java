package com.kosta.abbo.event.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.event.domain.Criteria;
import com.kosta.abbo.event.domain.Event;
import com.kosta.abbo.event.domain.SearchCriteria;

@Repository
public class EventDaoImpl implements EventDao {

	@Inject
	private SqlSession SqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.EventMapper";
	
	/**
	 * 행사 등록
	 * @param event
	 */
	@Override
	public void create(Event event) {
		SqlSession.insert(namespace + ".create", event);
	}
	
	/**
	 * 행사 상세보기
	 * @param eventId
	 * @return
	 */
	@Override
	public Event read(int eventId) {
		return SqlSession.selectOne(namespace + ".read", eventId);
	}
	
	/**
	 * 행사 수정
	 * @param event
	 */
	@Override
	public void update(Event event) {
		SqlSession.update(namespace + ".update", event);
	}
	
	/**
	 * 행사 삭제
	 * @param eventId
	 */
	@Override
	public void delete(int eventId) {
		
	}
	
	/**
	 * 행사 목록
	 * @return
	 */
	@Override
	public List<Event> list() {
		return SqlSession.selectList(namespace + ".list");
	}

	/** 페이징*/
	@Override
	public List<Event> listPage(int page) {
		if (page <=0) {
			page = 1;
		}
		page = (page - 1)*10;
		return SqlSession.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<Event> listCriteria(Criteria cri) {
		return SqlSession.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) {
		return SqlSession.selectOne(namespace + ".countPaging", cri);
	}

	/** 검색 */
	@Override
	public List<Event> listSearch(SearchCriteria cri) {
		return SqlSession.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return SqlSession.selectOne(namespace + ".listSearchCount", cri);
	}

	/** 조회수 */
	@Override
	public void hit(int eventId) {
		SqlSession.update(namespace + ".hit", eventId);
		
	}



	
	
}
