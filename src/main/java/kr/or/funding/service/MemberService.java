package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.funding.command.SupporterCommand;
import kr.or.funding.dto.FundingVO;
import kr.or.funding.dto.MemberVO;
import kr.or.funding.dto.SaleLogVO;
import kr.or.funding.exception.InvalidPasswordException;
import kr.or.funding.exception.NotFoundIDException;



public interface MemberService {

	//네이버 소셜로그인 정보 수정
	void NaverUpdate(MemberVO member) throws SQLException;
	
	//로그인
	void login(String email,String password,HttpSession session) throws SQLException,NotFoundIDException, InvalidPasswordException;
	
	List<MemberVO> selectMemberList() throws SQLException;
	
	MemberVO regist(MemberVO member) throws SQLException;
	
	MemberVO selectMemberById(String email) throws SQLException;
	
	//패스워드 찾기
	void Searchpass(MemberVO member) throws SQLException;
	
	//회원수정
	void MemberUpdate(MemberVO member)throws SQLException;
	
//	--범 
	// 구매
	void buyFunding(SaleLogVO sale) throws SQLException;
	
	// 내역보기
	Map<String, Object> support(String email) throws SQLException;
	
	//펀딩 취소
	void cancelFunding (int sno) throws SQLException;
	
	//내가 올린 펀딩
	List<FundingVO> selectMyProject (String email) throws SQLException;
	
	List<SupporterCommand> getSupporterList(int fno) throws SQLException;
}
