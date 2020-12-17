package kr.or.funding.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.funding.dao.MessageDAO;
import kr.or.funding.dto.MessageVO;

public class MessageServiceImpl implements MessageService {

	private MessageDAO messageDAO;
	public void setMessageDAO(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
	@Override
	public Map<String, Object> receiveList(String receiver) throws SQLException {
		int receiveCount = messageDAO.receiveCount(receiver);
		List<MessageVO> receiveList = messageDAO.receiveList(receiver);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("receiveList",receiveList);
		dataMap.put("receiveCount", receiveCount);
		return dataMap;
	}

	@Override
	public Map<String, Object> sendeList(String sender) throws SQLException {
		int sendCount = messageDAO.snedCount(sender);
		List<MessageVO> sendList = messageDAO.sendList(sender);
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("sendList",sendList);
		dataMap.put("sendCount", sendCount);
		return dataMap;
	}

	@Override
	public void sendMessage(MessageVO message) throws SQLException {
		int mno = messageDAO.getMno();
		message.setMno(mno);
		messageDAO.insert(message);
	}

	@Override
	public void removeMessage(MessageVO message) throws SQLException {
		messageDAO.delete(message);
	}

	@Override
	public int noreadCount(String receiver) throws SQLException {
		int noreadCount = messageDAO.noreadCount(receiver);
		return noreadCount;
	}
	@Override
	public MessageVO readMessage(int mno) throws SQLException {
		messageDAO.changeStatus(mno);
		MessageVO message = messageDAO.readMessage(mno);
		return message;
	}

}
