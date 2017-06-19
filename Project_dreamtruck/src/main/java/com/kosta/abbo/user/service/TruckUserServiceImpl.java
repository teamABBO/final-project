package com.kosta.abbo.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.dao.TruckUserDao;
import com.kosta.abbo.user.domain.TruckUser;

@Service
public class TruckUserServiceImpl implements TruckUserService {

	@Inject
	private TruckUserDao dao;

	/**
	 * 트럭회원 등록
	 * 
	 * @param truckUser
	 */
	@Override
	public void create(TruckUser truckUser) {
		dao.create(truckUser);
	}

	/**
	 * 트럭회원 상세보기
	 * 
	 * @param truckUserId
	 * @return
	 */
	@Override
	public TruckUser read(int userId) {
		return dao.read(userId);
	}

	/**
	 * 트럭회원 수정
	 * 
	 * @param truckUser
	 */
	@Override
	public void update(TruckUser truckUser) {
		dao.update(truckUser);
	}

	/**
	 * 트럭회원 목록
	 * 
	 * @return
	 */
	@Override
	public List<TruckUser> list() throws Exception {
		return dao.list();
	}

	/**
	 * 트럭회원 목록 페이징처리
	 */
	@Override
	public List<TruckUser> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<TruckUser> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
