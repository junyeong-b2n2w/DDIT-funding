package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.command.SearchCriteria;
import kr.or.funding.dto.FundingVO;

public interface ManagerDAO {
	
	public List<FundingVO> managerList(SearchCriteria cri) throws SQLException;
	
	public void updateProjectOk(int fno) throws SQLException;
	
	public void updateProjectNo(int fno) throws SQLException;
	
	public int getFoundingCount(SearchCriteria cri) throws SQLException;
	
	public FundingVO selectFunding(int fno) throws SQLException;
	
	
}
