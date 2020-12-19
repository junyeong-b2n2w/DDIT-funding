package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.command.SearchCriteria;
import kr.or.funding.dao.FundingDAO;
import kr.or.funding.dto.FundingVO;

public class FundingServiceImpl implements FundingService{

	private FundingDAO fundingDAO;
	
	public void setFundingDAO(FundingDAO fundingDAO) {
		this.fundingDAO = fundingDAO;
	}
	
	private RewardService rewardService;
	
	public void setRewardService(RewardService rewardService) {
		this.rewardService = rewardService;
	}
	@Override
	public List<FundingVO> getFundingList(SearchCriteria cri ) throws SQLException {
		return fundingDAO.selectFundingList(cri);
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
	@Override
	public int getFundingCnt(SearchCriteria cri) throws SQLException {
		return fundingDAO.selectFundingListCnt(cri);
		
	}

	
//	--범
	@Override
	public void successFunding(int fno) throws SQLException {
		fundingDAO.successFunding(fno);
	}
	@Override
	public void failFunding(int fno) throws SQLException {
		fundingDAO.failFunding(fno);
	}

}
