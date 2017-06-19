package com.kosta.abbo.applier.dao;

import java.util.List;
import java.util.Map;

import com.kosta.abbo.applier.domain.Applier;

public interface ApplierDao {
	
	/**
	 * 행사 신청자 등록
	 * @param applier
	 */
	public void create(Applier applier);
	
	/**
	 * 행사 신청자 목록
	 * @return
	 */
	public List<Applier> list(int eventId);

	/**
	 * 신청자 수 증가
	 * @param eventId
	 */
	public void upCnt(int eventId);

	/**
	 * 행사 신청 승인
	 * @param applierId
	 */
	public void confirm(int applierId);
	
	/**
	 * 행사 신청 거절
	 * @param applierId
	 */
	public void deny(int applierId);
	
	/**
	 * 행사 신청 중복 확인
	 * @param userId
	 * @param eventId
	 * @return
	 */
	public int checkDup(int userId, int eventId);
	
	/**
	 * 내가 신청한 행사 목록
	 * @param userId
	 * @return
	 */
	public List<Map<String, Object>> myEvent(int userId);
}
