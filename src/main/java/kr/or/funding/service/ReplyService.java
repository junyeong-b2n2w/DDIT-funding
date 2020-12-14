package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.CommunityVO;
import kr.or.funding.dto.ReplyVO;

public interface ReplyService {
	
	// 전체 가져오기
	List<ReplyVO> selectReplyList (int cno) throws SQLException;
	
	// 작성
	void insert(ReplyVO reply) throws SQLException;
	
	// 수정
	void modify(ReplyVO reply) throws SQLException;
	
	// 삭제
	void remove(int rpno) throws SQLException;
	
	// 댓글 개수 심어주기 
	List<CommunityVO> replyCount(List<CommunityVO> communityList) throws SQLException;
}