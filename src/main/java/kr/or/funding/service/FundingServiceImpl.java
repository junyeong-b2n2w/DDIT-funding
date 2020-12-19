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
		FundingVO funding = fundingDAO.selectFundingByFno(fno);
		return funding;
	}

	@Override
	public int write(FundingVO funding) throws SQLException {
		int fno = fundingDAO.selectFundingSequenceNextValue();
		funding.setFno(fno);
		fundingDAO.insertFunding(funding);
		return fno;
	}

	@Override
	public void modify(FundingVO funding) throws SQLException {
		fundingDAO.updateFunding(funding);
	}

	@Override
	public void remove(int fno) throws SQLException {
		fundingDAO.deleteFunding(fno);
	}
	
	
	

}
