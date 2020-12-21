package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.funding.command.SearchCriteria;
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
	public List<FundingVO> selectFundingList(SearchCriteria cri) throws SQLException {
		int offset=cri.getPageStartRowNum();
		int limit=cri.getPerPageNum();	
		RowBounds rowBounds=new RowBounds(offset,limit);	
		return sqlSession.selectList("Funding-Mapper.selectFundingList", cri,rowBounds);
	}

	@Override
	public int selectFundingSequenceNextValue() throws SQLException {
		return sqlSession.selectOne("Funding-Mapper.selectFundingSequenceNextValue");
	}

	@Override
	public int insertFunding(FundingVO funding) throws SQLException {
		return sqlSession.update("Funding-Mapper.insertFunding", funding); 
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

	@Override
	public int selectFundingListCnt(SearchCriteria cri) throws SQLException {
		return sqlSession.selectOne("Funding-Mapper.selectFundingCount", cri);
	}
	
//	범
	@Override
	public void updatePrice(FundingVO funding) throws SQLException {
		sqlSession.update("Funding-Mapper.updatePrice", funding);
	}

	@Override
	public void successFunding(int fno) throws SQLException {
		sqlSession.update("Funding-Mapper.successFunding", fno);
	}

	@Override
	public void failFunding(int fno) throws SQLException {
		sqlSession.update("Funding-Mapper.failFunding", fno);
	}

	@Override
	public void ingFunding(int fno) throws SQLException {
		sqlSession.update("Funding-Mapper.ingFunding", fno);
	}

	@Override
	public List<FundingVO> selectFundingList2() throws SQLException {
		return sqlSession.selectList("Funding-Mapper.selectFundingList");
	}

}
