package kr.or.funding.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.or.funding.dto.MemberVO;


public class MemberDAOImpl implements MemberDAO{

	// SqlSessionFactory
	private SqlSession sqlSession;
	public void setSqlSessionFactory(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	@Override
	public MemberVO selectMemberById(MemberVO member) throws SQLException {
		MemberVO member2 = sqlSession.selectOne("Member-Mapper.login", member);
		return member2;
	}
	
}
