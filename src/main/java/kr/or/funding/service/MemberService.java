package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.funding.dto.MemberVO;
import kr.or.funding.exception.InvalidPasswordException;
import kr.or.funding.exception.NotFoundIDException;



public interface MemberService {

	//로그인
	void login(String email,String password,HttpSession session) throws SQLException,NotFoundIDException, InvalidPasswordException;
	
	List<MemberVO> selectMemberList() throws SQLException;
	
	MemberVO regist(MemberVO member) throws SQLException;
	
	MemberVO selectMemberById(String email) throws SQLException;
	
	//패스워드 찾기
	void Searchpass(MemberVO member) throws SQLException;
}
