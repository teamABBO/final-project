package com.kosta.abbo.applier.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.abbo.applier.dao.ApplierDao;
import com.kosta.abbo.applier.domain.Applier;

@Service
public class ApplierServiceImpl implements ApplierService {
	@Inject
	private ApplierDao dao;

	/**
	 * 행사 신청자 등록
	 * @param applier
	 */
	@Override
	public void create(Applier applier) {
		dao.create(applier);
	}

	/**
	 * 행사 신청자 상세보기
	 * @param applierId
	 * @return
	 */
	@Override
	public Applier read(int applierId) {
		return dao.read(applierId);
	}

	/**
	 * 행사 신청자 상태 수정
	 * @param applier
	 */
	@Override
	public void update(Applier applier) {
		dao.update(applier);
	}

	/**
	 * 행사 신청자 삭제
	 * @param applierId
	 */
	@Override
	public void delete(int applierId) {
		dao.delete(applierId);
	}

	/**
	 * 행사 신청자 목록
	 * @return
	 */
	@Override
	public List<Applier> list(int eventId) {
		return dao.list(eventId);
	}

	/**
	 * 신청자 수 증가
	 * @param eventId
	 */
	@Override
	public void upCnt(int eventId) {
		dao.upCnt(eventId);
	}
	
	/**
	 * 행사 신청 승인
	 * @param applierId
	 */
	@Override
	public void confirm(int applierId) {
		dao.confirm(applierId);
	}
	
	/**
	 * 행사 신청 거절
	 * @param applierId
	 */
	@Override
	public void deny(int applierId) {
		dao.deny(applierId);
	}
	
	/**
	 * 행사 신청 중복 확인
	 * @param userId
	 * @param eventId
	 * @return
	 */
	@Override
	public int checkDup(int userId, int eventId) {
		return dao.checkDup(userId, eventId);
	}

	/**
	 * 내가 신청한 행사 목록
	 * @param userId
	 * @return
	 */
	@Override
	public List<Map<String, Object>> myEvent(int userId) {
		return dao.myEvent(userId);
	}
}
