package com.kosta.abbo.plan.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.abbo.plan.dao.PlanDao;
import com.kosta.abbo.plan.domain.Plan;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Inject
	private PlanDao dao;

	/**
	 * 스케줄 등록
	 * @param plan
	 */
	@Override
	public void create(Plan plan) {
		dao.create(plan);
	}

	/**
	 * 스케줄 상세보기
	 * @param planId
	 * @return
	 */
	@Override
	public Plan read(int planId) {
		return dao.read(planId);
	}

	/**
	 * 스케줄 수정
	 * @param plan
	 */
	@Override
	public void update(Plan plan) {
		dao.update(plan);
	}

	/**
	 * 스케줄 삭제
	 * @param planId
	 */
	@Override
	public void delete(int planId) {
		dao.delete(planId);
	}

	/**
	 * 스케줄 목록
	 * @return
	 */
	@Override
	public List<Plan> list() {
		return dao.list();
	}

}
