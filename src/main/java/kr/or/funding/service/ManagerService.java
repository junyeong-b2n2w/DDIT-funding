package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.FundingVO;

public interface ManagerService {
	
	public List<FundingVO> managerList(String fstatus) throws SQLException;
	
	public void updateProjectOk(int fno) throws SQLException;
	
	public void updateProjectNo(int fno) throws SQLException;
	
}
