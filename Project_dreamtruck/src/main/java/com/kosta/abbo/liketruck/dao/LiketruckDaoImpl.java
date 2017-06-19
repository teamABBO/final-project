package com.kosta.abbo.liketruck.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.liketruck.domain.Liketruck;
import com.kosta.abbo.page.domain.SearchCriteria;

@Repository
public class LiketruckDaoImpl implements LiketruckDao {

	@Inject
	private SqlSession SqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.LiketruckMapper";
	
	/**
	 * 관심트럭 등록
	 * @param liketruck
	 */
	
	@Override
	public void create(int userId, int truckId) {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("userId", userId);
		paramMap.put("truckId", truckId);
		
		SqlSession.insert(namespace+".create", paramMap);
		
	}
	
	/**
	 * 관심트럭 체크
	 */
	public int checkliketruck(int userId, int truckId){
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		
		paramMap.put("userId", userId);
		paramMap.put("truckId", truckId);
		
		return SqlSession.selectOne(namespace+".checkliketruck", paramMap);
	}
	/**
	 * 관심트럭 수정
	 * @param liketruck
	 */
	@Override
	public void update(int truckId) {
		SqlSession.update(namespace+".update", truckId);
	}
	
	/**
	 * 관심트럭 삭제
	 * @param liketruckId
	 */
	@Override
	public void delete(int userId, int truckId) {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("userId", userId);
		paramMap.put("truckId", truckId);
		
		SqlSession.delete(namespace+".delete", paramMap);
	}
	
	/**
	 * 관심트럭 목록
	 * @return
	 */
	@Override
	public List<Liketruck> list(int userId) {
		return SqlSession.selectList(namespace+".list",userId);
	}
	/**
	 * 검색 기능 추가 
	 */
	
	@Override
	public List<Liketruck> listSearch(SearchCriteria cri) throws Exception {
		return SqlSession.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return SqlSession.selectOne(namespace+".listSearchCount", cri);
	}

	
	/**삭제 시 마이너스 카운트 */
	@Override
	public void minuscount(int truckId) {
		SqlSession.update(namespace+".minuscount", truckId);
	}
}
