package com.kosta.abbo.docu.dao;

import java.util.List;

import com.kosta.abbo.docu.domain.Docu;

public interface DocuDao {
	
	/**
	 * 서류 등록
	 * @param docu
	 */
	public void create(Docu docu);
	
	/**
	 * 서류 상세보기
	 * @param docuId
	 * @return
	 */
	public Docu read(int docuId);
	
	/**
	 * 서류 수정
	 * @param docu
	 */
	public void update(Docu docu);
	
	/**
	 * 서류 삭제
	 * @param docuId
	 */
	public void delete(int docuId);
	
	/**
	 * 서류 목록
	 * @return
	 */
	public List<Docu> list(int userId);
	
	/**
	 * 파일경로 반환
	 * @param userId
	 * @param docuName
	 * @return
	 */
	public String getPath(int userId, String docuName);

}
