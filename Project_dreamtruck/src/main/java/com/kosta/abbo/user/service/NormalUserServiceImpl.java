package com.kosta.abbo.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.abbo.user.dao.NormalUserDao;
import com.kosta.abbo.user.domain.NormalUser;

@Service
public class NormalUserServiceImpl implements NormalUserService {
	
	@Inject
	private NormalUserDao dao;

	/**
	 * 일반회원 등록
	 * @param normalUser
	 */
	@Override
	public void create(NormalUser normalUser) {
		dao.create(normalUser);
	}

	/**
	 * 일반회원 상세보기
	 * @param normalUserId
	 * @return
	 */
	@Override
	public NormalUser read(int normalUserId) {
		return dao.read(normalUserId);
	}

	/**
	 * 일반회원 수정
	 * @param normalUser
	 */
	@Override
	public void update(NormalUser normalUser) {
		dao.update(normalUser);
	}

	/**
	 * 일반회원 삭제
	 * @param normalUserId
	 */
	@Override
	public void delete(int normalUserId) {
		dao.delete(normalUserId);
	}

	/**
	 * 일반회원 목록
	 * @return
	 */
	@Override
	public List<NormalUser> list() {
		return dao.list();
	}

}
