package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import kr.or.funding.dto.MemberVO;


public class MemberDAOImpl implements MemberDAO{

	// SqlSessionFactory
	private SqlSession sqlSession;
	public void setSqlSessionFactory(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public List<MemberVO> selectMemberList() throws SQLException {
		List<MemberVO> member2 = sqlSession.selectList("Member-Mapper.selectMemberList");
		return member2;
	}

	@Override
	public MemberVO regist(MemberVO member) throws SQLException {
		MemberVO member2 = sqlSession.selectOne("Member-Mapper.regist",member);
		return member2;
	}



	@Override
	public MemberVO selectMemberById(String email) throws SQLException {
		MemberVO member = sqlSession.selectOne("Member-Mapper.selectMemberById",email);
		
		return member;
	}


	@Override
	public void Searchpass(MemberVO member) throws SQLException {
		  sqlSession.selectOne("Member-Mapper.Searchpass",member);
	}





	
	
}
