package com.kosta.abbo.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.user.domain.EventUser;

@Repository
public class EventUserDaoImpl implements EventUserDao {

	@Inject
	private SqlSession SqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.EventUserMapper";
	
	/**
	 * 행사회원 등록
	 * @param eventUser
	 */
	@Override
	public void create(EventUser eventUser) {
		SqlSession.insert(namespace + ".create",eventUser);
	}
	
	/**
	 * 행사회원 상세보기
	 * @param eventUserId
	 * @return
	 */
	@Override
	public EventUser read(int eventUserId) {
		return null;
	}
	
	/**
	 * 행사회원 수정
	 * @param eventUser
	 */
	@Override
	public void update(EventUser eventUser) {
		
	}
	
	/**
	 * 행사회원 삭제
	 * @param eventUserId
	 */
	@Override
	public void delete(int eventUserId) {
		
	}
	
	/**
	 * 행사회원 목록
	 * @return
	 */
	@Override
	public List<EventUser> list() {
		return null;
	}
	
}
