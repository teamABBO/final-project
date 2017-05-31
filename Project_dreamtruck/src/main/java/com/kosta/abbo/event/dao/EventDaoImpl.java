package com.kosta.abbo.event.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.event.domain.Event;

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
	
}
