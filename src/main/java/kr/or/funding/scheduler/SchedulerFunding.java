package kr.or.funding.scheduler;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import kr.or.funding.command.SearchCriteria;
import kr.or.funding.dto.FundingVO;
import kr.or.funding.service.FundingService;

public class SchedulerFunding {
	
	private FundingService fundingService;
	public void setFundingService(FundingService fundingService) {
		this.fundingService = fundingService;
	}
	
	public void testScheduler() {
		clacFunding();
	}
	private void clacFunding() {
		try {
			List<FundingVO> fundingList = fundingService.getFundingList(new SearchCriteria());
			for(int i = 0; i<fundingList.size(); i++) {
				
				long price_pre = fundingList.get(i).getPrice_pre();  //현재금액
				long price_goal = fundingList.get(i).getPrice_goal(); //목표금액 
				java.sql.Date endDate = fundingList.get(i).getEnddate(); // 종료날짜
				int fno = fundingList.get(i).getFno();
				if(price_pre >= price_goal ) {
					fundingService.successFunding(fno);
				}else if(endDate.before(new Date()) && price_goal > price_pre) {
					fundingService.failFunding(fno);
				}
			}
			System.out.println("업데이트 완료 !");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//db에 없는 이미지 삭제
//	public void fileRemove() {
//		File dir = new File(filePath);
//		File[] files = dir.listFiles();
//		if(files != null) {
//			for(File file : files) {
//				boolean existFile = false;
//				try {
//					if(noticeService.fineNotice(file.getName()) != null) existFile=existFile || true;
//					if(boardService.findBoard(file.getName()) != null) existFile=existFile || true;
//					if(pdsService.findPds(file.getName()) != null) existFile=existFile || true;
//					
//					if(existFile) {
//						System.out.println(file.getName()+" 파일은 존재합니다");
//						continue;
//					}else {
//						System.out.println(file.getName()+" 파일은 존재하지 않습니다.");
//						file.delete();
//					}
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
}
