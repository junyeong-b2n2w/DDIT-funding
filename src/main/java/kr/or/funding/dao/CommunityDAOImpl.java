package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.funding.dto.CommunityVO;

public class CommunityDAOImpl implements CommunityDAO {
	
private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CommunityVO> selectAllList(int fno) throws SQLException {
		List<CommunityVO> list = sqlSession.selectList("Community-Mapper.selectCommintyList", fno);
		return list;
	}

	@Override
	public CommunityVO selectOne(int cno) throws SQLException {
		CommunityVO community = sqlSession.selectOne("Community-Mapper.selectCommunityByCno", cno);
		return community;
	}

	@Override
	public void insert(CommunityVO community) throws SQLException {
		sqlSession.update("Community-Mapper.insertCommunity", community);
	}

	@Override
	public void update(CommunityVO community) throws SQLException {
		sqlSession.update("Community-Mapper.updateCommunity", community);
	}

	@Override
	public void delete(int cno) throws SQLException {
		sqlSession.update("Community-Mapper.deleteCommunity", cno);
	}

	@Override
	public int getCno() throws SQLException {
		int cno = sqlSession.selectOne("Community-Mapper.selectCommunitySequenceNextValue");
		return cno;
	}

}
