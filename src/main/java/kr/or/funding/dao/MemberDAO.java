package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.MemberVO;


public interface MemberDAO {
	
	
	// 회원 리스트 조회
	List<MemberVO> selectMemberList() throws SQLException;
	
	// 회원정보 조회
	MemberVO selectMemberById(String email) throws SQLException;
	
	//회원 등록
	MemberVO regist(MemberVO member) throws SQLException;
	
	//패스워드 찾기
	void Searchpass(MemberVO member) throws SQLException;
}
