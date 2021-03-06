package com.kosta.abbo.plan.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.plan.domain.Plan;

@Repository
public class PlanDaoImpl implements PlanDao {

	@Inject
	private SqlSession SqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.PlanMapper";
	
	/**
	 * 스케줄 등록
	 * @param plan
	 */
	@Override
	public void create(Plan plan) {
		SqlSession.insert(namespace+".create", plan);
	}
	
	/**
	 * 스케줄 상세보기
	 * @param planId
	 * @return
	 */
	@Override
	public Plan read(int planId) {
		return SqlSession.selectOne(namespace+".read", planId);
	}
	
	/**
	 * 스케줄 수정
	 * @param plan
	 */
	@Override
	public void update(Plan plan) {
		SqlSession.update(namespace+".modify", plan);
	}
	
	/**
	 * 스케줄 삭제
	 * @param planId
	 */
	@Override
	public void delete(int planId) {
		SqlSession.delete(namespace+".delete", planId);
	}
	
	/**
	 * 스케줄 목록
	 * @return
	 */
	@Override
	public List<Plan> list(int userId) {
		return SqlSession.selectList(namespace+".list", userId);
	}

	/**
	 * 트럭 지도
	 */
	@Override
	public List<Plan> truck() {
		return SqlSession.selectList(namespace+".search");
	}

	/**
	 * 스케줄 등록 유효성 검사
	 */
	@Override
	public Plan uploadCheck(Plan plan) {
		return SqlSession.selectOne(namespace+".uploadCheck", plan);
	}

	/**
	 *  트럭 상세보기 - 지도
	 */
	@Override
	public Plan searchUser(int userId) {
		return SqlSession.selectOne(namespace+".searchUser", userId);
	}
	
}
