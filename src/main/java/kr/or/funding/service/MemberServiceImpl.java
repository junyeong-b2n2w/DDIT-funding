package kr.or.funding.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.funding.dao.MemberDAO;
import kr.or.funding.dto.MemberVO;
import kr.or.funding.exception.InvalidPasswordException;
import kr.or.funding.exception.NotFoundIDException;


public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public void login(String email,String password,HttpSession session) throws SQLException,NotFoundIDException, InvalidPasswordException {
		MemberVO member = memberDAO.selectMemberById(email);
		
		
		if(member == null)
			throw new NotFoundIDException();
		if(!password.equals(member.getPassword()))
			throw new InvalidPasswordException();
		
		session.setAttribute("loginUser", member);
		
		}
	

	@Override
	public MemberVO regist(MemberVO member) throws SQLException {
		MemberVO member2 = memberDAO.regist(member);
		return member2;
	}

	@Override
	public List<MemberVO> selectMemberList() throws SQLException {
		List<MemberVO> member2 = memberDAO.selectMemberList();
		return member2;
	}

	@Override
	public MemberVO selectMemberById(String email) throws SQLException {
		MemberVO member2 = memberDAO.selectMemberById(email);
		return member2;
	}

	@Override
	public void Searchpass(MemberVO member) throws SQLException {
		
		  memberDAO.Searchpass(member);
	}

	


}
