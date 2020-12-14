package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.AddressVO;

public interface AddressDAO {
	
	public int selectAddressSeqNext() throws SQLException;
	
	public void insertAddress(AddressVO address) throws SQLException;
	
	public List<AddressVO> selectAddress(String email) throws SQLException;
	
	public void deleteAddress(int ano) throws SQLException;
}
