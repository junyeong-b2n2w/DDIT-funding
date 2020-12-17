package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator;

import kr.or.funding.dto.MemberVO;


public interface MemberDAO {
	//네이버 소셜로그인 정보 업데이트
	void NaverUpdate(MemberVO member) throws SQLException;
	
	// 회원 리스트 조회
	List<MemberVO> selectMemberList() throws SQLException;
	
	// 회원정보 조회
	MemberVO selectMemberById(String email) throws SQLException;
	
	//회원 등록
	MemberVO regist(MemberVO member) throws SQLException;
	
	//패스워드 찾기
	void Searchpass(MemberVO member) throws SQLException;
	
	//회원 정보 수정
	void MemberUpdate(MemberVO member)throws SQLException;
}
