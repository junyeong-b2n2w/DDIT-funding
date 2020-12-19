package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.command.SearchCriteria;
import kr.or.funding.dto.FundingVO;

public interface FundingDAO {
	
	FundingVO selectFundingByFno(int fno) throws SQLException;
	List<FundingVO> selectFundingList(SearchCriteria cri) throws SQLException;
	int selectFundingSequenceNextValue() throws SQLException;
	int insertFunding(FundingVO funding) throws SQLException;
	void updateFunding(FundingVO funding) throws SQLException;
	void deleteFunding(int fno) throws SQLException;
	void insertEmptyFunding(int fno) throws SQLException;
	int selectFundingListCnt(SearchCriteria cri) throws SQLException;
	
	
//	범
	void updatePrice(FundingVO funding) throws SQLException;
	void successFunding(int fno) throws SQLException;
	void failFunding(int fno) throws SQLException;
}
