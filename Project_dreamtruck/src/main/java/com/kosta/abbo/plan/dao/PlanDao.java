package com.kosta.abbo.plan.dao;

import java.util.List;

import com.kosta.abbo.plan.domain.Plan;

public interface PlanDao {
	
	/**
	 * 스케줄 등록
	 * @param Plan
	 */
	public void create(Plan plan);
	
	/**
	 * 스케줄 상세보기
	 * @param planId
	 * @return
	 */
	public Plan read(int planId);
	
	/**
	 * 스케줄 수정
	 * @param plan
	 */
	public void update(Plan plan);
	
	/**
	 * 스케줄 삭제
	 * @param planId
	 */
	public void delete(int planId);
	
	/**
	 * 스케줄 목록
	 * @return
	 */
	public List<Plan> list();

}