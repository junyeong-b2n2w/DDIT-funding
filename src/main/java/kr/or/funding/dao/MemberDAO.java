package kr.or.funding.dao;

import java.sql.SQLException;

import kr.or.funding.dto.MemberVO;


public interface MemberDAO {
	
	
	
	
	// 회원정보 조회
	MemberVO selectMemberById(MemberVO member) throws SQLException;
	
	
}
