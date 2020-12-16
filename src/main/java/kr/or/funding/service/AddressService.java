package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.AddressVO;

public interface AddressService {
	public void regist(AddressVO address) throws SQLException;
	
	public List<AddressVO> list(String email) throws SQLException;
	
	public void removeAddress(int ano) throws SQLException;
}
