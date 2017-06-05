package com.kosta.abbo.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.domain.TruckUser;

@Repository
public class TruckUserDaoImpl implements TruckUserDao {

	@Inject
	private SqlSession SqlSession;
	
	private static final String namespace= "com.kosta.abbo.mapper.TruckUserMapper";
	
	/**
	 * 트럭회원 등록
	 * @param truckUser
	 */
	@Override
	public void create(TruckUser truckUser) {
		  SqlSession.insert(namespace+".create",truckUser);
	}
	
	
	/**
	 * 트럭회원 상세보기
	 * @param truckUserId
	 * @return
	 */
	@Override
	public TruckUser read(int userId) {
		return SqlSession.selectOne(namespace+".read", userId);
	}
	
	/**
	 * 트럭회원 수정
	 * @param truckUser
	 */
	@Override
	public void update(TruckUser truckUser) {
		
	}
	
	/**
	 * 트럭회원 삭제
	 * @param truckUserId
	 */
	@Override
	public void delete(int truckUserId) {
		
	}
	
	/**
	 * 트럭회원 목록
	 * @return
	 */
	@Override
	public List<TruckUser> list() {
		return SqlSession.selectList(namespace+".list");
	}

	
	/**
	 * 트럭회원목록 페이징 처리
	 */
	@Override
	public List<TruckUser> listPage(int page) throws Exception {
		if (page <= 0) {
			page = 1;
		}
		page = (page-1)*10;
		
		return SqlSession.selectList(namespace+".listPage", page);
	}

	
	/**
	 * 페이징처리 페이지 넘버 받기
	 */
	@Override
	public List<TruckUser> listCriteria(Criteria cri) throws Exception {
		return SqlSession.selectList(namespace+".listCriteria", cri);
	}

	
	/**
	 * 카운트
	 */
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return SqlSession.selectOne(namespace+".countPaging", cri);
	}

	
	/**
	 * 검색 기능 추가 
	 */
	@Override
	public List<TruckUser> listSearch(SearchCriteria cri) throws Exception {
		return SqlSession.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return SqlSession.selectOne(namespace+".listSearchCount", cri);
	}
	
}
