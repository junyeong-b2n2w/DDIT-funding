package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.funding.dto.AddressVO;

public class AddressDAOImpl implements AddressDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int selectAddressSeqNext() throws SQLException{
		int ano = sqlSession.selectOne("Address-Mapper.selectAddressSeqNext");
		
		return ano;
	}
	
	@Override
	public void insertAddress(AddressVO address) throws SQLException {
		sqlSession.update("Address-Mapper.insertAddress",address);
	}
	
	@Override
	public List<AddressVO> selectAddress(String email) throws SQLException{
		List<AddressVO> address = new ArrayList<AddressVO>();
		
		address = sqlSession.selectList("Address-Mapper.selectAddress", email);
		
		return address;
	}
	
	@Override
	public void deleteAddress(int ano) throws SQLException{
		sqlSession.update("Address-Mapper.deleteAddress", ano);
	}

}
