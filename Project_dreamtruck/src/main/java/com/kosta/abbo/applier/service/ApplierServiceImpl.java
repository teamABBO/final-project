package com.kosta.abbo.applier.service;

import java.util.List;

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
		dao.create(applier);;
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
	public List<Applier> list() {
		return dao.list();
	}
}
