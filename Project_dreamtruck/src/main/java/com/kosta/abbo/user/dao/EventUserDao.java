package com.kosta.abbo.user.dao;

import java.util.List;

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
	public EventUser read(int eventUserId);
	
	/**
	 * 행사회원 수정
	 * @param eventUser
	 */
	public void update(EventUser eventUser);
	
	/**
	 * 행사회원 삭제
	 * @param eventUserId
	 */
	public void delete(int eventUserId);
	
	/**
	 * 행사회원 목록
	 * @return
	 */
	public List<EventUser> list();

}
