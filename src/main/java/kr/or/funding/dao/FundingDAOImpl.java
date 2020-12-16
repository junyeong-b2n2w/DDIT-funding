package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.funding.dto.FundingVO;

public class FundingDAOImpl implements FundingDAO{
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public FundingVO selectFundingByFno(int fno) throws SQLException {
		return sqlSession.selectOne("Funding-Mapper.selectFundingByFno", fno);
	}

	@Override
	public List<FundingVO> selectFundingList() throws SQLException {
		return sqlSession.selectList("Funding-Mapper.selectFundingList");
	}

	@Override
	public int selectFundingSequenceNextValue() throws SQLException {
		return sqlSession.selectOne("Funding-Mapper.selectFundingSequenceNextValue");
	}

	@Override
	public void insertFunding(FundingVO funding) throws SQLException {
		sqlSession.update("Funding-Mapper.insertFunding", funding);
	}

	@Override
	public void updateFunding(FundingVO funding) throws SQLException {
		sqlSession.update("Funding-Mapper.updateFunding", funding);
	}

	@Override
	public void deleteFunding(int fno) throws SQLException {
		sqlSession.update("Funding-Mapper.deleteFunding", fno);
	}

	@Override
	public void insertEmptyFunding(int fno) throws SQLException {
		sqlSession.update("Funding-Mapper.insertEmptyFunding", fno);
	}

}
