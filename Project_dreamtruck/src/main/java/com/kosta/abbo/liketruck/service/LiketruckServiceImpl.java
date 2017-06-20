package com.kosta.abbo.liketruck.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.abbo.liketruck.dao.LiketruckDao;
import com.kosta.abbo.liketruck.domain.Liketruck;

@Service
public class LiketruckServiceImpl implements LiketruckService {
	
	@Inject
	private LiketruckDao dao;

	/**
	 * 관심트럭 등록
	 * @param liketruck
	 */
	@Transactional
	@Override
	public void create(int userId, int truckId) {
		dao.create(userId,truckId);
		dao.update(truckId);
		
	}
	
	/**
	 * 관심트럭 수정
	 * @param liketruck
	 */
	@Override
	public void update(int truckId) {
		dao.update(truckId);
	}
	
	/**
	 * 관심트럭 체크
	 */
	@Override
	public int checkliketruck(int userId, int truckId) {

		return dao.checkliketruck(userId, truckId);
	}
	

	/**
	 * 관심트럭 삭제
	 * @param liketruckId
	 */
	@Transactional
	@Override
	public void delete(int userId, int truckId) {
		dao.delete(userId, truckId);
		dao.minuscount(truckId);
	}

	/**
	 * 관심트럭 목록
	 * @return
	 */
	@Override
	public List<Liketruck> list(int userId) {
		return dao.list(userId);
	}


}
