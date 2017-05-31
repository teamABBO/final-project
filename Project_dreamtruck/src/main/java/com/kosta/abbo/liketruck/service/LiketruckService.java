package com.kosta.abbo.liketruck.service;

import java.util.List;

import com.kosta.abbo.liketruck.domain.Liketruck;

public interface LiketruckService {
	
	/**
	 * 관심트럭 등록
	 * @param liketruck
	 */
	public void create(Liketruck liketruck);
	
	/**
	 * 관심트럭 상세보기
	 * @param liketruckId
	 * @return
	 */
	public Liketruck read(int liketruckId);
	
	/**
	 * 관심트럭 수정
	 * @param liketruck
	 */
	public void update(Liketruck liketruck);
	
	/**
	 * 관심트럭 삭제
	 * @param liketruckId
	 */
	public void delete(int liketruckId);
	
	/**
	 * 관심트럭 목록
	 * @return
	 */
	public List<Liketruck> list();

}