package com.kosta.abbo.applier.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.applier.domain.Applier;

@Repository
public class ApplierDaoImpl implements ApplierDao {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.ApplierMapper";
	
	/**
	 * 행사 신청자 등록
	 * @param applier
	 */
	@Override
	public void create(Applier applier) {
		sqlSession.insert(namespace + ".create", applier);
	}

	/**
	 * 행사 신청자 상세보기
	 * @param applierId
	 * @return
	 */
	@Override
	public Applier read(int applierId) {
		return null;
	}

	/**
	 * 행사 신청자 상태 수정
	 * @param applier
	 */
	@Override
	public void update(Applier applier) {

	}

	/**
	 * 행사 신청자 삭제
	 * @param applierId
	 */
	@Override
	public void delete(int applierId) {

	}

	/**
	 * 행사 신청자 목록
	 * @return
	 */
	@Override
	public List<Applier> list(int eventId) {
		return sqlSession.selectList(namespace + ".list", eventId);
	}

	/**
	 * 신청자 수 증가
	 */
	@Override
	public void upCnt(int eventId) {
		sqlSession.update(namespace + ".upCnt", eventId);
	}


	/**
	 * 행사 신청 승인
	 * @param applierId
	 */
	@Override
	public void confirm(int applierId) {
		sqlSession.update(namespace + ".confirm", applierId);
	}

	/**
	 * 행사 신청 거절
	 * @param applierId
	 */
	@Override
	public void deny(int applierId) {
		sqlSession.update(namespace + ".deny", applierId);
	}
	
	/**
	 * 행사 신청 중복 확인
	 * @param userId
	 * @param eventId
	 * @return
	 */
	@Override
	public int checkDup(int userId, int eventId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("userId", userId);
		paramMap.put("eventId", eventId);
		
		return sqlSession.selectOne(namespace + ".checkDup", paramMap);
	}

	/**
	 * 내가 신청한 행사 목록
	 * @param userId
	 * @return
	 */
	@Override
	public List<Map<String, Object>> myEvent(int userId) {
		return sqlSession.selectList(namespace + ".myEvent", userId);
	}

}
