package com.kosta.abbo.user.dao;

import java.util.List;

import com.kosta.abbo.dto.LoginDTO;
import com.kosta.abbo.user.domain.NormalUser;

public interface NormalUserDao {
	
	/**
	 * 로그인 
	 * @param LoginDTO
	 */
	public NormalUser login(LoginDTO dto);
	
	/**
	 * 일반회원 등록
	 * @param NormalUser
	 */
	public void create(NormalUser normalUser);
	
	/**
	 * 회원중복 검사
	 * @param id
	 * @param pw
	 * @return
	 */
	/*public boolean isMember(String id, String pw);*/
	
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
	public void delete(String id, String pw);
	
	/**
	 * 일반회원 목록
	 * @return
	 */
	public List<NormalUser> list();

}
