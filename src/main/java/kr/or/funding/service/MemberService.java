package kr.or.funding.service;

import java.sql.SQLException;

import kr.or.funding.dto.MemberVO;



public interface MemberService {

	//로그인
	void login(MemberVO member) throws SQLException;
	
}
