package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.CommunityVO;

public interface CommunityDAO {
	
	
	//전체조회
	List<CommunityVO> selectAllList(int fno) throws SQLException;
	
	//하나조회
	CommunityVO selectOne(int cno) throws SQLException;
	
	//생성
	void insert(CommunityVO community) throws SQLException;
	
	//수정
	void update(CommunityVO community) throws SQLException;
	
	//삭제
	void delete(int cno) throws SQLException;
	
	//cno값 가져오기
	int getCno() throws SQLException;
	
}
