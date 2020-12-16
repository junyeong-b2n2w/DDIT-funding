package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dao.FundingDAO;
import kr.or.funding.dto.FundingVO;

public class FundingServiceImpl implements FundingService{

	private FundingDAO fundingDAO;
	
	public void setFundingDAO(FundingDAO fundingDAO) {
		this.fundingDAO = fundingDAO;
	}
	@Override
	public List<FundingVO> getFundingList() throws SQLException {
		return fundingDAO.selectFundingList();
	}

	@Override
	public FundingVO getFunding(int fno) throws SQLException {
		return fundingDAO.selectFundingByFno(fno);
	}

	@Override
	public void write(FundingVO funding) throws SQLException {
		fundingDAO.insertFunding(funding);
	}

	@Override
	public void modify(FundingVO funding) throws SQLException {
		fundingDAO.updateFunding(funding);
	}

	@Override
	public void remove(int fno) throws SQLException {
		fundingDAO.deleteFunding(fno);
	}
	@Override
	public FundingVO emptyFunding() throws SQLException {
		int fno = fundingDAO.selectFundingSequenceNextValue();
		fundingDAO.insertEmptyFunding(fno);
		FundingVO funding = fundingDAO.selectFundingByFno(fno);
		return funding; 
	}

}
