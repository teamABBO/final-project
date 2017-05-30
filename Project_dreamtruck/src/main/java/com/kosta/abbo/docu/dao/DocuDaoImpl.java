package com.kosta.abbo.docu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.docu.domain.Docu;

@Repository
public class DocuDaoImpl implements DocuDao {

	@Inject
	private SqlSession SqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.DocuMapper";
	
	/**
	 * 서류 등록
	 * @param docu
	 */
	@Override
	public void create(Docu docu) {
		
	}
	
	/**
	 * 서류 상세보기
	 * @param docuId
	 * @return
	 */
	@Override
	public Docu read(int docuId) {
		return null;
	}
	
	/**
	 * 서류 수정
	 * @param docu
	 */
	@Override
	public void update(Docu docu) {
		
	}
	
	/**
	 * 서류 삭제
	 * @param docuId
	 */
	@Override
	public void delete(int docuId) {
		
	}
	
	/**
	 * 서류 목록
	 * @return
	 */
	@Override
	public List<Docu> list() {
		return null;
	}
	
}
