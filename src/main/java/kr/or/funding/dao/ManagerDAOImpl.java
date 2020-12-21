package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.funding.command.SearchCriteria;
import kr.or.funding.dto.CommunityVO;
import kr.or.funding.dto.FundingVO;

public class ManagerDAOImpl implements ManagerDAO {
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<FundingVO> managerList(SearchCriteria cri) throws SQLException {
		
		int offset=cri.getPageStartRowNum();
		int limit=cri.getPerPageNum();		
		RowBounds rowBounds=new RowBounds(offset,limit);	
		
		List<FundingVO> list = sqlSession.selectList("Manager-Mapper.selectFundingList", cri, rowBounds);
		
		return list;
	}
	
	@Override
	public void updateProjectOk(int fno) throws SQLException{
		sqlSession.update("Manager-Mapper.updateProjectOk", fno);
	}
	
	@Override
	public void updateProjectNo(int fno) throws SQLException{
		sqlSession.update("Manager-Mapper.updateProjectNo", fno);
	}

	@Override
	public FundingVO selectFunding(int fno) throws SQLException{
		FundingVO funding = sqlSession.selectOne("Manager-Mapper.selectFunding", fno);
		return funding;
	}
}
