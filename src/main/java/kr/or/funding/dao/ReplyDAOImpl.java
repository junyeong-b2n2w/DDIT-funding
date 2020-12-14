package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.funding.dto.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO {
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<ReplyVO> selectAllReply(int cno) throws SQLException {
		List<ReplyVO> replyList = sqlSession.selectList("Reply-Mapper.selectReplyList", cno);
		return replyList;
	}

	@Override
	public void insert(ReplyVO reply) throws SQLException {
		sqlSession.update("Reply-Mapper.insertReply", reply);
	}	

	@Override
	public void update(ReplyVO reply) throws SQLException {
		sqlSession.update("Reply-Mapper.updateReply", reply);
	}

	@Override
	public void remove(int rpno) throws SQLException {
		sqlSession.update("Reply-Mapper.deleteReply", rpno);
	}

	@Override
	public int getRpno() throws SQLException {
		int rpno =  sqlSession.selectOne("Reply-Mapper.selectReplySequenceNextValue");
		return rpno;
	}

	@Override
	public int selectCount(int cno) throws SQLException {
		int count = sqlSession.selectOne("Reply-Mapper.replyCount",cno);
		return count;
	}

}
