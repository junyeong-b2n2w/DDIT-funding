package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dao.ManagerDAO;
import kr.or.funding.dto.FundingVO;

public class ManagerServiceImpl implements ManagerService {
	
	private ManagerDAO managerDAO;
	public void setManagerDAO (ManagerDAO managerDAO) {
		this.managerDAO = managerDAO;
	}

	@Override
	public List<FundingVO> managerList(String fstatus) throws SQLException {

		return managerDAO.managerList(fstatus);
	}

	@Override
	public void updateProjectOk(int fno) throws SQLException{
		managerDAO.updateProjectOk(fno);
	}
	
	@Override
	public void updateProjectNo(int fno) throws SQLException{
		managerDAO.updateProjectNo(fno);
	}
}
