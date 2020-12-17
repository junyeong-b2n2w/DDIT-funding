package kr.or.funding.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.funding.dto.WishListVO;

public interface WishListDAO {

	// 총개수
	int wishCount(String email) throws SQLException;
	
	// 리스트
	List<WishListVO> wishList (String email) throws SQLException;
	
	// 등록
	void insert (WishListVO wish) throws SQLException;
	
	// 삭제
	void delete (int wno) throws SQLException;
	
	// wno 가져오기
	int getWno() throws SQLException;
	
}
