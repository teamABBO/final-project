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
	 * 회원 중복
	 * @param id
	 * @return 
	 */
	public String isMember(String id);
	
	
	/**
	 * 아이디 찾기
	 * @param name
	 * @param phone
	 * @return
	 */
	public String idCheck(String name ,String phone);
	
	/**
	 * 비밀번호 찾기
	 * @param id
	 * @param name
	 * @return
	 */
	public String pwCheck(String id,String emial);
	
	/**
	 * 일반회원 상세보기
	 * @param normalUserId
	 * @return
	 */
	public NormalUser read(int userId);
	
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

	public void checkDocu(int userId);
	
	public String isUpload(int userId);

}
