package com.kosta.abbo.docu.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.abbo.docu.dao.DocuDao;
import com.kosta.abbo.docu.domain.Docu;

@Service
public class DocuServiceImpl implements DocuService {
	
	@Inject
	private DocuDao dao;

	/**
	 * 서류 등록
	 * @param docu
	 */
	@Override
	public void create(Docu docu) {
		dao.create(docu);
	}

	/**
	 * 서류 상세보기
	 * @param docuId
	 * @return
	 */
	@Override
	public Docu read(int docuId) {
		return dao.read(docuId);
	}

	/**
	 * 서류 수정
	 * @param docu
	 */
	@Override
	public void update(Docu docu) {
		dao.update(docu);
	}

	/**
	 * 서류 삭제
	 * @param docuId
	 */
	@Override
	public void delete(int docuId) {
		dao.delete(docuId);
	}

	/**
	 * 서류 목록
	 * @return
	 */
	@Override
	public List<Docu> list() {
		return dao.list();
	}

}
