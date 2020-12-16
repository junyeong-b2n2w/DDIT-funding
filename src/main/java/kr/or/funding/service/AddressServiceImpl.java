package kr.or.funding.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dao.AddressDAO;
import kr.or.funding.dto.AddressVO;

public class AddressServiceImpl implements AddressService {
	private AddressDAO addressDAO;
	
	public void setAddressDAO(AddressDAO addressDAO) {
		this.addressDAO = addressDAO;
	}
	
	@Override
	public void regist(AddressVO address) throws SQLException {
		int ano=addressDAO.selectAddressSeqNext();
		
		address.setAno(ano);
		
		addressDAO.insertAddress(address);
	}
	
	@Override
	public List<AddressVO> list(String email) throws SQLException{
		
		return addressDAO.selectAddress(email);
	}
	
	@Override
	public void removeAddress(int ano) throws SQLException{
		addressDAO.deleteAddress(ano);
	}
}
