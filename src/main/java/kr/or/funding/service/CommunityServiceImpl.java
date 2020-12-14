package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dao.CommunityDAO;
import kr.or.funding.dto.CommunityVO;


public class CommunityServiceImpl implements CommunityService {

	private CommunityDAO communityDAO;
	
	public void setCommunityDAO(CommunityDAO communityDAO) {
		this.communityDAO = communityDAO;
	}
	
	@Override
	public List<CommunityVO> getAllList(int fno) throws SQLException {
		List<CommunityVO> list = communityDAO.selectAllList(fno);
		return list;
	}

	@Override
	public CommunityVO getOneinfo(int cno) throws SQLException {
		CommunityVO community = communityDAO.selectOne(cno);
		return community;
	}

	@Override
	public void insert(CommunityVO community) throws SQLException {
		int cno = communityDAO.getCno();
		community.setCno(cno);
		communityDAO.insert(community);
	}

	@Override
	public void modify(CommunityVO community) throws SQLException {
		communityDAO.update(community);
	}

	@Override
	public void remove(int cno) throws SQLException {
		communityDAO.delete(cno);
	}

}
