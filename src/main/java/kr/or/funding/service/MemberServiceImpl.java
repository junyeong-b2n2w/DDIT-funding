package kr.or.funding.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.funding.command.SupporterCommand;
import kr.or.funding.dao.FundingDAO;
import kr.or.funding.dao.MemberDAO;
import kr.or.funding.dao.RewardDAO;
import kr.or.funding.dto.FundingVO;
import kr.or.funding.dto.MemberVO;
import kr.or.funding.dto.RewardItemVO;
import kr.or.funding.dto.SaleLogVO;
import kr.or.funding.exception.InvalidPasswordException;
import kr.or.funding.exception.NotFoundIDException;


public class MemberServiceImpl implements MemberService {
	
	private MemberDAO memberDAO;
	
	private FundingDAO fundingDAO;
	
	private RewardDAO rewardDAO;
	
	public void setRewardDAO(RewardDAO rewardDAO) {
		this.rewardDAO = rewardDAO;
	}

	public void setFunding(FundingDAO fundingDAO) {
		this.fundingDAO = fundingDAO;
	}

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	@Override
	public void login(String email,String password,HttpSession session) throws SQLException,NotFoundIDException, InvalidPasswordException {
		MemberVO member = memberDAO.selectMemberById(email);
		
		
		if(member == null)
			throw new NotFoundIDException();
		if(!password.equals(member.getPassword()))
			throw new InvalidPasswordException();
		
		session.setAttribute("loginUser", member);
		
		}
	

	@Override
	public MemberVO regist(MemberVO member) throws SQLException {
		MemberVO member2 = memberDAO.regist(member);
		return member2;
	}

	@Override
	public List<MemberVO> selectMemberList() throws SQLException {
		List<MemberVO> member2 = memberDAO.selectMemberList();
		return member2;
	}

	@Override
	public MemberVO selectMemberById(String email) throws SQLException {
		MemberVO member2 = memberDAO.selectMemberById(email);
		return member2;
	}

	@Override
	public void Searchpass(MemberVO member) throws SQLException {
		
		  memberDAO.Searchpass(member);
	}

	@Override
	public void NaverUpdate(MemberVO member) throws SQLException {

		memberDAO.NaverUpdate(member);
	}

	@Override
	public void MemberUpdate(MemberVO member) throws SQLException {
		memberDAO.MemberUpdate(member);
		
	}


//	--범
	@Override
	public void buyFunding(SaleLogVO sale) throws SQLException {
		int sno = memberDAO.getSno();
		FundingVO funding = new FundingVO();
		sale.setSno(sno);
		memberDAO.insertSaleLog(sale);
		
		funding.setFno(sale.getFno());
		funding.setPrice_pre(funding.getPrice_pre() + sale.getSprice());
		fundingDAO.updatePrice(funding);
		
		rewardDAO.updateSubCount(sale.getRno());
	}

	@Override
	public Map<String, Object> support(String email) throws SQLException {
		List<SaleLogVO> saleList = memberDAO.saleList(email);
		
		List<SaleLogVO> saleListSuccess = new ArrayList<>();
		List<SaleLogVO> saleListIng = new ArrayList<>();
		List<SaleLogVO> saleListFail = new ArrayList<>();
		
		List<FundingVO> fundingListSuccess = new ArrayList<FundingVO>();
		List<FundingVO> fundingListIng = new ArrayList<FundingVO>();
		List<FundingVO> fundingListFail = new ArrayList<FundingVO>();
		
		List<List<RewardItemVO>> rewardItemListSuccess = new ArrayList<>();
		List<List<RewardItemVO>> rewardItemListIng = new ArrayList<>();
		List<List<RewardItemVO>> rewardItemListFail = new ArrayList<>();
		
		for(int i = 0; i<saleList.size(); i++) {
			Integer rno = saleList.get(i).getRno();
			FundingVO fun = fundingDAO.selectFundingByFno(saleList.get(i).getFno());
			List<RewardItemVO> list = new ArrayList<>();
			String status = saleList.get(i).getSstatus();
			
			if(rno > 0) {
				list = rewardDAO.selectRewardItemListByRno(rno);
			}else {
				RewardItemVO rewardItem = new RewardItemVO();
				rewardItem.setRitem("보상이 없습니다.");
				list.add(rewardItem);
			}
			
			if(status.equals("success")) {
				saleListSuccess.add(saleList.get(i));
				rewardItemListSuccess.add(list);
				fundingListSuccess.add(fun);
			}else if(status.equals("fail")) {
				saleListFail.add(saleList.get(i));
				rewardItemListFail.add(list);
				fundingListFail.add(fun);
			}else {
				saleListIng.add(saleList.get(i));
				rewardItemListIng.add(list);
				fundingListIng.add(fun);
			}
		}
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("saleListSuccess", saleListSuccess);
		dataMap.put("saleListFail", saleListFail);
		dataMap.put("saleListIng", saleListIng);
		
		dataMap.put("rewardItemListSuccess", rewardItemListSuccess);
		dataMap.put("rewardItemListFail", rewardItemListFail);
		dataMap.put("rewardItemListIng", rewardItemListIng);
		
		dataMap.put("fundingListSuccess", fundingListSuccess);
		dataMap.put("fundingListFail", fundingListFail);
		dataMap.put("fundingListIng", fundingListIng);
		
		return dataMap;
	}

	@Override
	public void cancelFunding(int sno) throws SQLException {
		memberDAO.cancelFunding(sno);
	}
	
	@Override
	public List<FundingVO> selectMyProject(String email) throws SQLException {
		List<FundingVO> fundingList = memberDAO.selectMyProject(email);
		return fundingList;
	}

	@Override
	public List<SupporterCommand> getSupporterList(int fno) throws SQLException {
		List<SaleLogVO> list = memberDAO.selectSupporterList(fno);
		List<SupporterCommand> sList = new ArrayList<>();
		SupporterCommand sc = null;
		System.out.println(list.get(0));
		if(list != null && list.size()>0) {
			for(SaleLogVO sale : list) {
				sc = new SupporterCommand();
				List<RewardItemVO> ritems = rewardDAO.selectRewardItemListByRno(sale.getRno());
				sc.setSprice(sale.getSprice());
				sc.setEmail(sale.getEmail());
				sc.setRitems(ritems);
				sList.add(sc);
			}
		}
		return sList;
	}
	



}
