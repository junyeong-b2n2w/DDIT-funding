package kr.or.funding.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.funding.dao.FundingDAO;
import kr.or.funding.dao.WishListDAO;
import kr.or.funding.dto.FundingVO;
import kr.or.funding.dto.WishListVO;

public class WishListServiceImpl implements WishListService {

	private WishListDAO wishDAO;
	private FundingDAO fundingDAO;
	
	public void setFundingDAO(FundingDAO fundingDAO) {
		this.fundingDAO = fundingDAO;
	}

	public void setWishDAO(WishListDAO wishDAO) {
		this.wishDAO = wishDAO;
	}

	@Override
	public int regist(WishListVO wish) throws SQLException {
		wish.setWno(wishDAO.getWno());
		List<WishListVO> wishList = wishDAO.wishList(wish.getEmail());
		for(int i = 0; i<wishList.size(); i++) {
			if(wishList.get(i).getFno() == wish.getFno()) {
				return 0;
			}
		}
		wishDAO.insert(wish);
		return 1;
	}


	@Override
	public void remove(WishListVO wish) throws SQLException {
		wishDAO.delete(wish);
	}
	@Override
	public Map<String, Object> selectWishList(String email) throws SQLException {
		List<WishListVO> wishList = wishDAO.wishList(email);
		List<FundingVO> fundingList = new ArrayList<FundingVO>();
		for(int i = 0; i<wishList.size(); i++) {
			FundingVO fun = new FundingVO();
			fun = fundingDAO.selectFundingByFno(wishList.get(0).getFno());
			fundingList.add(fun);
		}
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("wishList", wishList);
		dataMap.put("fundingList", fundingList);
		return dataMap;
	}

}
