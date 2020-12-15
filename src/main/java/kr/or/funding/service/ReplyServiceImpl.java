package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dao.ReplyDAO;
import kr.or.funding.dto.CommunityVO;
import kr.or.funding.dto.ReplyVO;

public class ReplyServiceImpl implements ReplyService {

private ReplyDAO replyDAO;
	
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public List<ReplyVO> selectReplyList(int cno) throws SQLException {
		List<ReplyVO> replyList = replyDAO.selectAllReply(cno);
		return replyList;
	}

	@Override
	public void insert(ReplyVO reply) throws SQLException {
		int rpno = replyDAO.getRpno();
		reply.setRpno(rpno);
		replyDAO.insert(reply);
	}

	@Override
	public void modify(ReplyVO reply) throws SQLException {
		replyDAO.update(reply);
	}

	@Override
	public void remove(int rpno) throws SQLException {
		replyDAO.remove(rpno);
	}

	@Override
	public List<CommunityVO> replyCount(List<CommunityVO> communityList) throws SQLException {
		for(int i=0; i<communityList.size(); i++) {
			int count = replyDAO.selectCount(communityList.get(i).getCno());
			communityList.get(i).setReplyCount(count);
		}
		return communityList;
	}

}
