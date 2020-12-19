package kr.or.funding.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.funding.dto.WishListVO;

public interface WishListService {
	
	//등록
	int regist(WishListVO wish) throws SQLException;
	
	//삭제
		void remove(WishListVO wish) throws SQLException;
		
	//리스트 
	Map<String, Object> selectWishList(String email) throws SQLException;
}
