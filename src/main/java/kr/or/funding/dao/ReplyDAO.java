package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.ReplyVO;

public interface ReplyDAO {

	//전체 댓글조회
	List<ReplyVO> selectAllReply (int cno) throws SQLException;
	
	//댓글 달기
	void insert(ReplyVO reply) throws SQLException;
	
	//댓글 수정
	void update(ReplyVO reply) throws SQLException;
	
	//댓글 삭제
	void remove(int rpno) throws SQLException;
	
	//rpno 가져오기
	int getRpno() throws SQLException;
	
	//전체 댓글 갯수
	int selectCount(int cno) throws SQLException;
}
 