package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.RewardItemVO;
import kr.or.funding.dto.RewardVO;

public interface RewardDAO {
	int insertReward(RewardVO reward) throws SQLException;
	int insertRewardItem(RewardItemVO rItem) throws SQLException;
	int selectRewardSequenceNextValue() throws SQLException;
	int selectRewardItemSequenceNextValue() throws SQLException;
	List<RewardVO> selectRewardListByFno(int fno) throws SQLException;
	List<RewardItemVO> selectRewardItemListByRno(int rno) throws SQLException;

//	--범
	void updateSubCount(int rno) throws SQLException;
}
