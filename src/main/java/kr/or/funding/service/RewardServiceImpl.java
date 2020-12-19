package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dao.RewardDAO;
import kr.or.funding.dto.RewardItemVO;
import kr.or.funding.dto.RewardVO;

public class RewardServiceImpl implements RewardService{

	private RewardDAO rewardDAO;
	
	public void setRewardDAO(RewardDAO rewardDAO) {
		this.rewardDAO = rewardDAO;
	}
	
	@Override
	public int insertReward(RewardVO reward) throws SQLException {
		int rno = rewardDAO.selectRewardSequenceNextValue();
		reward.setRno(rno);
		rewardDAO.insertReward(reward);
		return rno;
	}

	@Override
	public int insertRewardItem(RewardItemVO rItem) throws SQLException {
		int rino = rewardDAO.selectRewardItemSequenceNextValue();
		rItem.setRino(rino);
		rewardDAO.insertRewardItem(rItem);
		return rino;
	}

	@Override
	public List<RewardVO> getRewardList(int fno) throws SQLException {
		List<RewardVO> list = rewardDAO.selectRewardListByFno(fno);
		List<RewardItemVO> iList = null;
		for(int i=0; i<list.size(); i++) {
			iList = rewardDAO.selectRewardItemListByRno(list.get(i).getRno());
			list.get(i).setrItemList(iList);
		}
		return list;
	}

	@Override
	public void modifyReward(RewardVO reward) throws SQLException {
		rewardDAO.updateReward(reward);
	}

	@Override
	public void modifyRewardItem(RewardItemVO ritem) throws SQLException {
		rewardDAO.updateRewardItem(ritem);
	}

}
