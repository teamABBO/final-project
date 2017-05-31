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
	public List<Applier> list();

}