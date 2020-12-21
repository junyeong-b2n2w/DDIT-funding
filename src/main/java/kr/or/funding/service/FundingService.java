package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.command.SearchCriteria;
import kr.or.funding.dto.FundingVO;

public interface FundingService {
	List<FundingVO> getFundingList(SearchCriteria cri) throws SQLException;
	FundingVO getFunding(int fno) throws SQLException;
	int write(FundingVO funding) throws SQLException;
	void modify(FundingVO funding) throws SQLException;
	void remove(int fno) throws SQLException;
	int getFundingCnt(SearchCriteria cri) throws SQLException;
	
	
//	--범
	void successFunding(int fno) throws SQLException;
	void failFunding(int fno) throws SQLException;
	void ingFunding(int fno) throws SQLException;
	List<FundingVO> getFundingList() throws SQLException;
}
