package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.funding.dto.RewardItemVO;
import kr.or.funding.dto.RewardVO;

public class RewardDAOImpl implements RewardDAO{
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public int insertReward(RewardVO reward) throws SQLException {
		return sqlSession.update("Reward-Mapper.insertReward", reward);
	}

	@Override
	public int insertRewardItem(RewardItemVO rItem) throws SQLException {
		return sqlSession.update("Reward-Mapper.insertRewardItem", rItem);
	}

	@Override
	public int selectRewardSequenceNextValue() throws SQLException {
		return sqlSession.selectOne("Reward-Mapper.selectRewardSequenceNextValue");
	}

	@Override
	public int selectRewardItemSequenceNextValue() throws SQLException {
		return sqlSession.selectOne("Reward-Mapper.selectRewardItemSequenceNextValue");
	}
	@Override
	public List<RewardVO> selectRewardListByFno(int fno) throws SQLException {
		return sqlSession.selectList("Reward-Mapper.selectRewardListByFno", fno);
	}
	@Override
	public List<RewardItemVO> selectRewardItemListByRno(int rno) throws SQLException {
		return sqlSession.selectList("Reward-Mapper.selectRewardItemListByRno", rno);
	}
	@Override
	public void updateReward(RewardVO reward) throws SQLException {
		sqlSession.update("Reward-Mapper.updateReward", reward);
	}
	@Override
	public void updateRewardItem(RewardItemVO ritem) throws SQLException {
		sqlSession.update("Reward-Mapper.updateRewardItem", ritem);
	}

}
