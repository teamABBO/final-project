package com.kosta.abbo.user.service;

import java.util.List;

import com.kosta.abbo.user.domain.EventUser;

public interface EventUserService {
	
	/**
	 * 행사회원 등록
	 * @param eventUser
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
