package com.kosta.abbo.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		SqlSession.insert(namespace + ".create",normalUser);
	}
	
	
	/**
	 * 일반회원 상세보기
	 * @param normalUserId
	 * @return
	 */
	@Override
	public NormalUser read(int userId) {
		return SqlSession.selectOne(namespace + ".read", userId);
	}
	
	/**
	 * 일반회원 수정
	 * @param normalUser
	 */
	@Override
	public void update(NormalUser normalUser) {
		SqlSession.update(namespace+".update", normalUser);
	}
	
	/**
	 * 일반회원 삭제
	 * @param normalUserId
	 */
	@Override
	public void delete(String id, String pw) {
		Map<String, Object> paramMap = new HashMap<String,Object>();

		paramMap.put("id", id);
		paramMap.put("pw", pw);
		
		SqlSession.delete(namespace+".delete",paramMap);
	}
	
	/**
	 * 일반회원 목록
	 * @return
	 */
	@Override
	public List<NormalUser> list() {
		return null;
	}

	@Override
	public void checkDocu(int userId) {
	   SqlSession.update(namespace + ".checkDocu", userId);
	}

	@Override
	public String isUpload(int userId) {
		return SqlSession.selectOne(namespace + ".isUpload", userId);
	}

	/**
	 * 아이디 찾기
	 */
	@Override
	public String idCheck(String name, String phone) {
		Map<String, Object> paramMap = new HashMap<String,Object>();
		paramMap.put("name", name);
		paramMap.put("phone", phone);
		return SqlSession.selectOne(namespace + ".idCheck",paramMap);
	}

	/**
	 * 비밀번호 찾기
	 */
	@Override
	public String pwCheck(String id, String email) {
		Map<String, Object> paramMap = new HashMap<String,Object>();
		paramMap.put("id", id);
		paramMap.put("email", email);
		return SqlSession.selectOne(namespace + ".pwCheck",paramMap);
	}
}
