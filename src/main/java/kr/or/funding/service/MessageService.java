package kr.or.funding.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.funding.dto.MessageVO;

public interface MessageService {

	//받은 메시지 (총개수 포함)
	Map<String, Object> receiveList(String receiver) throws SQLException;
	
	//보낸 메시지 (총개수 포함)
	Map<String, Object> sendeList(String sender) throws SQLException;
	
	//메시지 보내기
	void sendMessage(MessageVO message) throws SQLException;
	
	//메시지 삭제
	void removeMessage(MessageVO message) throws SQLException;
	
	//안 읽은 메시지
	int noreadCount(String receiver) throws SQLException;
	
	//읽기
	MessageVO readMessage(int mno) throws SQLException;
	
}
