package com.kosta.abbo.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.abbo.user.dao.EventUserDao;
import com.kosta.abbo.user.domain.EventUser;

@Service
public class EventUserServiceImpl implements EventUserService {
	
	@Inject
	private EventUserDao dao;

	/**
	 * 행사회원 등록
	 * @param eventUser
	 */
	@Override
	public void create(EventUser eventUser) {
		dao.create(eventUser);
	}

	/**
	 * 행사회원 상세보기
	 * @param eventUserId
	 * @return
	 */
	@Override
	public EventUser read(int eventUserId) {
		return dao.read(eventUserId);
	}

	/**
	 * 행사회원 수정
	 * @param eventUser
	 */
	@Override
	public void update(EventUser eventUser) {
		dao.update(eventUser);
	}

	/**
	 * 행사회원 삭제
	 * @param eventUserId
	 */
	@Override
	public void delete(int eventUserId) {
		dao.delete(eventUserId);
	}

	/**
	 * 행사회원 목록
	 * @return
	 */
	@Override
	public List<EventUser> list() {
		return dao.list();
	}

}
