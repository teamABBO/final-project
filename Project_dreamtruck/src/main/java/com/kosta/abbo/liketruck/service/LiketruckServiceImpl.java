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
	public void create(Liketruck liketruck) {
		dao.create(liketruck);
		dao.update(liketruck);
		
	}
	
	/**
	 * 관심트럭 수정
	 * @param liketruck
	 */
	@Override
	public void update(Liketruck liketruck) {
		dao.update(liketruck);
	}
	
	
	@Override
	public void checkliketruck(int userId, int truckId) {

		dao.checkliketruck(userId, truckId);
	}
	

	/**
	 * 관심트럭 상세보기
	 * @param liketruckId
	 * @return
	 */
	@Override
	public Liketruck read(int liketruckId) {
		return dao.read(liketruckId);
	}

	

	/**
	 * 관심트럭 삭제
	 * @param liketruckId
	 */
	@Override
	public void delete(int liketruckId) {
		dao.delete(liketruckId);
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
