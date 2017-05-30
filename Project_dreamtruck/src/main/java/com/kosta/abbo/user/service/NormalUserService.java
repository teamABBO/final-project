package com.kosta.abbo.user.service;

import java.util.List;

import com.kosta.abbo.user.domain.NormalUser;

public interface NormalUserService {
	
	/**
	 * 일반회원 등록
	 * @param normalUser
	 */
	public void create(NormalUser normalUser);
	
	/**
	 * 일반회원 상세보기
	 * @param normalUserId
	 * @return
	 */
	public NormalUser read(int normalUserId);
	
	/**
	 * 일반회원 수정
	 * @param normalUser
	 */
	public void update(NormalUser normalUser);
	
	/**
	 * 일반회원 삭제
	 * @param normalUserId
	 */
	public void delete(int normalUserId);
	
	/**
	 * 일반회원 목록
	 * @return
	 */
	public List<NormalUser> list();

}
