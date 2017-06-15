package com.kosta.abbo.applier.service;

import java.util.List;

import com.kosta.abbo.applier.domain.Applier;

public interface ApplierService {
	
	/**
	 * 행사 신청자 등록
	 * @param applier
	 */
	public void create(Applier applier);
	
	/**
	 * 행사 신청자 상세보기
	 * @param applierId
	 * @return
	 */
	public Applier read(int applierId);
	
	/**
	 * 행사 신청자 상태 수정
	 * @param applier
	 */
	public void update(Applier applier);
	
	/**
	 * 행사 신청자 삭제
	 * @param applierId
	 */
	public void delete(int applierId);
	
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

}
