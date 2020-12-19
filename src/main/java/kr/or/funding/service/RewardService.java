package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.RewardItemVO;
import kr.or.funding.dto.RewardVO;

public interface RewardService {
	int insertReward(RewardVO reward) throws SQLException;
	int insertRewardItem(RewardItemVO rItem) throws SQLException;
	List<RewardVO> getRewardList(int fno) throws SQLException;
	void modifyReward(RewardVO reward) throws SQLException;
	void modifyRewardItem(RewardItemVO ritem) throws SQLException;
}
