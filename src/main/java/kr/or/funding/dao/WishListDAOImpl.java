package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.funding.dto.WishListVO;

public class WishListDAOImpl implements WishListDAO {

	private SqlSession sqlsession;
	
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	@Override
	public int wishCount(String email) throws SQLException {
		int count = sqlsession.selectOne("WishList-Mapper.wishCount", email);
		return count;
	}

	@Override
	public List<WishListVO> wishList(String email) throws SQLException {
		List<WishListVO> wishList = sqlsession.selectList("WishList-Mapper.selectWishList",email);
		return wishList;
	}

	@Override
	public void insert(WishListVO wish) throws SQLException {
		sqlsession.update("WishList-Mapper.insertWish",wish);
	}

	@Override
	public void delete(int wno) throws SQLException {
		sqlsession.update("WishList-Mapper.deleteWish",wno);
	}

	@Override
	public int getWno() throws SQLException {
		int wno = sqlsession.selectOne("WishList-Mapper.selectWishSequenceNextValue");
		return wno;
	}

}
