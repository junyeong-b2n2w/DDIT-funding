package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.funding.dto.MessageVO;

public class MessageDAOImpl implements MessageDAO{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MessageVO> receiveList(String receiver) throws SQLException {
		List<MessageVO> receiveList = sqlSession.selectList("Message-Mapper.selectRecevieList", receiver);
		return receiveList;
	}

	@Override
	public List<MessageVO> sendList(String sender) throws SQLException {
		List<MessageVO> sendList = sqlSession.selectList("Message-Mapper.selectSendList", sender);
		return sendList;
	}

	@Override
	public int snedCount(String sender) throws SQLException {
		int count = sqlSession.selectOne("Message-Mapper.messageSendAllCount", sender);
		return count;
	}

	@Override
	public int receiveCount(String receiver) throws SQLException {
		int count = sqlSession.selectOne("Message-Mapper.messageReceiveAllCount", receiver);
		return count;
	}

	@Override
	public int noreadCount(String receiver) throws SQLException {
		int count = sqlSession.selectOne("Message-Mapper.messageNoReadCount", receiver);
		return count;
	}

	@Override
	public int getMno() throws SQLException {
		int mno = sqlSession.selectOne("Message-Mapper.selectMessageSequenceNextValue");
		return mno;
	}

	@Override
	public void insert(MessageVO message) throws SQLException {
		sqlSession.update("Message-Mapper.insertMessage", message);
	}

	@Override
	public void delete(MessageVO message) throws SQLException {
		sqlSession.update("Message-Mapper.deleteMessage", message);
	}

	@Override
	public void changeStatus(int mno) throws SQLException {
		sqlSession.update("Message-Mapper.readMessage", mno);
	}

	@Override
	public MessageVO readMessage(int mno) throws SQLException {
		MessageVO message = sqlSession.selectOne("Message-Mapper.selectMessageByMno", mno);
		return message;
	}

}
