package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.CommunityVO;

public interface CommunityService {
	
	// 전체 커뮤니티 조회
	List<CommunityVO> getAllList(int fno) throws SQLException;
	
	// 글조회 
	CommunityVO getOneinfo(int cno) throws SQLException;
	
	// 글작성
	void insert(CommunityVO community) throws SQLException;
	
	//글수정
	void modify(CommunityVO community) throws SQLException;
	
	//글삭제
	void remove(int cno) throws SQLException;
	
}	
