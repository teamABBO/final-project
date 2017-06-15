package com.kosta.abbo.user.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.abbo.page.domain.Criteria;
import com.kosta.abbo.page.domain.SearchCriteria;
import com.kosta.abbo.user.domain.EventUser;

@Repository
public class EventUserDaoImpl implements EventUserDao {

	@Inject
	private SqlSession SqlSession;
	private static final String namespace= "com.kosta.abbo.mapper.EventUserMapper";
	
	/**
	 * 행사회원 등록
	 * @param eventUser
	 */
	@Override
	public void create(EventUser eventUser) {
		SqlSession.insert(namespace + ".create",eventUser);
	}
	
	/**
	 * 행사회원 상세보기
	 * @param eventUserId
	 * @return
	 */
	@Override
	public EventUser read(int eventUserId) {
		return null;
	}
	
	/**
	 * 행사회원 수정
	 * @param eventUser
	 */
	@Override
	public void update(EventUser eventUser) {
		SqlSession.update(namespace+".update", eventUser);
	}
	
	/**
	 * 행사회원 삭제
	 * @param eventUserId
	 */
	@Override
	public void delete(int eventUserId) {
		
	}
	
	/**
	 * 행사회원 목록
	 * @return
	 */
	@Override
	public List<EventUser> list(int userId) {
		return SqlSession.selectList(namespace+".list",userId);
	}
	
	/** 페이징*/
	@Override
	public List<EventUser> listPage(int page) {
		if (page <=0) {
			page = 1;
		}
		page = (page - 1)*10;
		return SqlSession.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<EventUser> listCriteria(Criteria cri) {
		return SqlSession.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) {
		return SqlSession.selectOne(namespace + ".countPaging", cri);
	}

	/** 검색 */
	@Override
	public List<EventUser> listSearch(SearchCriteria cri) {
		return SqlSession.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		return SqlSession.selectOne(namespace + ".listSearchCount", cri);
	}

	/** 조회수 */
	@Override
	public void hit(int userId) {
		SqlSession.update(namespace + ".hit", userId);
		
	}
	
}
