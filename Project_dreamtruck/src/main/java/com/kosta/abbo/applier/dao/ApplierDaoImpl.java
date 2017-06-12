package com.kosta.abbo.applier.dao;

import java.util.List;

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
	public List<Applier> list() {
		return null;
	}

	@Override
	public void upCnt(int eventId) {
		sqlSession.update(namespace + ".upCnt", eventId);
	}

}
