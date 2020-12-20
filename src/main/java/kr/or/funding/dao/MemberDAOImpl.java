package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.funding.dto.FundingVO;
import kr.or.funding.dto.MemberVO;
import kr.or.funding.dto.SaleLogVO;


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


	@Override
	public void NaverUpdate(MemberVO member) throws SQLException {
		sqlSession.selectOne("Member-Mapper.NaverUpdate",member);
		
	}


	@Override
	public void MemberUpdate(MemberVO member) throws SQLException {

		sqlSession.selectOne("Member-Mapper.MemberUpdate",member);
	}


//	--범
	@Override
	public void insertSaleLog(SaleLogVO sale) throws SQLException {
		sqlSession.update("Member-Mapper.insertSaleLog",sale);
	}


	@Override
	public int getSno() throws SQLException {
		int sno = sqlSession.selectOne("Member-Mapper.selectSaleLogSequenceNextValue");
		return sno;
	}


	@Override
	public List<SaleLogVO> saleList(String email) throws SQLException {
		List<SaleLogVO> saleList = sqlSession.selectList("Member-Mapper.selectSaleLog",email);
		return saleList;
	}


	@Override
	public void cancelFunding(int sno) throws SQLException {
		sqlSession.update("Member-Mapper.cancelFunding",sno);
	}
	
	@Override
	public List<FundingVO> selectMyProject(String email) throws SQLException {
		List<FundingVO> fundingList = sqlSession.selectList("Member-Mapper.selectMyProject",email);
		return fundingList;
	}





	
	
}
