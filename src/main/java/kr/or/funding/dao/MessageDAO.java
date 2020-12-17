package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.MessageVO;

public interface MessageDAO {

	//받은 메시지 가져오기
	List<MessageVO> receiveList(String receiver) throws SQLException;
	
	//보낸 메시지 가져오기
	List<MessageVO> sendList(String sender) throws SQLException;
	
	// 보낸 전체 개수 
	int snedCount(String sender) throws SQLException;

	// 받은 전체 개수
	int receiveCount(String receiver) throws SQLException;
	
	// 안읽은 개수
	int noreadCount(String receiver) throws SQLException;
	
	//mno
	int getMno() throws SQLException;
	
	// 보내기
	void insert(MessageVO message) throws SQLException;
	
	// 삭제
	void delete(MessageVO message) throws SQLException;
	
	//읽기상태로 전환
	void changeStatus(int mno) throws SQLException;
	
	//읽기 
	MessageVO readMessage(int mno) throws SQLException;
}
