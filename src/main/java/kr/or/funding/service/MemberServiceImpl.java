package kr.or.funding.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.funding.dao.MemberDAO;
import kr.or.funding.dto.MemberVO;


public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public void login(MemberVO member) throws SQLException {
		MemberVO member2 = memberDAO.selectMemberById(member);
		System.out.println(member2.getEmail());
	}


}
