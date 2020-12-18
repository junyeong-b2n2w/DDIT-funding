package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.FundingVO;

public interface FundingService {
	List<FundingVO> getFundingList() throws SQLException;
	FundingVO getFunding(int fno) throws SQLException;
	int write(FundingVO funding) throws SQLException;
	void modify(FundingVO funding) throws SQLException;
	void remove(int fno) throws SQLException;
}
