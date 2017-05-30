package com.kosta.abbo.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.abbo.user.dao.TruckUserDao;
import com.kosta.abbo.user.domain.TruckUser;

@Service
public class TruckUserServiceImpl implements TruckUserService {
	
	@Inject
	private TruckUserDao dao;

	/**
	 * 트럭회원 등록
	 * @param truckUser
	 */
	@Override
	public void create(TruckUser truckUser) {
		dao.create(truckUser);
	}

	/**
	 * 트럭회원 상세보기
	 * @param truckUserId
	 * @return
	 */
	@Override
	public TruckUser read(int truckUserId) {
		return dao.read(truckUserId);
	}

	/**
	 * 트럭회원 수정
	 * @param truckUser
	 */
	@Override
	public void update(TruckUser truckUser) {
		dao.update(truckUser);
	}

	/**
	 * 트럭회원 삭제
	 * @param truckUserId
	 */
	@Override
	public void delete(int truckUserId) {
		dao.delete(truckUserId);
	}

	/**
	 * 트럭회원 목록
	 * @return
	 */
	@Override
	public List<TruckUser> list() {
		return dao.list();
	}

}
