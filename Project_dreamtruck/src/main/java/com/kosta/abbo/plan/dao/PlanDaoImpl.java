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
		
	}
	
	/**
	 * 스케줄 상세보기
	 * @param planId
	 * @return
	 */
	@Override
	public Plan read(int planId) {
		return null;
	}
	
	/**
	 * 스케줄 수정
	 * @param plan
	 */
	@Override
	public void update(Plan plan) {
		
	}
	
	/**
	 * 스케줄 삭제
	 * @param planId
	 */
	@Override
	public void delete(int planId) {
		
	}
	
	/**
	 * 스케줄 목록
	 * @return
	 */
	@Override
	public List<Plan> list() {
		return null;
	}
	
}
