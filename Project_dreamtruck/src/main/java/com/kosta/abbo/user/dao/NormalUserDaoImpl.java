package com.kosta.abbo.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.dto.LoginDTO;
import com.kosta.abbo.user.domain.NormalUser;

@Repository
public class NormalUserDaoImpl implements NormalUserDao {

	@Inject
	private SqlSession SqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.NormalUserMapper";
	
	
	/**
	 * 로그인
	 * @param LoginDTO
	 */
	@Override
	public NormalUser login(LoginDTO dto) {
		return SqlSession.selectOne(namespace + ".login",dto);
	}

	
	/**
	 * 일반회원 등록
	 * @param normalUser
	 */
	@Override
	public void create(NormalUser normalUser) {
		
	}
	
	/**
	 * 일반회원 상세보기
	 * @param normalUserId
	 * @return
	 */
	@Override
	public NormalUser read(int normalUserId) {
		return null;
	}
	
	/**
	 * 일반회원 수정
	 * @param normalUser
	 */
	@Override
	public void update(NormalUser normalUser) {
		
	}
	
	/**
	 * 일반회원 삭제
	 * @param normalUserId
	 */
	@Override
	public void delete(int normalUserId) {
		
	}
	
	/**
	 * 일반회원 목록
	 * @return
	 */
	@Override
	public List<NormalUser> list() {
		return null;
	}

		
}
